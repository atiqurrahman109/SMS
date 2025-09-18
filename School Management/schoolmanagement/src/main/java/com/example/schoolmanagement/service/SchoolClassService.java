package com.example.schoolmanagement.service;

import com.example.schoolmanagement.entity.SchoolClass;
import com.example.schoolmanagement.repository.ISchoolClassRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


@Service
public class SchoolClassService {

    @Autowired
    private ISchoolClassRepo schoolClassRepo;

    public List<SchoolClass> getAllClasses() {
        return schoolClassRepo.findAll();
    }

    public Optional<SchoolClass> getClassById(int id) {
        return schoolClassRepo.findById(id);
    }

    public SchoolClass createClass(SchoolClass schoolClass) {
        return schoolClassRepo.save(schoolClass);
    }

    public SchoolClass updateClass(int id, SchoolClass updatedClass) {
        return schoolClassRepo.findById(id)
                .map(existing -> {
                    existing.setName(updatedClass.getName());
                    existing.setSections(updatedClass.getSections());
                    return schoolClassRepo.save(existing);
                })
                .orElseThrow(() -> new RuntimeException("Class not found with ID: " + id));
    }

    public void deleteClass(int id) {
        if (!schoolClassRepo.existsById(id)) {
            throw new RuntimeException("Class not found with ID: " + id);
        }
        schoolClassRepo.deleteById(id);
    }
}
