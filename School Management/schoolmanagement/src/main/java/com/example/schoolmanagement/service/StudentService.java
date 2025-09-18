package com.example.schoolmanagement.service;

import com.example.schoolmanagement.entity.Section;
import com.example.schoolmanagement.entity.Student;
import com.example.schoolmanagement.repository.IStudentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StudentService {

    @Autowired
    private IStudentRepo studentRepo;

    public List<Student> getAllStudents() {
        return studentRepo.findAll();
    }

    public Optional<Student> getStudentById(int id) {
        return studentRepo.findById(id);
    }

    public Student createStudent(Student student) {
        return studentRepo.save(student);
    }

    public Student updateStudent(int id, Student updatedStudent) {
        return studentRepo.findById(id)
                .map(existing -> {
                    existing.setName(updatedStudent.getName());
                    existing.setEmail(updatedStudent.getEmail());
                    existing.setSection(updatedStudent.getSection());
                    existing.setPayments(updatedStudent.getPayments());
                    existing.setResults(updatedStudent.getResults());
                    return studentRepo.save(existing);
                })
                .orElseThrow(() -> new RuntimeException("Student not found with ID: " + id));
    }

    public void deleteStudent(int id) {
        if (!studentRepo.existsById(id)) {
            throw new RuntimeException("Student not found with ID: " + id);
        }
        studentRepo.deleteById(id);
    }

   
}
