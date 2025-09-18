package com.example.schoolmanagement.repository;

import com.example.schoolmanagement.entity.Routine;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IRoutineRepo extends JpaRepository<Routine,Integer> {

    List<Routine> findBySchoolClassId(int classId);

    List<Routine> findBySchoolClassIdAndDayOfWeek(int classId, String dayOfWeek);

    List<Routine> findByTeacherIdAndDayOfWeek(int teacherId, String dayOfWeek);

    @Query("SELECT r FROM Routine r JOIN r.schoolClass s JOIN Section sec ON sec.schoolClass = s WHERE sec.id = ?1")
    List<Routine> findBySectionId(int sectionId);
}
