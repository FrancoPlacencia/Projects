package org.tvmtz.volley_api.auth;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.tvmtz.volley_api.auth.dto.LoginRequestDTO;
import org.tvmtz.volley_api.auth.dto.RegisterRequestDTO;
import org.tvmtz.volley_api.common.CommonResponse;
import org.tvmtz.volley_api.user.Role;
import org.tvmtz.volley_api.user.User;
import org.tvmtz.volley_api.user.UserRepository;
import org.tvmtz.volley_api.util.AppConstants;
import org.tvmtz.volley_api.util.AppUtil;
import org.tvmtz.volley_api.util.JwtUtil;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Service
public class AuthServiceImpl implements AuthService {


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

    @Autowired
    UserRepository userRepository;
    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    JwtUtil jwtUtil;


    //@Autowired
    //JwtService jwtService;

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
    public ResponseEntity<CommonResponse> login(LoginRequestDTO request) {
        try {
            User user = userRepository.findByEmail(request.getEmail()).orElse(null);
            // NOT FOUND
            if (user == null) {
                return new ResponseEntity<>(
                        CommonResponse.builder()
                                .response("User not found")
                                .build(),
                        HttpStatus.NOT_FOUND
                );
            }

            // LOCKED
            if (user.getIsLocked()) {
                throw new LockedException("User its locked. Please contact an Admin to unlock your user account.");
            }

            // INACTIVE
            if (!user.getIsActive()) {
                return new ResponseEntity<>(
                        CommonResponse.builder()
                                .response("User is inactive.")
                                .build(),
                        HttpStatus.BAD_REQUEST
                );
            }

            // FOUND
            Authentication authentication = authenticationManager
                    .authenticate(new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword()));

            // WRONG CREDENTIALS
            if (!authentication.isAuthenticated()) {
                log.info("INVALID user credentials");
                throw new BadCredentialsException("invalid user request..!!");
            }

            // AUTHENTICATED
            clearAttempts(user);
            return new ResponseEntity<>(
                    CommonResponse.builder()
                            .response(jwtUtil.generateJWT(authentication))
                            .build(),
                    HttpStatus.OK
            );
        } catch (BadCredentialsException badCredentialsException) {
            log.info("ERROR trying to authenticate the user");
            User user = userRepository.findByEmail(request.getEmail()).orElse(null);
            if (user != null) {
                incrementAttempts(user);
                if (user.getIsLocked()) {
                    throw new LockedException("User its locked. Please contact an Admin to unlock your user account.");
                }
            }
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        } catch (LockedException exception) {
            return new ResponseEntity<>(
                    CommonResponse.builder()
                            .response(exception.getMessage())
                            .build(),
                    HttpStatus.LOCKED
            );
        }
    }

    @Override
    public ResponseEntity<CommonResponse> register(RegisterRequestDTO request) {
        log.info("signup request {}", request);
        CommonResponse commonResponse;
        List<String> errors = new ArrayList<>();
        // Validate mandatory fields
        if (AppUtil.isNullOrEmptyString(request.getEmail())) {
            errors.add("Missing Email");
        }
        if (AppUtil.isNullOrEmptyString(request.getPassword())) {
            errors.add("Missing Password");
        }
        if (AppUtil.isNullOrEmptyString(request.getFirstName())) {
            errors.add("Missing First Name");
        }
        if (AppUtil.isNullOrEmptyString(request.getLastName())) {
            errors.add("Missing Last Name");
        }
        if (!errors.isEmpty()) {
            commonResponse = CommonResponse.builder()
                    .response(AppConstants.USER + " " + AppConstants.MISSING_DATA)
                    .errors(errors)
                    .build();
            return new ResponseEntity<>(commonResponse, HttpStatus.BAD_REQUEST);
        }
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
            return new ResponseEntity<>(null, HttpStatus.CREATED);
        } catch (Exception e) {
            log.error("exception on register ", e);
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
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


}
