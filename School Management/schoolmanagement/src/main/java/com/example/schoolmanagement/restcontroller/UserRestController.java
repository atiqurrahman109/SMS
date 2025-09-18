package com.example.schoolmanagement.restcontroller;

import com.example.schoolmanagement.entity.Student;
import com.example.schoolmanagement.entity.Teacher;
import com.example.schoolmanagement.entity.User;
import com.example.schoolmanagement.repository.IUserRepo;
import com.example.schoolmanagement.service.AuthService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/user")
public class UserRestController {

    @Autowired
    private AuthService authService;

    @Autowired
    private IUserRepo userReporisitoryo;


    @Autowired
    private ObjectMapper objectMapper;




    @PostMapping("/registerstudent")
    public ResponseEntity<Map<String, String>> registerStudent(
            @RequestPart("user") String userJson,
            @RequestPart("student") String studentJson,
            @RequestPart("photo") MultipartFile file
    ) {
        try {
            User user = objectMapper.readValue(userJson, User.class);
            Student student = objectMapper.readValue(studentJson, Student.class);

            authService.registerStudent(user, file, student);

            Map<String, String> response = new HashMap<>();
            response.put("message", "Student registered successfully");
            return new ResponseEntity<>(response, HttpStatus.OK);

        } catch (JsonProcessingException e) {
            e.printStackTrace();
            Map<String, String> error = new HashMap<>();
            error.put("message", "Invalid JSON: " + e.getMessage());
            return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, String> error = new HashMap<>();
            error.put("message", "Registration failed: " + e.getMessage());
            return new ResponseEntity<>(error, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/register-teacher")
    public ResponseEntity<String> registerTeacher(
            @RequestPart("user") User user,
            @RequestPart("teacher") Teacher teacher,
            @RequestPart(value = "photo", required = false) MultipartFile imageFile) {

        try {
            authService.registerTeacher(user, imageFile, teacher);
            return ResponseEntity.ok("Teacher registered successfully.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error registering teacher: " + e.getMessage());
        }
    }

}
