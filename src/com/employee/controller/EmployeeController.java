package com.employee.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.employee.model.Employee;
import com.employee.service.EmployeeService;

@RestController
public class EmployeeController {
	
	private final  Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@Autowired

	private EmployeeService empServ;
	String str ="Admin";
	String ere="UserName and Password Doesn't match! try again.";

	@RequestMapping("/")
	public ModelAndView getMeth()
{
		System.out.println("Accessing / ");
		return new ModelAndView("index");
}

	@RequestMapping("/fir")
	public ModelAndView getMethe()
{
		return new ModelAndView("first");
}
	
@RequestMapping("/usercheck")
public ModelAndView checkUser(HttpServletRequest req,HttpServletResponse res)
{
String uname=req.getParameter("username");
String pswd=req.getParameter("password");

if(uname.equalsIgnoreCase(str)&&pswd.equalsIgnoreCase(str))
{
	return new ModelAndView("redirect:listEmployee");
}
else
{
	ModelAndView mdv = new ModelAndView("index");
	mdv.addObject("er", ere);
	return mdv;
}

}
	
	@RequestMapping("/addEmployee")
	public ModelAndView saveEmp(@ModelAttribute("emplo") Employee emp) {

		ModelAndView mdv = new ModelAndView("addemploy");

		mdv.addObject("employee", new Employee());

		return mdv;
	}

	@RequestMapping(value="/saveEmployee",method=RequestMethod.POST)
public ModelAndView checkAddEmp(@Valid @ModelAttribute("emplo")Employee employee,BindingResult errors)
{
	if(errors.hasErrors())
	{
		return new ModelAndView("addemploy");
	}
	else
	{
		empServ.saveEmployee(employee);

		return new ModelAndView("redirect:/listEmployee");
	
	}
	
}
	

	

	/*
	 * @PostMapping("/saveEmployee") public ModelAndView
	 * saveEmployees(@ModelAttribute("emplo") Employee employee) {
	 * 
	 * //logger.info("value is :" + employee.getEmpName());
	 * 
	 * empServ.saveEmployee(employee);
	 * 
	 * return new ModelAndView("redirect:/listEmployee"); }
	 */
	
	/*
	 * @RequestMapping(value = "/listEmployee", method = RequestMethod.GET) public
	 * ModelAndView listEmp() { String st="value null";
	 * 
	 * ModelAndView mdv = new ModelAndView("listemploy");
	 * 
	 * List<Employee> list = empServ.getAllEmployees();
	 * 
	 * if(list.isEmpty()) {
	 * 
	 * return new ModelAndView("listemploy","mess",st);
	 * 
	 * }else {
	 * 
	 * for (Employee employee : list) { System.out.println("values from db "+
	 * employee.getEmpName());
	 * 
	 * }
	 * 
	 * //mdv.addObject("lis", list);
	 * 
	 * return new ModelAndView("redirect:/viewpage/1"); } }
	 */

	@RequestMapping(value = "/listEmployee", method = RequestMethod.GET)
	public ModelAndView listEmp(@RequestParam(required = false) Integer page) {
		String st="value null";

		ModelAndView mdv = new ModelAndView("listemploy");

		List<Employee> list = empServ.getAllEmployees();
		
		if(list.isEmpty()) {
			
			return new ModelAndView("listemploy","mess",st);
			
		}else {
			
		for (Employee employee : list) {
			System.out.println("values from db "+ employee.getEmpName());
		}
		PagedListHolder<Employee> pagedListHolder = new PagedListHolder<Employee>(list);
        pagedListHolder.setPageSize(4);
        mdv.addObject("maxPages", pagedListHolder.getPageCount());

        if(page==null || page < 1 || page > pagedListHolder.getPageCount())page=1;

        mdv.addObject("page", page);
        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            mdv.addObject("employees", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            mdv.addObject("employees", pagedListHolder.getPageList());
        }
		//mdv.addObject("lis", list);
		
		return mdv;
		}
	}
	
	@RequestMapping("/about")
	public ModelAndView aboutapp()
	{
		return new ModelAndView("about");
	}
	
	@RequestMapping("/contact")
	public ModelAndView contactapp()
	{
		return new ModelAndView("contact");
	}
	
	
	//PageId
	
	//postman
	
	@GetMapping("/listemployees")
	//@Produces(MediaType.APPLICATION_JSON)
	
	public ResponseEntity<List<Employee>> lisEmp()
	{
		List<Employee> lis = empServ.getAllEmployees();
		return new ResponseEntity<List<Employee>>(lis,HttpStatus.OK);
	}

	@RequestMapping("/deleteEmployee/{empId}")
	public ModelAndView deleteEmployee(@PathVariable("empId") int empId) {

		//logger.info("\ndelete sapid =" + empId);
		empServ.deleteEmployee(empId);

		return new ModelAndView("redirect:/listEmployee");
	}

	@RequestMapping("/updateEmployee/{empId}")
	public ModelAndView updateEmployee(@ModelAttribute("emplo") Employee emp, @PathVariable("empId") int empId) {

		Employee empl = empServ.getEmployee(empId);
		ModelAndView mdv = new ModelAndView("editpage", "employee", empl);

		return mdv;
	}

	@RequestMapping("/saveEmployeetwo/{empId}")
	public ModelAndView saveEmployeeTwo(@Valid @ModelAttribute("emplo") Employee emply,BindingResult errors, @PathVariable("empId") int empId) {
		
		if(errors.hasErrors()) {
			
			//Employee empl = empServ.getEmployee(empId);
			ModelAndView mdv = new ModelAndView("editpage");
		}
		else
		{
		Employee empll = empServ.getEmployee(empId);
		if (empll.getEmpId() == empId) {
			empServ.update(emply);
		}
		}
		return new ModelAndView("redirect:/listEmployee");
	}
	
	

}
