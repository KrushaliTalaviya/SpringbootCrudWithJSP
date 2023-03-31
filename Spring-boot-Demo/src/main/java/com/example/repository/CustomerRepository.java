package com.example.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.example.entity.Customer;

/**
 * This interface is provide the list of repository.
 * 
 * @author Krushali Talaviya
 * @version openjdk "11.0.16.1"
 * @since March 2023
 *
 */
@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer> {

	/**
	 * Retrieves an entity by its Email.
	 *
	 * @param email must not be null.
	 * @return the entity with the given email or Optional#empty() if none found.
	 * @throws IllegalArgumentException - if email is null.
	 */
	boolean existsByEmail(String email);

	/**
	 * Retrieves an entity by its Mobile number.
	 *
	 * @param mobileNo must not be null.
	 * @return the entity with the given mobile number or Optional#empty() if none
	 *         found.
	 * @throws IllegalArgumentException - if mobile number is null.
	 */
	boolean existsByMobileNo(String mobileNo);

	/**
	 * Retrieves an entity by its Email and its Id.
	 * 
	 * @param valueOf must not be null.
	 * @param email  must not be null.
	 * @return true if the entity was found otherwise return false.
	 */
	boolean existsByIdAndEmail(Long valueOf, String email);

	/**
	 * Retrieves an entity by its mobileNo and its Id.
	 * 
	 * @param valueOf must not be null.
	 * @param mobileNo  must not be null.
	 * @return true if the entity was found otherwise return false.
	 */
	boolean existsByIdAndMobileNo(Long valueOf, String mobileNo);

	/**
	 * Retrieves all customer with given column into the query.
	 * 
	 * @return list of customer
	 */
	@Query(value = "SELECT id, address1, address2, age, first_name, last_name,  gender, mobile_no,bytes, email, DATE_FORMAT(date_of_birth , '%d-%m-%Y') AS date_of_birth FROM customer ORDER BY ID DESC", nativeQuery = true)
	public List<Customer> findAllCustomer();

}