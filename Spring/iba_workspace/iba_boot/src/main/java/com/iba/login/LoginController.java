package com.iba.login;

import com.iba.model.Role;
import com.iba.model.User;
import com.iba.repository.RoleRepository;
import com.iba.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleRepository roleRepository;

    @GetMapping({"/", "/login"})
    public String index(Model model) {

        Role role = roleRepository.findByRole(roleRepository.ADMIN_ROLE);
        if(role == null) {
            role = new Role();
            role.setRole(roleRepository.ADMIN_ROLE);
            role.setDescription("Admin role");
            role = roleRepository.save(role);
            System.out.println(role);
        }

        User user = userService.findUserByEmail("test@test.com");
        if(user == null) {
            user = new User();
            user.setFirstName("test name");
            user.setLastName("test last");
            user.setPassword("testing");
            user.setEmail("test@test.com");
            user.setActive(UserService.ACTIVE);
            user = userService.saveUser(user);
            System.out.println(user);
        }
        return "login";
    }



    @GetMapping ("home")
    public String home(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
        model.addAttribute("userName", user.getFirstName() + " ," + user.getLastName());
        model.addAttribute("users", userService.findAll());
        return "home";
    }

    @PostMapping("/update/{id}")
    public String updateUser(@PathVariable("id") long id, @Valid User user, BindingResult result, Model model) {
        if(result.hasErrors()){
            System.out.println("------------------");
            System.out.println(user.toString());
            for (Object object : result.getAllErrors()) {
                if(object instanceof FieldError) {
                    FieldError fieldError = (FieldError) object;

                    System.out.println(fieldError.getCode());
                }

                if(object instanceof ObjectError) {
                    ObjectError objectError = (ObjectError) object;

                    System.out.println(objectError.getCode());
                }
            }
        } else  {
            userService.saveUser(user);
        }
        model.addAttribute("users", userService.findAll());
        return "home";

    }

    @GetMapping("/registration")
    public String registration(Model model){
        //userService.findAll();
        model.addAttribute("user", new User());
        return "registration";
    }

    @PostMapping("/registration")
    public ModelAndView createNewUser(@Valid User user, BindingResult bindingResult) {
        user.setActive(UserService.INACTIVE);
        ModelAndView modelAndView = new ModelAndView();
        User userExists = userService.findUserByEmail(user.getEmail());
        if (userExists != null) {
            bindingResult
                    .rejectValue("email", "error.user",
                            "There is already a user registered with the email provided");
        }
        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("registration");
        } else {
            userService.saveUser(user);
            modelAndView.addObject("successMessage", "User has been registered successfully");
            modelAndView.addObject("user", new User());
            modelAndView.setViewName("registration");
        }
        return modelAndView;
    }

}
