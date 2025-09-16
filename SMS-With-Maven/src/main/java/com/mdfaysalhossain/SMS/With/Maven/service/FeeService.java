package com.mdfaysalhossain.SMS.With.Maven.service;

import com.mdfaysalhossain.SMS.With.Maven.model.FeeCatagoryModel;
import com.mdfaysalhossain.SMS.With.Maven.model.StudentAddModel;
import com.mdfaysalhossain.SMS.With.Maven.model.SyllabusModel;
import com.mdfaysalhossain.SMS.With.Maven.repository.IFeeCatagoryRepo;
import com.mdfaysalhossain.SMS.With.Maven.repository.IStudentAddRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FeeService {

    @Autowired
    IFeeCatagoryRepo iFeeCatagoryRepo;

    @Autowired
    private IStudentAddRepo studentAddRepo;

    public FeeService(IFeeCatagoryRepo iFeeCatagoryRepo) {
        this.iFeeCatagoryRepo = iFeeCatagoryRepo;
    }

    public List<FeeCatagoryModel> getAllfee() {
        return iFeeCatagoryRepo.findAll();
    }

    public Optional<FeeCatagoryModel> getfeeById(long id) {
        return iFeeCatagoryRepo.findById(id);
    }

    public FeeCatagoryModel saveFee(FeeCatagoryModel feeCatagoryModel) {
        return iFeeCatagoryRepo.save(feeCatagoryModel);
    }


    public FeeCatagoryModel saveOrUpdate(FeeCatagoryModel feeCatagoryModel) {
        StudentAddModel studentAddModel = studentAddRepo.findById(feeCatagoryModel.getStudentAddModel().getSid())
                .orElseThrow(() -> new RuntimeException("Student not found with id: " + feeCatagoryModel.getStudentAddModel().getSid()));


        feeCatagoryModel.setStudentAddModel(studentAddModel);


        return iFeeCatagoryRepo.save(feeCatagoryModel);
    }

    public void deleteFeeById(long id) {
        iFeeCatagoryRepo.deleteById(id);
    }

    public List<FeeCatagoryModel> findByStudentId(Long sid) {
        return iFeeCatagoryRepo.findByStudentAddModelSid(sid);
    }


}
