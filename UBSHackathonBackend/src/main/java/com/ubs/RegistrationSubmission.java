package com.ubs;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.List;

@RequiredArgsConstructor
@Data
public class RegistrationSubmission {
    private final String userName;
    private final List<String> cuisines;
    private final List<String> interests;
    private final String bio;
}
