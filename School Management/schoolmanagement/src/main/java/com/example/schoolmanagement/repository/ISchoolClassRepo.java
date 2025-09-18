package com.example.schoolmanagement.repository;

import com.example.schoolmanagement.entity.SchoolClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ISchoolClassRepo extends JpaRepository<SchoolClass, Integer> {

}
