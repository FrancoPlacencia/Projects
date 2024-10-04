package com.fpc.chfs.churchfinancialsystem.jwt;

import org.springframework.security.core.userdetails.UserDetails;

public interface JwtServiceInterface {

    String extractUserName(String token);

    String getToken(UserDetails userDetails);

    boolean isTokenValid(String token, UserDetails userDetails);
}
