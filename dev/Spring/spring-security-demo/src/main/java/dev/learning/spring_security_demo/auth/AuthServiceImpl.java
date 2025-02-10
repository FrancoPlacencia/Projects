package dev.learning.spring_security_demo.auth;

import dev.learning.spring_security_demo.auth.dto.AuthResponseDTO;
import dev.learning.spring_security_demo.auth.dto.LoginRequestDTO;
import dev.learning.spring_security_demo.auth.dto.RegisterRequestDTO;
import dev.learning.spring_security_demo.common.CommonResponseDTO;
import dev.learning.spring_security_demo.common.ResponseType;
import dev.learning.spring_security_demo.user.Role;
import dev.learning.spring_security_demo.user.User;
import dev.learning.spring_security_demo.user.UserRepository;
import dev.learning.spring_security_demo.util.AppUtil;
import lombok.extern.slf4j.Slf4j;
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

import java.util.Date;

@Slf4j
@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    AuthenticationManager authenticationManager;

    //@Autowired
    //JwtService jwtService;

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


    /**
     * Process the login request (email, password).
     * <ol>
     * <li>Get the <code>Authentication</code> object from the <code>AuthenticationManager</code>.</li>
     * <li>If the user was unable to authenticate throw a <code>UsernameNotFoundException</code> exception.</li>
     * <li>Get the user from the database.</li>
     * <li>If the user was not found return a <b>NOT_FOUND</b> response.</li>
     * <li>If the user its locked throws a <code>UsernameNotFoundException</code> exception.</li>
     * <li>If the user its inactive return a <b>BAD_REQUEST</b> response.</li>
     * </ol>
     *
     * @param request
     * @return
     */
    @Override
    public ResponseEntity<AuthResponseDTO> login(LoginRequestDTO request) {
        try {
            Authentication authentication = authenticationManager
                    .authenticate(new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword()));
            log.info("signin-service-authentication {}", authentication);
            // Unable to authenticate using the credentials
            if (!authentication.isAuthenticated()) {
                log.info("INVALID user credentials");
                throw new UsernameNotFoundException("invalid user request..!!");
            }
            // The user was authenticated
            User user = userRepository.findByEmail(request.getEmail()).orElse(null);
            // NOT_FOUND
            if (user == null) {
                return new ResponseEntity<>(
                        AuthResponseDTO.builder()
                                .type(ResponseType.WARNING.toString())
                                .message("User not found")
                                .build(),
                        HttpStatus.NOT_FOUND
                );
            }
            log.info("user FOUND {}", user);
            // LOCKED
            if (user.getIsLocked()) {
                throw new LockedException("User its locked. Please contact an Admin to unlock your user account.");
            }
            // INACTIVE
            // TODO: Add more information about it.
            if (!user.getIsActive()) {
                return new ResponseEntity<>(
                        AuthResponseDTO.builder()
                                .type(ResponseType.WARNING.toString())
                                .message("User is inactive.")
                                .build(),
                        HttpStatus.BAD_REQUEST
                );
            }
            // Generate JWT string
            String jwt = "HOLA";
            /*
            String jwt = jwtService.getToken(user);
            clearAttempts(user);
             */
            return new ResponseEntity<>(AuthResponseDTO.builder().token(jwt).build(), HttpStatus.OK);
        } catch (BadCredentialsException badCredentialsException) {
            log.info("ERROR trying to authenticate the user");
            User user = userRepository.findByEmail(request.getEmail()).orElse(null);
            if (user != null) {
                // incrementAttempts(user);
                if (user.getIsLocked()) {
                    throw new LockedException("User its locked. Please contact an Admin to unlock your user account.");
                }
            }
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        } catch (LockedException exception) {
            log.info("ERROR user its locked");
            return new ResponseEntity<>(null, HttpStatus.LOCKED);
        }
    }


    /**
     * creates the user using the request data
     * validates if all the requirement information its there
     * validates if the user email exists on the system
     *
     * @return OK USER_REGISTERED<br>
     * BAD_REQUEST USER_EMAIL_ALREADY_EXISTS or INVALID_DATA
     */
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
                    .title("DUMMY TITLE")
                    .bio("DUMMY BIO")
                    .phone("000-000-00-00")
                    .address("Street 1, City and Country")

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
            if (AppUtil.isNullOrEmptyString(user.getEmail()) ||
                    AppUtil.isNullOrEmptyString(user.getPassword()) ||
                    AppUtil.isNullOrEmptyString(user.getFirstName()) ||
                    AppUtil.isNullOrEmptyString(user.getLastName())
            ) {
                return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
            }
            /*
            // validate email
            if (!request.getEmail().matches(EMAIL_PATTERN)) {
                return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
            }

            // validate password
            if (!request.getPassword().matches(PASSWORD_PATTERN)) {
                return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
            }
            */
            User dbUser = userRepository.findByEmail(user.getEmail()).orElse(null);
            if (dbUser != null) {
                return new ResponseEntity<>(null, HttpStatus.CONFLICT);
            }
            userRepository.save(user);
            return new ResponseEntity<>(null, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
/*
    public ResponseEntity<CommonResponseDTO> forgot(ForgotRequestDTO request) {
        User user = userRepository.findByEmail(request.getEmail()).orElse(null);
        // User NOT FOUND
        if (user == null) {
            log.info("user NOT FOUND");
            return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.USER_NOT_FOUND, "Please review your email and try again.", HttpStatus.BAD_REQUEST);
        }
        log.info("user FOUND {}", user);
        if (StringUtils.isEmpty(user.getForgotToken()) || user.getForgotExpiresOn().before(new Date(System.currentTimeMillis()))) {
            //String token = RandomStringUtils.randomAlphabetic(30);
            String token = UUID.randomUUID().toString();
            user.setForgotToken(token);
            user.setForgotCreatedOn(new Date(System.currentTimeMillis()));
            user.setForgotExpiresOn(new Date(System.currentTimeMillis() + (3600 * 1000)));

            userRepository.save(user);
            String resetPasswordLink = "/reset-password?token=" + token;
            log.info(">>> {}", resetPasswordLink);
            return CHFSResponseUtil.getCommonResponseEntity(ResponseType.SUCCESS, CHFSConstants.USER_FORGOT_PASSWORD, "We have sent a reset password link to your email, please review.", HttpStatus.OK);
        }
        return CHFSResponseUtil.getCommonResponseEntity(ResponseType.SUCCESS, CHFSConstants.USER_FORGOT_PASSWORD, "We have already sent password link to your email, please review.", HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CommonResponseDTO> reset(ResetRequestDTO request) {
        if (StringUtils.isEmpty(request.getToken())) {
            log.info("token not present");
            return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.USER_NOT_FOUND, "Token its not present.", HttpStatus.BAD_REQUEST);
        }
        if (StringUtils.isEmpty(request.getEmail()) ||
                StringUtils.isEmpty(request.getPassword())) {
            log.info("missing mandatory fields");
            return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.USER_NOT_FOUND, "Missing mandatory fields.", HttpStatus.BAD_REQUEST);
        }
        User user = userRepository.findByEmail(request.getEmail()).orElse(null);
        if (user == null) {
            log.info("user NOT FOUND");
            return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.USER_NOT_FOUND, "Please review your email and try again.", HttpStatus.BAD_REQUEST);
        }
        log.info("user FOUND {}", user);
        if (!user.getForgotToken().equals(request.getToken())) {
            log.info("wrong Token");
            return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.USER_NOT_FOUND, "Wrong token", HttpStatus.BAD_REQUEST);
        }
        if (user.getForgotExpiresOn().before(new Date(System.currentTimeMillis()))) {
            log.info("expired Token");
            return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.USER_NOT_FOUND, "Expired token", HttpStatus.BAD_REQUEST);
        }
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setForgotToken("");
        user.setForgotCreatedOn(null);
        user.setForgotExpiresOn(null);
        userRepository.save(user);
        return CHFSResponseUtil.getCommonResponseEntity(ResponseType.SUCCESS, CHFSConstants.USER_FORGOT_PASSWORD, "Password successfully reset.",
                HttpStatus.OK);
    }

    private void sendPasswordURL(User user) {
        /
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(user.getEmail());
        mailMessage.setSubject("Reset Password");
        mailMessage.setText("To reset your password, click the link below:\n" + "RECOVERY URL");
        javaMailSender.send(mailMessage);
        /
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
        if (user.getFailedLogins() > 3) {
            user.setIsLocked(true);
        }
        userRepository.save(user);
    }

    private void clearAttempts(User user) {
        if (user.getFailedLogins() > 0) {
            user.setFailedLogins(0);
            user.setLastFailedLogin(null);
            userRepository.save(user);
        }
    }
*/

}