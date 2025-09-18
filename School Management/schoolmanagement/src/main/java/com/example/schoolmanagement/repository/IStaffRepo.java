package com.example.schoolmanagement.repository;

import com.example.schoolmanagement.entity.Staff;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IStaffRepo extends JpaRepository<Staff,Integer> {

}
