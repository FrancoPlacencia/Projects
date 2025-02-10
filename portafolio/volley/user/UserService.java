package org.tvmtz.volley_api.user;

import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.tvmtz.volley_api.common.CommonResponse;
import org.tvmtz.volley_api.user.dto.UserDTO;
import org.tvmtz.volley_api.util.AppConstants;
import org.tvmtz.volley_api.util.AppUtil;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    ModelMapper modelMapper;

    public ResponseEntity<UserDTO> getUser(String email) {
        // BAD REQUEST
        if (AppUtil.isNullOrEmptyString(email)) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        // NOT FOUND
        User user = userRepository.findByEmail(email).orElse(null);
        if (user == null) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(modelMapper.map(user, UserDTO.class), HttpStatus.OK);
    }

    public ResponseEntity<List<UserDTO>> getUsers() {
        List<User> users = userRepository.findAll();
        // NOT FOUND
        if (users.isEmpty()) {
            return new ResponseEntity<>(new ArrayList<>(), HttpStatus.NOT_FOUND);
        }
        List<UserDTO> userDTOs = new ArrayList<>();
        for (User user : users) {
            userDTOs.add(modelMapper.map(user, UserDTO.class));
        }
        return new ResponseEntity<>(userDTOs, HttpStatus.OK);
    }

    public ResponseEntity<UserDTO> updateUser(UserDTO userDto) {
        // BAD REQUEST
        if (AppUtil.isNullOrEmptyString(userDto.getEmail())) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        // NOT FOUND
        User dbUser = userRepository.findByEmail(userDto.getEmail()).orElse(null);
        if (dbUser == null) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
        // OK
        compareUsers(modelMapper.map(userDto, User.class), dbUser);
        userRepository.save(dbUser);
        return new ResponseEntity<>(modelMapper.map(dbUser, UserDTO.class), HttpStatus.OK);
    }

    public ResponseEntity<CommonResponse> deleteUser(String email) {
        CommonResponse commonResponse;
        // BAD REQUEST
        if (AppUtil.isNullOrEmptyString(email)) {
            commonResponse = CommonResponse.builder().response(AppConstants.USER + " " + AppConstants.MISSING_DATA).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.BAD_REQUEST);
        }
        User user = userRepository.findByEmail(email).orElse(null);
        // NOT FOUND
        if (user == null) {
            commonResponse = CommonResponse.builder().response(AppConstants.USER + " " + AppConstants.NOT_FOUND).build();
            return new ResponseEntity<>(commonResponse, HttpStatus.NOT_FOUND);
        }
        // OK
        userRepository.delete(user);
        commonResponse = CommonResponse.builder().response(AppConstants.USER + " " + AppConstants.DELETED).build();
        return new ResponseEntity<>(commonResponse, HttpStatus.OK);
    }

/*
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
*/

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
        if (!AppUtil.isNullOrEmptyString(username)) {
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


