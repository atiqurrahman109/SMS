package com.example.schoolmanagement.service;

import com.example.schoolmanagement.entity.Teacher;
import com.example.schoolmanagement.repository.ITeacherRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TeacherService {

    @Autowired
    private ITeacherRepo teacherRepo;

    public List<Teacher> getAllTeachers() {
        return teacherRepo.findAll();
    }

    public Optional<Teacher> getTeacherById(int id) {
        return teacherRepo.findById(id);
    }

    public Teacher createTeacher(Teacher teacher) {
        return teacherRepo.save(teacher);
    }

    public Teacher updateTeacher(int id, Teacher updatedTeacher) {
        return teacherRepo.findById(id)
                .map(existing -> {
                    existing.setName(updatedTeacher.getName());
                    existing.setRoutines(updatedTeacher.getRoutines());
                    return teacherRepo.save(existing);
                })
                .orElseThrow(() -> new RuntimeException("Teacher not found with ID: " + id));
    }

    public void deleteTeacher(int id) {
        if (!teacherRepo.existsById(id)) {
            throw new RuntimeException("Teacher not found with ID: " + id);
        }
        teacherRepo.deleteById(id);
    }
}
