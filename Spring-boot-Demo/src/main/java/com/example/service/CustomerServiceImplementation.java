package com.example.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.entity.Customer;
import com.example.repository.CustomerRepository;

/**
 * This class is provide a implementation of the CustomerService class method.
 * This method is used to save, get customer, find the customer etc.
 * 
 * @author Krushali Talaviya
 * @version openjdk "11.0.16.1"
 * @since March 2023
 *
 */
@Service
public class CustomerServiceImplementation implements CustomerService {

	@Autowired
	private CustomerRepository customerRepository;

	@Override
	public List<Customer> getAllCustomer() {
		return customerRepository.findAllCustomer();
	}

	@Override
	public void saveCustomer(Customer customer) {
		customerRepository.save(customer);
	}

	@Override
	public Customer getCustomerById(int id) {
		Optional<Customer> optional = customerRepository.findById(id);
		Customer customer = null;
		if (optional.isPresent()) {
			customer = optional.get();
		} else {
			throw new RuntimeException("Customer not found for id: " + id);
		}
		return customer;
	}

	@Override
	public void deleteCustomer(int id) {
		customerRepository.deleteById(id);
	}

	@Override
	public boolean findByEmail(String email, String id) {
		if (!id.isEmpty()) {
			System.out.println(email);
			if (customerRepository.existsByIdAndEmail(Long.valueOf(id), email)) {
				return true;
			} else {
				return !customerRepository.existsByEmail(email);
			}
		} else {
			return !customerRepository.existsByEmail(email);
		}
	}

	@Override
	public boolean findBymobileNo(String mobileNo, String id) {
		if (!id.isEmpty()) {
			System.out.println(mobileNo);
			if (customerRepository.existsByIdAndMobileNo(Long.valueOf(id), mobileNo)) {
				return true;
			} else {
				return !customerRepository.existsByMobileNo(mobileNo);
			}
		} else {
			return !customerRepository.existsByMobileNo(mobileNo);
		}
	}

}
