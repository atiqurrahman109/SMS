package com.example.schoolmanagement.service;

import com.example.schoolmanagement.entity.Payment;
import com.example.schoolmanagement.repository.IPaymentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PaymentService {

    @Autowired
    private IPaymentRepo paymentRepo;

    public List<Payment> getAllPayments() {
        return paymentRepo.findAll();
    }

    public Optional<Payment> getPaymentById(int id) {
        return paymentRepo.findById(id);
    }

    public Payment createPayment(Payment payment) {
        return paymentRepo.save(payment);
    }

    public Payment updatePayment(int id, Payment updatedPayment) {
        return paymentRepo.findById(id)
                .map(existing -> {
                    existing.setStudent(updatedPayment.getStudent());
                    existing.setMonth(updatedPayment.getMonth());
                    existing.setCategory(updatedPayment.getCategory());
                    existing.setAmount(updatedPayment.getAmount());
                    existing.setPaid(updatedPayment.isPaid());
                    existing.setPaymentDate(updatedPayment.getPaymentDate());
                    return paymentRepo.save(existing);
                })
                .orElseThrow(() -> new RuntimeException("Payment not found with ID: " + id));
    }

    public void deletePayment(int id) {
        if (!paymentRepo.existsById(id)) {
            throw new RuntimeException("Payment not found with ID: " + id);
        }
        paymentRepo.deleteById(id);
    }
}
