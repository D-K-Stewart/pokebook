package com.david.pokebook.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.david.pokebook.models.Expense;
import com.david.pokebook.repositories.ExpenseRepository;

@Service
public class ExpenseService {
private final ExpenseRepository expenseRepository;
    
    public ExpenseService(ExpenseRepository expenseRepository) {
        this.expenseRepository = expenseRepository;
    }
    // returns all the books
    public List<Expense> allExpenses() {
        return expenseRepository.findAll();
    }
    // creates a book
    public Expense createExpense(Expense b) {
        return expenseRepository.save(b);
    }
    // retrieves a book
    public Expense findExpense(Long id) {
        Optional<Expense> optionalExpense = expenseRepository.findById(id);
        if(optionalExpense.isPresent()) {
            return optionalExpense.get();
        } else {
            return null;
        }
    }
    
    public Expense updateExpense(Long id,
						String name,
						String vendor,
						double amount,
						String desc) {
    	Expense foundExpense = findExpense(id);
    	foundExpense.setName(name);
    	foundExpense.setVendor(vendor);
    	foundExpense.setAmount(amount);
    	foundExpense.setDescription(desc);
  
    	return expenseRepository.save(foundExpense);

    }
    public void deleteExpense(Long id) {
    	expenseRepository.deleteById(id);
    }



}
