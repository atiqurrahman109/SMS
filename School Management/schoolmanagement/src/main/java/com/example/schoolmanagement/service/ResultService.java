package com.example.schoolmanagement.service;

import com.example.schoolmanagement.entity.Result;
import com.example.schoolmanagement.repository.IResultRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ResultService {

    @Autowired
    private IResultRepo resultRepo;

    public List<Result> getAllResults() {
        return resultRepo.findAll();
    }

    public Optional<Result> getResultById(int id) {
        return resultRepo.findById(id);
    }

    public Result createResult(Result result) {
        return resultRepo.save(result);
    }

    public Result updateResult(int id, Result updatedResult) {
        return resultRepo.findById(id)
                .map(existing -> {
                    existing.setStudent(updatedResult.getStudent());
                    existing.setExamName(updatedResult.getExamName());
                    existing.setSubject(updatedResult.getSubject());
                    existing.setMarksObtained(updatedResult.getMarksObtained());
                    existing.setTotalMarks(updatedResult.getTotalMarks());
                    return resultRepo.save(existing);
                })
                .orElseThrow(() -> new RuntimeException("Result not found with ID: " + id));
    }

    public void deleteResult(int id) {
        if (!resultRepo.existsById(id)) {
            throw new RuntimeException("Result not found with ID: " + id);
        }
        resultRepo.deleteById(id);
    }
}
