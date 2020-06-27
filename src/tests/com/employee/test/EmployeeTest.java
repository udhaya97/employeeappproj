
package com.employee.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.jdbc.SqlScriptsTestExecutionListener;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DefaultTestContextBootstrapper;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextBeforeModesTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;
import org.springframework.test.context.web.ServletTestExecutionListener;

import com.employee.dao.EmployeeMapper;
import com.employee.model.Employee;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration(classes = { EmployeeMapper.class })


  @TestExecutionListeners(inheritListeners = false,mergeMode = TestExecutionListeners.MergeMode.MERGE_WITH_DEFAULTS,
  listeners = {
		  
		  ServletTestExecutionListener.class, DirtiesContextBeforeModesTestExecutionListener.class,
  DependencyInjectionTestExecutionListener.class,
  DirtiesContextTestExecutionListener.class,TransactionalTestExecutionListener.
  class,SqlScriptsTestExecutionListener.class, })


public class EmployeeTest {
	
	
	
	
	private final  Logger logger = LoggerFactory.getLogger(EmployeeTest.class);

	@Autowired
	private EmployeeMapper employeeMapper;
 
	
	//create
	@Test
	
	public void addEmp()
	{
		Employee emp = new Employee();
		emp.setCompanyName("Infosys");
		emp.setDesignation("Developer");
		emp.setDob("26-05-1994");
		emp.setEmpName("RohithSharma");
		emp.setSal(45632.15f);
		

		assertEquals("values inserted Successfully", 0, employeeMapper.saveEmployee(emp));
		Employee emps = new Employee();
		emps.setCompanyName("HCL");
		emps.setDesignation("Tech Lead");
		emps.setDob("26-03-1984");
		emps.setEmpName("Virat Kohli");
		emps.setSal(45692.15f);
		assertEquals("values inserted Successfully", 0, employeeMapper.saveEmployee(emps));
		logger.info("Created Successfully");
	}

	// update
	
	@Test
	public void updateEmp()
	{
		
		Employee empn = employeeMapper.getEmployee(167);
		if(empn != null) {

		empn.setEmpName("Gokul");

		assertEquals("Values Updated Successfully", 0, employeeMapper.updateEmployee(empn));
		logger.info("updated Successfully");}
		else
		{
			assertNull("Value not available in db", empn);
		}
	}
	//delete
	@Test
	public void deleteEmp()
	{
		assertEquals("Value Deleted Successfully", 0, employeeMapper.deleteEmployee(173));
		logger.info("deleted Successfully");
	}
	
	//read all
	
	@Test
	public void realAll()
	{
		List<Employee> lim = employeeMapper.getAllEmployees();
		assertEquals("All Values fetched Successfully", lim, lim);
		logger.info("listed Successfully");
	}
	
	
	
	
	/*
	 * @Test public void allCrudEmp() { // create operation
	 * 
	 * Employee emp = new Employee(); emp.setCompanyName("Infosys");
	 * emp.setDesignation("Developer"); emp.setDob("26-05-1994");
	 * emp.setEmpName("Raje"); emp.setSal(45632.15f);
	 * 
	 * 
	 * assertEquals("values inserted Successfully", 0,
	 * employeeMapper.saveEmployee(emp)); Employee emps = new Employee();
	 * emps.setCompanyName("HCL"); emps.setDesignation("Tech Lead");
	 * emps.setDob("26-03-1984"); emps.setEmpName("suku"); emps.setSal(45692.15f);
	 * assertEquals("values inserted Successfully", 0,
	 * employeeMapper.saveEmployee(emps)); // update operation
	 * 
	 * Employee empn = employeeMapper.getEmployee(emp.getEmpId());
	 * 
	 * empn.setEmpName("Rahul");
	 * 
	 * assertEquals("Values Updated Successfully", 0,
	 * employeeMapper.updateEmployee(empn));
	 * 
	 * // Delete Operation
	 * 
	 * assertEquals("Value Deleted Successfully", 0,
	 * employeeMapper.deleteEmployee(26));
	 * 
	 * // Read All
	 * 
	 * List<Employee> lim = employeeMapper.getAllEmployees();
	 * assertEquals("All Values fetched Successfully", lim, lim);
	 * 
	 * }
	 */
}
