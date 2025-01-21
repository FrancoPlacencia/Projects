package com.fpc.chfs.churchfinancialsystem.auth;

import java.util.Date;
import java.util.Objects;
import java.util.UUID;

import com.fpc.chfs.churchfinancialsystem.auth.dto.*;
import com.fpc.chfs.churchfinancialsystem.jwt.JwtService;
import com.fpc.chfs.churchfinancialsystem.shared.dto.CommonResponseDTO;
import com.fpc.chfs.churchfinancialsystem.util.CHFSResponseUtil;
import com.fpc.chfs.churchfinancialsystem.util.ResponseType;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.fpc.chfs.churchfinancialsystem.user.Role;
import com.fpc.chfs.churchfinancialsystem.user.User;
import com.fpc.chfs.churchfinancialsystem.user.UserRepository;
import com.fpc.chfs.churchfinancialsystem.util.CHFSConstants;
import com.fpc.chfs.churchfinancialsystem.util.CHFSUtil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    JwtService jwtService;

    //@Autowired
    //JavaMailSender javaMailSender;

    private static final String EMAIL_PATTERN = "^[a-zA-Z0-9_!#$%&’*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";

    /**
     * Security password requirements:
     * <ol>
     * <li>Password must contain at least one digit [0-9].</li>
     * <li>Password must contain at least one lowercase Latin character [a-z].</li>
     * <li>Password must contain at least one uppercase Latin character [A-Z].</li>
     * <li>Password must contain at least one special character like ! @ # & ( ).</li>
     * <li>Password must contain a length of at least 8 characters and a maximum of 20 characters.</li>
     * </ol>
     */
    private static final String PASSWORD_PATTERN = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$";



    @Override
    public ResponseEntity<AuthResponseDTO> login(LoginRequestDTO request) {
        try {
            Authentication authentication = authenticationManager
                    .authenticate(new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword()));
            log.info("signin-service-authentication {}", authentication);
            if (authentication.isAuthenticated()) {
                User user = userRepository.findByEmail(request.getEmail()).orElse(null);
                if (user == null) {
                    log.info("user NOT FOUND");
                    return CHFSResponseUtil.getResponseEntityJwt(ResponseType.WARNING, CHFSConstants.USER_NOT_FOUND, "Please create a user before trying to login.",  "", HttpStatus.BAD_REQUEST);
                }
                log.info("user FOUND {}", user);
                if(user.getIsLocked()){
                    log.info("user LOCKED");
                    return CHFSResponseUtil.getResponseEntityJwt(ResponseType.LOCK, CHFSConstants.USER_LOCKED, "You have enter incorrect email and password too many times your user account its locked, please contact an Admin.","", HttpStatus.LOCKED);
                }
                if(!user.getIsActive()){
                    log.info("user INACTIVE");
                    return CHFSResponseUtil.getResponseEntityJwt(ResponseType.WARNING, CHFSConstants.USER_INACTIVE,  "Your account its currently not active, please contact an Admin.","", HttpStatus.BAD_REQUEST);
                }
                log.info("user OK {}", user);
                String jwt = jwtService.getToken(user);
                clearAttempts(user);
                return CHFSResponseUtil.getResponseEntityJwt(ResponseType.SUCCESS, CHFSConstants.USER_AUTHENTICATED,"OK",  jwt, HttpStatus.OK);
            } else {
                log.info("INVALID user credentials");
                throw new UsernameNotFoundException("invalid user request..!!");
            }
        } catch (BadCredentialsException badCredentialsException) {
            log.info("ERROR trying to authenticate the user");
            User user = userRepository.findByEmail(request.getEmail()).orElse(null);
            if (user != null) {
                incrementAttempts(user);
                if(user.getIsLocked()) {
                    return CHFSResponseUtil.getResponseEntityJwt(ResponseType.LOCK,CHFSConstants.USER_LOCKED, "You have enter incorrect email and password too many times your user account its locked, please contact an Admin.","", HttpStatus.BAD_REQUEST);
                }
            }
            return CHFSResponseUtil.getResponseEntityJwt(ResponseType.KEY, CHFSConstants.USER_UNAUTHORIZED, "Your email or password its incorrect." ,"", HttpStatus.BAD_REQUEST);
        } catch (LockedException exception) {
            log.info("ERROR user its locked");
            return CHFSResponseUtil.getResponseEntityJwt(ResponseType.LOCK, CHFSConstants.USER_LOCKED, "Please contact an Admin to unlock your user account.","", HttpStatus.LOCKED);
        }
    }

    /**
     * creates the user using the request data
     * validates if all the requirement information its there
     * validates if the user email exists on the system
     *
     * @return OK USER_REGISTERED<br>
     * BAD_REQUEST USER_EMAIL_ALREADY_EXISTS or INVALID_DATA
     **/
    @Override
    public ResponseEntity<CommonResponseDTO> register(RegisterRequestDTO request) {
        ResponseEntity<AuthResponseDTO> authResponseDTOResponseEntity;
        log.info("signup request {}", request);
        try {

            User user = User.builder()
                    .username(request.getEmail())

                    .email(request.getEmail())
                    .password(passwordEncoder.encode(request.getPassword()))

                    .firstName(request.getFirstName())
                    .lastName(request.getLastName())

                    .role(Role.USER)

                    .phone("000-000-00-00")
                    .address("Street 1, City and Country")
                    .title(request.getTitle())
                    .bio(request.getBio())

                    .isActive(false)
                    .createdOn(new Date(System.currentTimeMillis()))

                    .isLocked(false)
                    .failedLogins(0)
                    .lastFailedLogin(null)

                    .forgotToken(null)
                    .forgotCreatedOn(null)
                    .forgotExpiresOn(null)

                    .build();

            // validate mandatory fields
            if (
                StringUtils.isEmpty(user.getEmail()) ||
                StringUtils.isEmpty(user.getPassword()) ||

                StringUtils.isEmpty(user.getFirstName()) ||
                StringUtils.isEmpty(user.getLastName()) ||

                StringUtils.isEmpty(user.getTitle()) ||
                StringUtils.isEmpty(user.getBio())
            ) {
                return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.INVALID_DATA, "Missing mandatory fields", HttpStatus.BAD_REQUEST);
            }

            // validate email
            if(!request.getEmail().matches(EMAIL_PATTERN)) {
                return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.INVALID_DATA, "Email bad format", HttpStatus.BAD_REQUEST);
            }

            // validate password
            if(!request.getPassword().matches(PASSWORD_PATTERN)) {
                return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.INVALID_DATA, "Password bad format", HttpStatus.BAD_REQUEST);
            }

            User dbUser = userRepository.findByEmail(user.getEmail()).orElse(null);
            if (Objects.isNull(dbUser)) {
                userRepository.save(user);
                return CHFSResponseUtil.getCommonResponseEntity(ResponseType.SUCCESS, CHFSConstants.USER_REGISTERED, "Please wait until your access is approved.",  HttpStatus.OK);
            } else {
                return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.USER_EMAIL_ALREADY_EXISTS,"The email already exist please enter a new email.",
                        HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            // e.printStackTrace();
            return CHFSResponseUtil.getCommonResponseEntity(ResponseType.ERROR, CHFSConstants.SOMETHING_WENT_WRONG, "Oops something went wrong", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public ResponseEntity<CommonResponseDTO> forgot(ForgotRequestDTO request) {
        User user = userRepository.findByEmail(request.getEmail()).orElse(null);
        // User NOT FOUND
        if (user == null) {
            log.info("user NOT FOUND");
            return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.USER_NOT_FOUND, "Please review your email and try again.",  HttpStatus.BAD_REQUEST);
        }
        log.info("user FOUND {}", user);
        if(StringUtils.isEmpty(user.getForgotToken()) || user.getForgotExpiresOn().before(new Date(System.currentTimeMillis()))) {
            //String token = RandomStringUtils.randomAlphabetic(30);
            String token = UUID.randomUUID().toString();
            user.setForgotToken(token);
            user.setForgotCreatedOn(new Date(System.currentTimeMillis()));
            user.setForgotExpiresOn(new Date(System.currentTimeMillis() + (3600 * 1000) ));

            userRepository.save(user);
            String resetPasswordLink = "/reset-password?token=" + token;
            log.info(">>> {}", resetPasswordLink);
            return CHFSResponseUtil.getCommonResponseEntity(ResponseType.SUCCESS, CHFSConstants.USER_FORGOT_PASSWORD,"We have sent a reset password link to your email, please review.", HttpStatus.OK);
        }
        return CHFSResponseUtil.getCommonResponseEntity(ResponseType.SUCCESS, CHFSConstants.USER_FORGOT_PASSWORD,"We have already sent password link to your email, please review.", HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CommonResponseDTO> reset(ResetRequestDTO request) {
        if(StringUtils.isEmpty(request.getToken())){
            log.info("token not present");
            return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.USER_NOT_FOUND, "Token its not present.",  HttpStatus.BAD_REQUEST);
        }
        if(StringUtils.isEmpty(request.getEmail()) ||
                StringUtils.isEmpty(request.getPassword())){
            log.info("missing mandatory fields");
            return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.USER_NOT_FOUND, "Missing mandatory fields.",  HttpStatus.BAD_REQUEST);
        }
        User user = userRepository.findByEmail(request.getEmail()).orElse(null);
        if (user == null) {
            log.info("user NOT FOUND");
            return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.USER_NOT_FOUND, "Please review your email and try again.",  HttpStatus.BAD_REQUEST);
        }
        log.info("user FOUND {}", user);
        if(!user.getForgotToken().equals(request.getToken()) ) {
            log.info("wrong Token");
            return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.USER_NOT_FOUND, "Wrong token",  HttpStatus.BAD_REQUEST);
        }
        if(user.getForgotExpiresOn().before(new Date(System.currentTimeMillis()))){
            log.info("expired Token");
            return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.USER_NOT_FOUND, "Expired token",   HttpStatus.BAD_REQUEST);
        }
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setForgotToken("");
        user.setForgotCreatedOn(null);
        user.setForgotExpiresOn(null);
        userRepository.save(user);
        return CHFSResponseUtil.getCommonResponseEntity(ResponseType.SUCCESS, CHFSConstants.USER_FORGOT_PASSWORD,"Password successfully reset.",
                HttpStatus.OK);
    }

    private void sendPasswordURL(User user) {
        /*
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(user.getEmail());
        mailMessage.setSubject("Reset Password");
        mailMessage.setText("To reset your password, click the link below:\n" + "RECOVERY URL");
        javaMailSender.send(mailMessage);
        */
    }

    private void unlockUser(User user) {
        log.info("Unlock User");
        user.setIsLocked(false);
        user.setFailedLogins(0);
        userRepository.save(user);
    }

    private void incrementAttempts(User user) {
        log.info("Increment Attempt");
        user.setFailedLogins(user.getFailedLogins() + 1);
        user.setLastFailedLogin(new Date(System.currentTimeMillis()));
        if(user.getFailedLogins() > 3) {
            user.setIsLocked(true);
        }
        userRepository.save(user);
    }

    private void clearAttempts(User user) {
        if(user.getFailedLogins() > 0) {
            user.setFailedLogins(0);
            user.setLastFailedLogin(null);
            userRepository.save(user);
        }
    }


}