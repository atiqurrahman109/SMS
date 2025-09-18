package com.example.schoolmanagement.restcontroller;

import com.example.schoolmanagement.entity.Routine;
import com.example.schoolmanagement.service.RoutineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/routines")
public class RoutineRestController {

    @Autowired
    private RoutineService routineService;

    @GetMapping
    public List<Routine> getAllRoutines() {
        return routineService.getAllRoutines();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Routine> getRoutineById(@PathVariable int id) {
        return routineService.getRoutineById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<Routine> createRoutine(@RequestBody Routine routine) {
        return ResponseEntity.ok(routineService.createRoutine(routine));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Routine> updateRoutine(@PathVariable int id, @RequestBody Routine routine) {
        try {
            return ResponseEntity.ok(routineService.updateRoutine(id, routine));
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteRoutine(@PathVariable int id) {
        try {
            routineService.deleteRoutine(id);
            return ResponseEntity.noContent().build();
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    // New endpoints for filtered fetches

    @GetMapping("/class/{classId}")
    public List<Routine> getRoutinesByClass(@PathVariable int classId) {
        return routineService.getRoutinesByClass(classId);
    }

    @GetMapping("/class/{classId}/day/{dayOfWeek}")
    public List<Routine> getRoutinesByClassAndDay(@PathVariable int classId, @PathVariable String dayOfWeek) {
        return routineService.getRoutinesByClassAndDay(classId, dayOfWeek);
    }

    @GetMapping("/teacher/{teacherId}/day/{dayOfWeek}")
    public List<Routine> getRoutinesByTeacherAndDay(@PathVariable int teacherId, @PathVariable String dayOfWeek) {
        return routineService.getRoutinesByTeacherAndDay(teacherId, dayOfWeek);
    }

    @GetMapping("/section/{sectionId}")
    public List<Routine> getRoutinesBySection(@PathVariable int sectionId) {
        return routineService.getRoutinesBySection(sectionId);
    }
}
