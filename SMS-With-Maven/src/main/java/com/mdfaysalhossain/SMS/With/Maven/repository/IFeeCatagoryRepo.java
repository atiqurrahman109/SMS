package com.mdfaysalhossain.SMS.With.Maven.repository;

import com.mdfaysalhossain.SMS.With.Maven.model.FeeCatagoryModel;
import com.mdfaysalhossain.SMS.With.Maven.model.StudentAddModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface IFeeCatagoryRepo extends JpaRepository<FeeCatagoryModel,Long> {

    FeeCatagoryModel findByfeeid(long feeid);
    List<FeeCatagoryModel> findByStudentAddModelSid(Long sid);

    FeeCatagoryModel findTopByOrderByPaymentDateDesc();


//    @Query(value = "SELECT SUM(fc.feeAmount) FROM FeeCatagoryModel fc WHERE fc.paymentDate = :today", nativeQuery = true)
//    int calculateTotalFeeForToday(LocalDate today);
//
//
//    @Query(value = "SELECT SUM(fc.feeAmount) FROM FeeCatagoryModel fc WHERE MONTH(fc.paymentDate) = MONTH(:currentDate) " +
//            "AND YEAR(fc.paymentDate) = YEAR(:currentDate)", nativeQuery = true)
//    int calculateTotalFeeForCurrentMonth(LocalDate currentDate);

}
