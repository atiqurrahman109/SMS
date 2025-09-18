package com.example.schoolmanagement.service;

import com.example.schoolmanagement.entity.Staff;
import com.example.schoolmanagement.repository.IStaffRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StaffService {

    @Autowired
    private IStaffRepo staffRepo;

    public List<Staff> getAllStaff() {
        return staffRepo.findAll();
    }

    public Optional<Staff> getStaffById(int id) {
        return staffRepo.findById(id);
    }

    public Staff createStaff(Staff staff) {
        return staffRepo.save(staff);
    }

    public Staff updateStaff(int id, Staff updatedStaff) {
        return staffRepo.findById(id)
                .map(existing -> {
                    existing.setName(updatedStaff.getName());
                    existing.setRole(updatedStaff.getRole());
                    return staffRepo.save(existing);
                })
                .orElseThrow(() -> new RuntimeException("Staff not found with ID: " + id));
    }

    public void deleteStaff(int id) {
        if (!staffRepo.existsById(id)) {
            throw new RuntimeException("Staff not found with ID: " + id);
        }
        staffRepo.deleteById(id);
    }
}
