package com.example.controller;

import java.util.List;
import java.util.regex.Pattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.entity.Customer;
import com.example.service.CustomerService;

/**
 * This class is a controller class. Using this class we can handle the request
 * and give the response.
 * 
 * @author Krushali Talaviya
 * @version openjdk "11.0.16.1"
 * @since March 2023
 *
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	// Get all customer call customer service class
	@RequestMapping(value = { "/", "/customerList" })
	public String getAllCustomer(Model model) {
		List<Customer> listOfCustomer = customerService.getAllCustomer();
		System.out.println(listOfCustomer);
		model.addAttribute("customerList", listOfCustomer);
		System.out.println();
		return "customerList";
	}

	// Add customer, create new customer object and return a addCustomer view page
	@RequestMapping("/addCustomer")
	public String addCustomer(Model model) {
		Customer customer = new Customer();
		model.addAttribute("customer", customer);
		return "customerForm";
	}

	// Save customer call customer service class and new customer form page
	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer") Customer customer) {
		customerService.saveCustomer(customer);
		return "redirect:/customer/";
	}

	// Update customer call customer service class and return edit customer form
	// page with existing value
	@RequestMapping("/updateCustomer/{id}")
	public String getCustomerById(@PathVariable(value = "id") int id, Model model) {
		Customer customer = customerService.getCustomerById(id);
		model.addAttribute("customer", customer);
		return "customerForm";
	}

	// Delete customer call customer service class and return the customer list
	@GetMapping("/deleteCustomer/{id}")
	public String delete(@PathVariable(value = "id") int id, Model model) {
		customerService.deleteCustomer(id);
		return "redirect:/customer/customerList";
	}

	// Check email call when we enter email, and call service class
	@GetMapping("/checkEmail")
	@ResponseBody
	public String checkEmail(String email, String id) {
		if (Pattern.matches(
				"^(?=.{1,64}@)[\\p{L}0-9_-]+(\\.[\\p{L}0-9_-]+)*@[^-][\\p{L}0-9-]+(\\.[\\p{L}0-9-]+)*(\\.[\\p{L}]{2,})$",
				email)) {
			if (customerService.findByEmail(email, id)) {
				return "true";
			} else {
				return "Email is already exists";
			}
		} else {
			return "Invalid format";
		}
	}

	// Check mobile call when we enter mobile and call service class
	@GetMapping("/checkMobile")
	@ResponseBody
	public boolean checkMobile(String mobileNo, String id) {
		return customerService.findBymobileNo(mobileNo, id);
	}
	
}
