package com.ubs.controller;

import com.ubs.RegistrationSubmission;
import com.ubs.User;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1")
public class IndexController {
    private static List<String> CUISINE_DATA = Arrays.asList("Turkish", "Thai", "Polish", "German", "Japenese");
    private static List<String> INTEREST_DATA = Arrays.asList("Football", "Politics", "Traveling", "Arts");

    private final RestTemplate restTemplate;

    public IndexController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @RequestMapping(value = "/cuisines", method = RequestMethod.GET)
    @CrossOrigin(origins = {"http://localhost:4200", "http://localhost:8080"})
    public ResponseEntity<List<String>> getAllCuisines() {
        return ResponseEntity.ok(CUISINE_DATA);
    }

    @RequestMapping(value = "/cuisines/{cuisinename}", method = RequestMethod.GET)
    @CrossOrigin(origins = {"http://localhost:4200", "http://localhost:8080"})
    public ResponseEntity<List<String>> searchCuisines(@PathVariable String cuisinename) {
        List<String> foundCuisines = CUISINE_DATA.stream().filter(c -> c.startsWith(cuisinename)).collect(Collectors.toList());
        return ResponseEntity.ok(foundCuisines);
    }

    @RequestMapping(value = "/interests", method = RequestMethod.GET)
    @CrossOrigin(origins = {"http://localhost:4200", "http://localhost:8080"})
    public ResponseEntity<List<String>> getAllInterests() {
        return ResponseEntity.ok(INTEREST_DATA);
    }

    @RequestMapping(value = "/submissionsstr", method = RequestMethod.POST)
    @CrossOrigin(origins = {"http://localhost:4200", "http://localhost:8080"})
    public void createRegistrationString(@RequestBody String registrationSubmission) {
        restTemplate.postForLocation("http://192.168.8.111:5000/api/v1/request", null);
        System.out.println(registrationSubmission);
    }

    @RequestMapping(value = "/submissions", method = RequestMethod.POST)
    @CrossOrigin(origins = {"http://localhost:4200", "http://localhost:8080"})
    public void createRegistration(@RequestBody RegistrationSubmission registrationSubmission) {
        System.out.println(registrationSubmission);
    }

    @RequestMapping(value = "/users/{username}", method = RequestMethod.GET)
    @CrossOrigin(origins = {"http://localhost:4200", "http://localhost:8080"})
    public ResponseEntity<User> getBasicUserData(@PathVariable String username) {
        User user = new User("aslant", "tugrul", "aslan");
        return ResponseEntity.ok(user);
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    @CrossOrigin(origins = "http://localhost:4200")
    private ResponseEntity<List<User>> getAllUsers() {
        User user = new User("aslant", "tugrul", "aslan");
        User user2 = new User("yusufk", "Yusuf", "king");
        List<User> users = Arrays.asList(user, user2);
        return ResponseEntity.ok(users);
    }
}
