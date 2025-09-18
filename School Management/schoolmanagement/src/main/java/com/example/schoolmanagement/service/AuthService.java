package com.example.schoolmanagement.service;

import com.example.schoolmanagement.entity.*;
import com.example.schoolmanagement.repository.ISchoolClassRepo;
import com.example.schoolmanagement.repository.ISectionRepo;
import com.example.schoolmanagement.repository.IStudentRepo;
import com.example.schoolmanagement.repository.IUserRepo;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@Service
public class AuthService {

//    @Autowired
//    private PasswordEncoder passwordEncoder;

    @Autowired
    private IUserRepo userRepo;

   @Autowired
   private IStudentRepo studentRepo;

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private ISectionRepo  sectionRepo;

    @Autowired
    private ISchoolClassRepo schoolClassRepo;



    @Value("src/main/resources/static/images")
    private String uploadDir;


    public List<User> findAll() {
        return userRepo.findAll();
    }

    public User findById(int id) {
        return userRepo.findById(id).get();
    }

    public void delete(User user) {
        userRepo.delete(user);
    }


    // for User folder

    private String saveImageForStudent(MultipartFile file, Student student) {
        try {
            Path uploadPath = Paths.get(uploadDir, "students");
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            String fileName = student.getName().replaceAll("\\s+", "_") + "_" + UUID.randomUUID().toString();
            Path filePath = uploadPath.resolve(fileName);
            file.transferTo(filePath);
            return fileName;
        } catch (IOException e) {
            throw new RuntimeException("Could not store student image file: " + e.getMessage(), e);
        }
    }


    private String saveImageForUser(MultipartFile file, User user) {
        try {
            Path uploadPath = Paths.get(uploadDir, "users");
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            String fileName = user.getUsername().replaceAll("\\s+", "_") + "_" + UUID.randomUUID().toString();
            Path filePath = uploadPath.resolve(fileName);
            file.transferTo(filePath);
            return fileName;
        } catch (IOException e) {
            throw new RuntimeException("Could not store user image file: " + e.getMessage(), e);
        }
    }


    @Transactional
    public void registerStudent(User user, MultipartFile imageFile, Student student) {
        // validate user
        if (user == null) {
            throw new IllegalArgumentException("User object is null");
        }

        // Handle photo/file
        if (imageFile != null && !imageFile.isEmpty()) {
            String filenameUser = saveImageForUser(imageFile, user);
            user.setPhoto(filenameUser);

            String filenameStudent = saveImageForStudent(imageFile, student);
            student.setPhoto(filenameStudent);
        }

        user.setRole(com.example.schoolmanagement.entity.Role.STUDENT);

        // save user
        User savedUser = userRepo.save(user);

        // set user in student
        student.setUser(savedUser);

        // Handle Section by id
        if (student.getSection() != null && student.getSection().getId() > 0) {
            Section section = sectionRepo.findById(student.getSection().getId())
                    .orElseThrow(() -> new RuntimeException("Section not found with id: " + student.getSection().getId()));
            student.setSection(section);
        } else {
            student.setSection(null);
        }

        // Handle SchoolClass by id
        if (student.getSchoolClass() != null && student.getSchoolClass().getId() > 0) {
            SchoolClass schoolClass = schoolClassRepo.findById(student.getSchoolClass().getId())
                    .orElseThrow(() -> new RuntimeException("SchoolClass not found with id: " + student.getSchoolClass().getId()));
            student.setSchoolClass(schoolClass);
        } else {
            student.setSchoolClass(null);
        }

        // Finally save student
        studentRepo.save(student);
    }


    public String saveImageForTeacher(MultipartFile file, Teacher teacher) {

        Path uploadPath = Paths.get(uploadDir + "/teacher");
        if (!Files.exists(uploadPath)) {
            try {
                Files.createDirectory(uploadPath);

            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        String fileName = teacher.getName() + "_" + UUID.randomUUID().toString();


        try {
            Path filePath = uploadPath.resolve(fileName);
            Files.copy(file.getInputStream(), filePath);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return fileName;

    }

    @Transactional
    public void registerTeacher(User user, MultipartFile imageFile, Teacher teacher) {
        if (imageFile != null && !imageFile.isEmpty()) {
            String filename = saveImageForUser(imageFile, user);
            String teacherPhoto = saveImageForTeacher(imageFile, teacher);
            teacher.setPhoto(teacherPhoto);
            user.setPhoto(filename);
        }

        // Assuming you have passwordEncoder bean injected
        user.setPassword(user.getPassword());
        user.setRole(Role.TEACHER);

        User savedUser = userRepo.save(user);

        teacher.setUser(savedUser);
        teacherService.createTeacher(teacher);
    }














    // It is Login Method
//    public AuthenticationResponse authenticate(User request) {
//        // Authenticate Username & Password
//        authenticationManager.authenticate(
//                new UsernamePasswordAuthenticationToken(
//                        request.getUsername(),
//                        request.getPassword()
//                )
//        );
//
//        // Fetch User from DB
//        User user = userRepo.findByEmail(request.getEmail())
//                .orElseThrow(() -> new UsernameNotFoundException("User not found"));
//
//        // Check Activation Status
//        if (!user.isActive()) {
//            throw new RuntimeException("Account is not activated. Please check your email for activation link.");
//        }
//
//        // Generate JWT Token
//        String jwt = jwtService.generateToken(user);
//
//        // Remove Existing Tokens (Invalidate Old Sessions)
//        removeAllTokenByUser(user);
//
//        // Save New Token to DB (Optional if stateless)
//        saveUserToken(jwt, user);
//
//        // Return Authentication Response
//        return new AuthenticationResponse(jwt, "User Login Successful");
//    }



//    public AuthenticationResponse authenticateForAdmin(Admin request) {
//        // Authenticate Username & Password
//        authenticationManager.authenticate(
//                new UsernamePasswordAuthenticationToken(
//                        request.getUsername(),
//                        request.getPassword()
//                )
//        );
//
//        // Fetch User from DB
//        Admin admin = adminRepository.findByEmail(request.getEmail())
//                .orElseThrow(() -> new UsernameNotFoundException("Admin not found"));
//
//        // Check Activation Status
//        if (!admin.isActive()) {
//            throw new RuntimeException("Account is not activated. Please check your email for activation link.");
//        }
//
//        // Generate JWT Token
//        String jwt = jwtService.generateTokenForAdmin(admin);
//
//        // Remove Existing Tokens (Invalidate Old Sessions)
//        removeAllTokenByAdmin(admin);
//
//        // Save New Token to DB (Optional if stateless)
//        saveAdminToken(jwt, admin);
//
//        // Return Authentication Response
//        return new AuthenticationResponse(jwt, "User Login Successful");
//    }



//    public  String activeUser(int id){
//
//        User user=userRepo.findById(id)
//                .orElseThrow(()-> new RuntimeException("User not Found with this ID "+id));
//
//        if(user !=null){
//            user.setActive(true);
//
//            userRepo.save(user);
//            return "User Activated Successfully!";
//
//        }else {
//            return  "Invalid Activation Token!";
//        }
//
//    }
//
//    public List<UserDTO> getAllUserDetails() {
//        return userRepo.findAll().stream().map(atten -> {
//            UserDTO dto = new UserDTO();
//            dto.setId(atten.getId());
//            dto.setEmail(atten.getEmail());
//            dto.setName(atten.getName());
//            dto.setPhone(atten.getPhone());
//
//
//
//            return dto;
//        }).toList();
//    }
}
