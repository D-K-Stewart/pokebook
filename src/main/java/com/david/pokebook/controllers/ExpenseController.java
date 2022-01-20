package com.david.pokebook.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.david.pokebook.models.Expense;
import com.david.pokebook.services.ExpenseService;

@Controller
public class ExpenseController{
	
	@Autowired
	ExpenseService expenseService;
	
	
	
	@RequestMapping("/")
		public String redirect() {
			return "redirect:/expenses";
	}
	
	@RequestMapping("/expenses")
    public String index(Model model, @ModelAttribute("expense") Expense expense) {
        List<Expense> expenses = expenseService.allExpenses();
        model.addAttribute("expenses", expenses);
        return "index.jsp";
	}
	
	
    @RequestMapping(value="/expenses", method=RequestMethod.POST)
    public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
        
    	System.out.println(result);
    	
    	if (result.hasErrors()) {
            return "index.jsp";
        } else {
            expenseService.createExpense(expense);
            return "redirect:/expenses";
        }
    }
    @RequestMapping("/expenses/{id}/show")
    public String show(@PathVariable("id") Long id, Model model) {
        Expense expense = expenseService.findExpense(id);
        model.addAttribute("expense", expense);
        return "show.jsp";
    }
    
    
    @RequestMapping(value="/expenses/{id}/edit", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, @PathVariable("id") Long id, 
    		@RequestParam(value="name") String name, 
    		@RequestParam(value="vendor") String vendor, 
    		@RequestParam(value="amount") double amount,
    		@RequestParam(value="description") String desc) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
            expenseService.updateExpense(id, name, vendor, amount, desc);
            return "redirect:/expenses";
        }
    }
      
    
    @RequestMapping("/expenses/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Expense expense = expenseService.findExpense(id);
        model.addAttribute("expense", expense);
        return "edit.jsp";
    	}

    @RequestMapping(value="/expenses/{id}", method=RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id) {
    	expenseService.deleteExpense(id);
    	return "redirect:/expenses";
    }
   
}
