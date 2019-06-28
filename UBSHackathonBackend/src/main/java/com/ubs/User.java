package com.ubs;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Data
public class User {
    private final String username;
    private final String firstName;
    private final String lastName;
}
