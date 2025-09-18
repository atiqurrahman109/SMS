package com.example.schoolmanagement.service;

import com.example.schoolmanagement.entity.Routine;
import com.example.schoolmanagement.repository.IRoutineRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RoutineService {

    @Autowired
    private IRoutineRepo routineRepo;

    public List<Routine> getAllRoutines() {
        return routineRepo.findAll();
    }

    public Optional<Routine> getRoutineById(int id) {
        return routineRepo.findById(id);
    }

    public Routine createRoutine(Routine routine) {
        return routineRepo.save(routine);
    }

    public Routine updateRoutine(int id, Routine updatedRoutine) {
        return routineRepo.findById(id)
                .map(existing -> {
                    existing.setDayOfWeek(updatedRoutine.getDayOfWeek());
                    existing.setStartTime(updatedRoutine.getStartTime());
                    existing.setEndTime(updatedRoutine.getEndTime());
                    existing.setSchoolClass(updatedRoutine.getSchoolClass());
                    existing.setTeacher(updatedRoutine.getTeacher());
                    existing.setSubject(updatedRoutine.getSubject());
                    return routineRepo.save(existing);
                })
                .orElseThrow(() -> new RuntimeException("Routine not found with ID: " + id));
    }

    public void deleteRoutine(int id) {
        if (!routineRepo.existsById(id)) {
            throw new RuntimeException("Routine not found with ID: " + id);
        }
        routineRepo.deleteById(id);
    }

    // New methods for filtering

    public List<Routine> getRoutinesByClass(int classId) {
        return routineRepo.findBySchoolClassId(classId);
    }

    public List<Routine> getRoutinesByClassAndDay(int classId, String dayOfWeek) {
        return routineRepo.findBySchoolClassIdAndDayOfWeek(classId, dayOfWeek);
    }

    public List<Routine> getRoutinesByTeacherAndDay(int teacherId, String dayOfWeek) {
        return routineRepo.findByTeacherIdAndDayOfWeek(teacherId, dayOfWeek);
    }

    public List<Routine> getRoutinesBySection(int sectionId) {
        return routineRepo.findBySectionId(sectionId);
    }
}
