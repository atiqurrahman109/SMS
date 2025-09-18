package com.example.schoolmanagement.service;

import com.example.schoolmanagement.entity.Section;
import com.example.schoolmanagement.repository.ISectionRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SectionService {

    @Autowired
    private ISectionRepo sectionRepo;

    public List<Section> getAllSections() {
        return sectionRepo.findAll();
    }

    public Optional<Section> getSectionById(int id) {
        return sectionRepo.findById(id);
    }

    public Section createSection(Section section) {
        return sectionRepo.save(section);
    }

    public Section updateSection(int id, Section updatedSection) {
        return sectionRepo.findById(id)
                .map(existing -> {
                    existing.setName(updatedSection.getName());
                    existing.setSchoolClass(updatedSection.getSchoolClass());
                    existing.setStudents(updatedSection.getStudents());
                    return sectionRepo.save(existing);
                })
                .orElseThrow(() -> new RuntimeException("Section not found with ID: " + id));
    }

    public void deleteSection(int id) {
        if (!sectionRepo.existsById(id)) {
            throw new RuntimeException("Section not found with ID: " + id);
        }
        sectionRepo.deleteById(id);
    }
}
