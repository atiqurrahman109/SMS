package com.example.schoolmanagement.repository;

import com.example.schoolmanagement.entity.Section;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ISectionRepo extends JpaRepository<Section,Integer> {
}
