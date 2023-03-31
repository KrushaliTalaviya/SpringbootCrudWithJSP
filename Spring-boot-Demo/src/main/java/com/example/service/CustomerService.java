package com.example.service;

import java.util.List;
import com.example.entity.Customer;

/**
 * <p>This interface is provide the list of method.</p>
 * <p>This all method is implement on CustomerServiceImplementation class.</p>
 * 
 * @author Krushali Talaviya
 * @version openjdk "11.0.16.1"
 * @since March 2023
 *
 */
public interface CustomerService {

	/**
	 * <p>This method is used for get all customer.</p>
	 * <p>In this method call JpaRepository interface.</p>
	 * <p>Call inbuilt method fndAll().</p>
	 * 
	 * @return Customers list
	 */
	List<Customer> getAllCustomer();

	/**
	 * <p>This method is used for get customer by id.</p>
	 * <p>In this method call JpaRepository interface.</p>
	 * <p>Call inbuilt method findById().</p>
	 * 
	 * @param id can not be null.
	 * @return Customer details with particular id
	 */
	Customer getCustomerById(int id);

	/**
	 * <p>This method is used for delete customer by id.</p>
	 * <p>In this method call JpaRepository interface.</p>
	 * <p>Call inbuilt method deleteById().</p>
	 * 
	 * @param id can not be null.
	 */
	void deleteCustomer(int id);

	/**
	 * <p>This method is used for save customer.</p>
	 * <p>In this method call JpaRepository interface.</p>
	 * <p>Call inbuilt method save(customer).</p>
	 * 
	 * @param customer contain all the details of the customer.
	 */
	void saveCustomer(Customer customer);

	/**
	 * <p>This method is used for find customer by email.</p>
	 * <p>In this method call JpaRepository interface.</p>
	 * <p>Call user built method findByEmail(email).</p>
	 * 
	 * @param email can not be null.
	 * @return true or false. If email found then return true otherwise return false .
	 */
	boolean findByEmail(String email, String id);

	/**
	 * <p>This method is used for find customer by mobile number.</p>
	 * <p>In this method call JpaRepository interface.</p>
	 * <p>Call user built method findByMobile(mobileNo).</p>
	 * 
	 * @param mobileNo can not be null.
	 * @return true or false. If mobile number found then return true otherwise return false.
	 */
	boolean findBymobileNo(String mobileNo, String id);

}
