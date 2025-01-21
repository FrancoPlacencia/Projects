package com.fpc.chfs.churchfinancialsystem.user;

import com.fpc.chfs.churchfinancialsystem.user.dto.UserResponseDTO;
import com.fpc.chfs.churchfinancialsystem.user.dto.UpdateUserRequestDTO;
import com.fpc.chfs.churchfinancialsystem.shared.dto.CommonResponseDTO;
import com.fpc.chfs.churchfinancialsystem.util.CHFSConstants;
import com.fpc.chfs.churchfinancialsystem.util.CHFSResponseUtil;
import com.fpc.chfs.churchfinancialsystem.util.CHFSUtil;
import com.fpc.chfs.churchfinancialsystem.util.ResponseType;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    public ResponseEntity<UserResponseDTO> getUserForAdmin(String email) {
        if (StringUtils.isEmpty(email)) {
            log.info("email not present");
            UserResponseDTO userResponseDTO = getUserDTO(null, new CommonResponseDTO(
                    ResponseType.ERROR.toString(),
                    CHFSConstants.INVALID_DATA,
                    CHFSConstants.BAD_REQUEST
            ));
            return new ResponseEntity<>(userResponseDTO, HttpStatus.BAD_REQUEST);
        } else {
            log.info("email present");
            User user = userRepository.findByEmail(email).orElse(null);
            log.info("db user " + user);
            if (user == null) {
                log.info("user not found");
                UserResponseDTO userResponseDTO = getUserDTO(null, new CommonResponseDTO(
                        ResponseType.WARNING.toString(),
                        CHFSConstants.USER_NOT_FOUND,
                        CHFSConstants.BAD_REQUEST
                ));
                return new ResponseEntity<>(userResponseDTO, HttpStatus.BAD_REQUEST);
            } else {
                log.info("user found");
                return new ResponseEntity<>(getUserDTO(user, new CommonResponseDTO(
                        ResponseType.SUCCESS.toString(),
                        CHFSConstants.INVALID_DATA,
                        CHFSConstants.BAD_REQUEST
                )), HttpStatus.OK);
            }
        }
    }

    public ResponseEntity<List<UserResponseDTO>> getUsersForAdmin() {
        List<User> users = userRepository.findAll();
        if (!users.isEmpty()) {
            List<UserResponseDTO> userResponseDTOs = new ArrayList<UserResponseDTO>();
            for (User user : users) {
                userResponseDTOs.add(getUserDTO(user, new CommonResponseDTO(
                        ResponseType.SUCCESS.toString(),
                        CHFSConstants.USER_REGISTERED,
                        "")));
            }
            return new ResponseEntity<>(userResponseDTOs, HttpStatus.OK);
        }
        return new ResponseEntity<>(new ArrayList<>(), HttpStatus.NOT_FOUND);
    }

    public ResponseEntity<CommonResponseDTO> deleteUser(String email) {
        if (!email.isEmpty()) {
            User user = userRepository.findByEmail(email).orElse(null);
            if (user == null) {
                log.info("no user found for delete");
                return CHFSResponseUtil.getCommonResponseEntity(ResponseType.WARNING, CHFSConstants.USER_NOT_FOUND, "", HttpStatus.NOT_FOUND);
            } else {
                log.info("deleting user");
                userRepository.delete(user);
                return CHFSResponseUtil.getCommonResponseEntity(ResponseType.SUCCESS, CHFSConstants.USER_DELETED, "", HttpStatus.OK);

            }
        } else {
            log.info("param not present");
            return CHFSResponseUtil.getCommonResponseEntity(ResponseType.ERROR, CHFSConstants.INVALID_DATA, "", HttpStatus.BAD_REQUEST);
        }
    }

    public ResponseEntity<UserResponseDTO> updateUser(UpdateUserRequestDTO request) {
        User user = User.builder()
                .username(request.getEmail())

                .email(request.getEmail())

                .firstName(request.getFirstName())
                .lastName(request.getLastName())

                .role(request.getRole())

                .phone(request.getPhone())
                .address(request.getAddress())
                .title(request.getTitle())
                .bio(request.getBio())

                .isActive(request.getIsActive())

                .isLocked(request.getIsLocked())
                .build();
        log.info("user request " + user);
        if (!user.getEmail().isEmpty()) {
            log.info("email in request");
            User dbUser = userRepository.findByEmail(user.getEmail()).orElse(null);
            if (dbUser == null) {
                log.info("User NOT FOUND");
                return new ResponseEntity<>(getUserDTO(user, new CommonResponseDTO(
                        ResponseType.WARNING.toString(),
                        CHFSConstants.USER_NOT_FOUND,
                        CHFSConstants.BAD_REQUEST
                )), HttpStatus.BAD_REQUEST);
            } else {
                log.info("User FOUND " + dbUser);
                compareUsers(user, dbUser);
                userRepository.save(dbUser);
                return new ResponseEntity<>(getUserDTO(dbUser, new CommonResponseDTO(
                        ResponseType.SUCCESS.toString(),
                        CHFSConstants.USER_UPDATED,
                        CHFSConstants.USER_UPDATED_MESSAGE
                )), HttpStatus.OK);
            }

        } else {
            log.info("param not present");
            User dbUser = userRepository.findByEmail(user.getEmail()).orElse(null);
            if (dbUser == null) {
                log.info("USER NOT FOUND");
            }

            UserResponseDTO userResponseDTO = getUserDTO(null,
                    new CommonResponseDTO(
                            ResponseType.ERROR.toString(),
                            CHFSConstants.INVALID_DATA,
                            "The request has bad format")
            );
            return new ResponseEntity<UserResponseDTO>(userResponseDTO, HttpStatus.BAD_REQUEST);
        }
    }


    private UserResponseDTO getUserDTO(User user, CommonResponseDTO commonResponseDTO) {
        UserResponseDTO userResponseDTO;
        if (user == null) {
            userResponseDTO = new UserResponseDTO();
            setCommonResponseDTO(userResponseDTO, commonResponseDTO);
        } else {
            userResponseDTO = UserResponseDTO.builder()
                    .userId(user.getUserId())
                    .firstName(user.getFirstName())
                    .lastName(user.getLastName())
                    .email(user.getEmail())
                    .role(user.getRole())
                    .address(user.getAddress())
                    .phone(user.getPhone())
                    .title(user.getTitle())
                    .bio(user.getBio())
                    .isActive(user.getIsActive())
                    .isLocked(user.getIsLocked())
                    .createdOn(user.getCreatedOn())
                    .churches(user.getChurches())
                    .build();
            setCommonResponseDTO(userResponseDTO, commonResponseDTO);
        }
        return userResponseDTO;
    }

    private void setCommonResponseDTO(UserResponseDTO userResponseDTO, CommonResponseDTO commonResponseDTO) {
        userResponseDTO.setResponseType(commonResponseDTO.getResponseType());
        userResponseDTO.setResponseTitle(commonResponseDTO.getResponseTitle());
        userResponseDTO.setResponseMessage(commonResponseDTO.getResponseMessage());
    }

    /**
     * Avoid updating all the user, will compare the fields and update the DB User.
     *
     * @param user
     * @param dbUser
     */
    private void compareUsers(User user, User dbUser) {
        if (!user.getFirstName().equals(dbUser.getFirstName())) {
            dbUser.setFirstName(user.getFirstName());
        }
        if (!user.getLastName().equals(dbUser.getLastName())) {
            dbUser.setLastName(user.getLastName());
        }
        if (!user.getRole().equals(dbUser.getRole())) {
            dbUser.setRole(user.getRole());
        }
        if (!user.getPhone().equals(dbUser.getPhone())) {
            dbUser.setPhone(user.getPhone());
        }
        if (!user.getAddress().equals(dbUser.getAddress())) {
            dbUser.setAddress(user.getAddress());
        }
        if (!user.getTitle().equals(dbUser.getTitle())) {
            dbUser.setTitle(user.getTitle());
        }
        if (!user.getAddress().equals(dbUser.getAddress())) {
            dbUser.setAddress(user.getAddress());
        }
        if (!user.getBio().equals(dbUser.getBio())) {
            dbUser.setBio(user.getBio());
        }
        if (!user.getIsActive().equals(dbUser.getIsActive())) {
            dbUser.setIsActive(user.getIsActive());
        }
        if (!user.getIsLocked().equals(dbUser.getIsLocked())) {
            dbUser.setIsLocked(user.getIsLocked());
        }

    }


    public Integer getUserID() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal instanceof UserDetails ? ((UserDetails) principal).getUsername() : principal.toString();
        if (!StringUtils.isEmpty(username)) {
            User user = userRepository.findByEmail(username).orElse(null);
            return user != null ? user.getUserId() : 0;
        }
        return -1;
    }

    public String getUserName(Integer userId) {
        return "user";
        /*
        User user = userRepository.findByUserId(userId).orElse(null);
        if (user != null) {
            return user.getFirstName() + ", " + user.getLastName();
        }
        return "";

         */
    }

}

