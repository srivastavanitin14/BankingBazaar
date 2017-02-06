package com.cdac.controller;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cdac.service.BankServiceInterface;
import com.cdac.service.UserServiceInterface;

import pojos.Application;
import pojos.Bank;
import pojos.Loan;
import pojos.User;
import pojos.UserDocs;

@Controller
public class BankingBazaarController {

	@Autowired
	private UserServiceInterface userService;
	
	@Autowired
	private BankServiceInterface bankService;
	
	@PostConstruct
	public void init() {
		System.out.println("BankingBazaarController : init()");
	}
	
	@PreDestroy
	public void destroy() {
		System.out.println("BankingBazaarController : destroy()");
	}
	
	@RequestMapping("/homeloan")
	public String showHomeLoan(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("loantype", "Home");
		if(session.getAttribute("id")==null)
		{
			return "guestuser";
		}
		try {
			model.addAttribute("bankList", bankService.getBankListForLoan("Home"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "loan";
	}
	
	@RequestMapping("/educationloan")
	public String showEduLoan(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("loantype", "Education");
		if(session.getAttribute("id")==null)
		{
			return "guestuser";
		}
		try {
			model.addAttribute("bankList", bankService.getBankListForLoan("Education"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "loan";
	}
	
	@RequestMapping("/carloan")
	public String showCarLoan(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("loantype", "Car");
		if(session.getAttribute("id")==null)
		{
			return "guestuser";
		}
		try {
			model.addAttribute("bankList", bankService.getBankListForLoan("Car"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "loan";
	}
	
	@RequestMapping("/personalloan")
	public String showPersonalLoan(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("loantype", "Personal");
		if(session.getAttribute("id")==null)
		{
			return "guestuser";
		}
		try {
			model.addAttribute("bankList", bankService.getBankListForLoan("Personal"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "loan";
	}
	
	@RequestMapping("/businessloan")
	public String showBusinessLoan(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("loantype", "Business");
		if(session.getAttribute("id")==null)
		{
			return "guestuser";
		}
		try {
			model.addAttribute("bankList", bankService.getBankListForLoan("Business"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "loan";
	}
	
	@RequestMapping("/goldloan")
	public String showGoldLoan(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("loantype", "Gold");
		if(session.getAttribute("id")==null)
		{
			return "guestuser";
		}
		try {
			model.addAttribute("bankList", bankService.getBankListForLoan("Gold"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "loan";
	}
	
	@RequestMapping(value="/guestuser",method=RequestMethod.POST)
	public String guest(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("id", 0);
		session.setAttribute("mobile", request.getParameter("mobile"));
		session.setAttribute("email", request.getParameter("email"));
		//System.out.println(session.getAttribute("email")+"\t"+session.getAttribute("mobile"));
		switch(session.getAttribute("loantype").toString())
		{
		case "Home": return "redirect:/homeloan";
		case "Car": return "redirect:/carloan";
		case "Education": return "redirect:/educationloan";
		case "Personal": return "redirect:/personalloan";
		case "Business": return "redirect:/educationloan";
		case "Gold": return "redirect:/goldloan";
		default: return "index";
		}
	}
	
	@RequestMapping("/uregister")
	public String registerUser(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("id")==null || (Integer)session.getAttribute("id")==0)
		{
			model.addAttribute("user",new User());
			return "register";
		}
		return "index";
	}
	
	@RequestMapping(value="/uregister",method=RequestMethod.POST)
	public String registerUser(Model model,User user,HttpServletRequest request){
		try {
			user.setDob(/*new SimpleDateFormat("dd/MM/yyyy").parse(*/request.getParameter("dob")/*s*/);
			if(userService.registerUser(user))
			{
				HttpSession session = request.getSession();
				session.setAttribute("id", user.getUserId());
				session.setAttribute("name", user.getName());
				session.setAttribute("loginType", "User");
				return "index";
			}
			else
			{
				model.addAttribute("msg", "Something went wrong...<br>Please try after sometime!!");
				return "register";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			model.addAttribute("msg", "Something went wrong...<br>Please try after sometime!!");
			e.printStackTrace();
		}
		return "register";
	}
	
	@RequestMapping("/login")
	public String loginUser(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("id")==null || (Integer)session.getAttribute("id")==0)
		{
			model.addAttribute("user",new User());
			return "login";
		}
		return "index";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String loginUser(Model model,User user,HttpServletRequest request){
		try {
			System.out.println("User : "+user.getEmail());
			user = userService.loginUser(user);
			if(user!=null)
			{
				HttpSession session = request.getSession();
				session.setAttribute("id", user.getUserId());
				session.setAttribute("name", user.getName());
				session.setAttribute("loginType", "User");
				if(session.getAttribute("loan")!=null && (Boolean)session.getAttribute("loan"))
				{
					switch(session.getAttribute("loantype").toString())
					{
					case "Home": return "redirect:/homeloan";
					case "Car": return "redirect:/carloan";
					case "Education": return "redirect:/educationloan";
					case "Personal": return "redirect:/personalloan";
					case "Business": return "redirect:/educationloan";
					case "Gold": return "redirect:/goldloan";
					default: return "index";
					}
				}
				return "index";
			}
			else
			{
				model.addAttribute("msg_u", "Email and Password doesn't match!!");
				return "login";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			model.addAttribute("msg_u", "Email and Password doesn't match!!");
			e.printStackTrace();
		}
		return "login";
	}
	
	@RequestMapping("/vlogin")
	public String loginVendor(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("id")==null || (Integer)session.getAttribute("id")==0)
		{
			model.addAttribute("bank",new Bank());
			return "vlogin";
		}
		return "index";
	}
	
	@RequestMapping(value="/vlogin",method=RequestMethod.POST)
	public String loginBank(Model model,Bank bank,HttpServletRequest request){
		try {
			System.out.println("Bank");
			bank = bankService.loginBank(bank);
			if(bank!=null)
			{
				HttpSession session = request.getSession();
				session.setAttribute("id", bank.getBankId());
				session.setAttribute("name", bank.getName());
				session.setAttribute("loginType", "Bank");
				return "redirect:/bankprofile";
			}
			else
			{
				model.addAttribute("msg_v", "Email and Password doesn't match!!");
				return "vlogin";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			model.addAttribute("msg_v", "Email and Password doesn't match!!");
			e.printStackTrace();
		}
		return "vlogin";
	}
	
	@RequestMapping("/vregister")
	public String registerBank(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("id")==null || (Integer)session.getAttribute("id")==0)
		{
			model.addAttribute("bank",new Bank());
			return "vendor";
		}
		return "index";
	}
	
	@RequestMapping(value="/vregister",method=RequestMethod.POST)
	public String registerBank(Model model,Bank bank,HttpServletRequest request){
		try {
			if(bankService.registerBank(bank))
			{
				HttpSession session = request.getSession();
				session.setAttribute("id", bank.getBankId());
				session.setAttribute("name", bank.getName());
				session.setAttribute("loginType", "Bank");
				return "redirect:/bankprofile";
			}
			else
			{
				model.addAttribute("msg", "Something went wrong...<br>Please try after sometime!!");
				return "vendor";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			model.addAttribute("msg", "Something went wrong...<br>Please try after sometime!!");

			e.printStackTrace();
		}
		return "vendor";
	}
	
	@RequestMapping(value="/applyforloan",method=RequestMethod.POST)
	public String applyForLoan(Model model,Application application,HttpServletRequest request) {
		HttpSession session = request.getSession();
		application.setLoanAmount(Double.parseDouble(request.getParameter("lamount")));
		application.setLoanDuration(Integer.parseInt(request.getParameter("lduration")));
		if(session.getAttribute("id")!=null && (Integer)session.getAttribute("id")!=0)
		{
			/*System.out.println(request.getParameter("lbank")+request.getParameter("lroi")+request.getParameter("llpf"));
			System.out.println(request.getParameter("lamount")+request.getParameter("lduration")+request.getParameter("lrate"));*/
			try {
				int id = bankService.saveLoanApplication((Integer)session.getAttribute("id"), Integer.parseInt(request.getParameter("loanid")), Double.parseDouble(request.getParameter("lroi")), application);
				if(id>0)
				{
					session.setAttribute("applicationId", id);
					return "redirect:/confirmation";
				}
				else
				{
					session.setAttribute("err", "Something went wrong...<br>Please try after sometime!!");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				session.setAttribute("err", "Something went wrong...<br>Please try after sometime!!");
				e.printStackTrace();
			}
			return "redirect:/loan";
		}
		else if((Integer)session.getAttribute("id")==0)
		{
			session.setAttribute("loan", true);
			return "redirect:/login";
		}
		else
			return "index";
	}
	
	@RequestMapping("/confirmation")
	public String  confiramtion(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		if(session.getAttribute("id")!=null && (Integer)session.getAttribute("id")!=0)
		{
			try {
				model.addAttribute("application", bankService.getApplicationForm((Integer)session.getAttribute("applicationId")));
				return "confirmation";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "index";
	}
	
	@RequestMapping("/userprofile")
	public String userProfile(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("id")!=null && (Integer)session.getAttribute("id")!=0 && session.getAttribute("loginType").toString().equals("User"))
		{
			try {
				model.addAttribute("user",userService.getUserProfile((Integer)session.getAttribute("id")));
				System.out.println(userService.getAppliedFormList((Integer)session.getAttribute("id")));
				model.addAttribute("appliedLoans",userService.getAppliedFormList((Integer)session.getAttribute("id")));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				session.setAttribute("err", "Something went wrong...<br>Please try after sometime!!");
				e.printStackTrace();
			}
			return "userprofile";
		}
		else
		{
			session.invalidate();
		}
		return "redirect:/login";
	}
	
	@RequestMapping(value="/userprofile",method=RequestMethod.POST)
	public String updateUserProfile(User user,HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			//user.setDob(/*new SimpleDateFormat("dd/MM/yyyy").parse*/request.getParameter("dob")/*)*/);
			if(userService.updateUser((Integer)session.getAttribute("id"), user))
			{
				session.setAttribute("err", "Profile updated successfully!!");
			}
			else
			{
				session.setAttribute("err", "Something went wrong...<br>Please try after sometime!!");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			session.setAttribute("err", "Something went wrong...<br>Please try after sometime!!");
			e.printStackTrace();
		}
		return "redirect:/userprofile";
	}
	
	@RequestMapping(value="/userchangepsw",method=RequestMethod.POST)
	public String userChangePsw(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String oldpsw = request.getParameter("oldpsw");
		String newpsw = request.getParameter("newpsw");
		String rnewpsw = request.getParameter("rnewpsw");
		if(newpsw.equals(rnewpsw))
		{
			try {
				if(userService.changePassword((Integer)session.getAttribute("id"), oldpsw, newpsw))
				{
					session.setAttribute("err", "Password changed successully!!");
				}
				else
				{
					session.setAttribute("err", "Old Password was wrongly typed!!");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				session.setAttribute("err","Something went wrong...<br>Please try after sometime!!");
				e.printStackTrace();
			}
		}
		else
		{
			session.setAttribute("err", "New password not retyped correctly!!");
		}
		return "redirect:/userprofile";
	}
	
	@RequestMapping(value="/homeloanDetails",method=RequestMethod.POST)
	public String saveHomeLoanDetails(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		Loan loan = new Loan(Double.parseDouble(request.getParameter("hiroi")),request.getParameter("ltype"),request.getParameter("hilpf"));
		try {
				session.setAttribute("err", bankService.addLoanDetails(loan, (Integer)session.getAttribute("id")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			session.setAttribute("err", "Something went wrong...<br>Please try after sometime!!");
			e.printStackTrace();
		}
		return "redirect:/bankprofile";
	}
	
	@RequestMapping(value="/carloanDetails",method=RequestMethod.POST)
	public String saveCarLoanDetails(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		Loan loan = new Loan(Double.parseDouble(request.getParameter("ciroi")),request.getParameter("ltype"),request.getParameter("cilpf"));
		try {
			session.setAttribute("err", bankService.addLoanDetails(loan, (Integer)session.getAttribute("id")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			session.setAttribute("err", "Something went wrong...<br>Please try after sometime!!");
			e.printStackTrace();
		}
		return "redirect:/bankprofile";
	}
	
	@RequestMapping(value="/eduloanDetails",method=RequestMethod.POST)
	public String saveEduLoanDetails(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		Loan loan = new Loan(Double.parseDouble(request.getParameter("eiroi")),request.getParameter("ltype"),request.getParameter("eilpf"));
		try {
			session.setAttribute("err", bankService.addLoanDetails(loan, (Integer)session.getAttribute("id")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			session.setAttribute("err", "Something went wrong...<br>Please try after sometime!!");
			e.printStackTrace();
		}
		return "redirect:/bankprofile";
	}
	
	@RequestMapping(value="/prsloanDetails",method=RequestMethod.POST)
	public String savePrsLoanDetails(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		Loan loan = new Loan(Double.parseDouble(request.getParameter("piroi")),request.getParameter("ltype"),request.getParameter("pilpf"));
		try {
			session.setAttribute("err", bankService.addLoanDetails(loan, (Integer)session.getAttribute("id")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			session.setAttribute("err", "Something went wrong...<br>Please try after sometime!!");
			e.printStackTrace();
		}
		return "redirect:/bankprofile";
	}
	
	@RequestMapping(value="/bsloanDetails",method=RequestMethod.POST)
	public String saveBsLoanDetails(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		Loan loan = new Loan(Double.parseDouble(request.getParameter("biroi")),request.getParameter("ltype"),request.getParameter("bilpf"));
		try {
			session.setAttribute("err", bankService.addLoanDetails(loan, (Integer)session.getAttribute("id")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			session.setAttribute("err", "Something went wrong...<br>Please try after sometime!!");
			e.printStackTrace();
		}
		return "redirect:/bankprofile";
	}
	
	@RequestMapping(value="/goldloanDetails",method=RequestMethod.POST)
	public String saveGoldLoanDetails(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		Loan loan = new Loan(Double.parseDouble(request.getParameter("giroi")),request.getParameter("ltype"),request.getParameter("gilpf"));
		try {
			session.setAttribute("err", bankService.addLoanDetails(loan, (Integer)session.getAttribute("id")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			session.setAttribute("err", "Something went wrong...<br>Please try after sometime!!");
			e.printStackTrace();
		}
		return "redirect:/bankprofile";
	}
	
	@RequestMapping("/bankprofile")
	public String bankProfile(Model model,HttpServletRequest request){
		HttpSession session = request.getSession();
		if(session.getAttribute("id")!=null && (Integer)session.getAttribute("id")!=0 && session.getAttribute("loginType").toString().equals("Bank"))
		{
			Integer bankid = (Integer)session.getAttribute("id");
			try {
				model.addAttribute("bank",bankService.getBankProfile(bankid));
				model.addAttribute("homeLoan", bankService.getLoanData(bankid, "Home"));
				model.addAttribute("carLoan", bankService.getLoanData(bankid, "Car"));
				model.addAttribute("educationLoan", bankService.getLoanData(bankid, "Education"));
				model.addAttribute("personalLoan", bankService.getLoanData(bankid, "Personal"));
				model.addAttribute("businessLoan", bankService.getLoanData(bankid, "Business"));
				model.addAttribute("goldLoan", bankService.getLoanData(bankid, "Gold"));
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "bankprofile";
		}
		else
		{
			session.invalidate();
		}
		return "redirect:/login";
	}
	
	@RequestMapping(value="/bankprofile",method=RequestMethod.POST)
	public String editBankProfile(Model model,Bank bank,HttpServletRequest request){
		HttpSession session = request.getSession();
		try {
			if(bankService.editBank((Integer)session.getAttribute("id"), bank))
			{
				session.setAttribute("err", "Profile updated successfully!!");
			}
			else
			{
				session.setAttribute("err", "Something went wrong...<br>Please try after some time!!");
			}
		} catch (Exception e) {
				// TODO Auto-generated catch block
			session.setAttribute("err", "Something went wrong...<br>Please try after some time!!");
			e.printStackTrace();
		}
		return "redirect:/bankprofile";
	}
	
	@RequestMapping(value="/bankchangepsw",method=RequestMethod.POST)
	public String bankChangePsw(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String oldpsw = request.getParameter("oldpsw");
		String newpsw = request.getParameter("newpsw");
		String rnewpsw = request.getParameter("rnewpsw");
		if(newpsw.equals(rnewpsw))
		{
			try {
				if(bankService.changePassword((Integer)session.getAttribute("id"), oldpsw, newpsw))
				{
					session.setAttribute("err", "Password changed successully!!");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				session.setAttribute("err","Something went wrong...<br>Please try after some time!!");
				e.printStackTrace();
			}
		}
		else
		{
			session.setAttribute("err", "New password not retyped correctly!!");
		}
		return "redirect:/bankprofile";
	} 
	
	@RequestMapping("/applicationforloan")
	public String applicationForLoan(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		if(session.getAttribute("id")!=null && (Integer)session.getAttribute("id")!=0 && session.getAttribute("loginType").toString().equals("Bank"))
		{
			Integer bankid = (Integer)session.getAttribute("id");
			try {
				model.addAttribute("bank",bankService.getBankProfile(bankid));
				model.addAttribute("applicationLoanForms", bankService.getApplicationFormList(bankid));
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "applicationforloan";
		}
		else
		{
			session.invalidate();
		}
		return "redirect:/login";
	}
	
	@RequestMapping(value="/applicationforloan",method=RequestMethod.POST)
	public String editBankProfileApp(Model model,Bank bank,HttpServletRequest request){
		HttpSession session = request.getSession();
		try {
			if(bankService.editBank((Integer)session.getAttribute("id"), bank))
			{
				session.setAttribute("err", "Profile updated successfully!!");
			}
			else
			{
				session.setAttribute("err", "Something went wrong...<br>Please try after some time!!");
			}
		} catch (Exception e) {
				// TODO Auto-generated catch block
			session.setAttribute("err", "Something went wrong...<br>Please try after some time!!");
			e.printStackTrace();
		}
		return "redirect:/applicationforloan";
	}
	
	@RequestMapping(value="/willcontact", method=RequestMethod.POST)
	public String willContact(HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			bankService.willContactStatus(Integer.parseInt(request.getParameter("applicationid")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			session.setAttribute("err", "Something went wrong...<br>Please try after sometime!!");
			e.printStackTrace();
		}
		return "redirect:/applicationforloan";
	}
	
	@RequestMapping(value="/reject",method=RequestMethod.POST)
	public String reject(HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			bankService.rejectStatus(Integer.parseInt(request.getParameter("applicationid")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			session.setAttribute("err", "Something went wrong...<br>Please try after sometime!!");
			e.printStackTrace();
		}
		return "redirect:/applicationforloan";
	}
	
	@RequestMapping(value="/docsrequired",method=RequestMethod.POST)
	public String docsRequired(HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			bankService.docsRequiredStatus(Integer.parseInt(request.getParameter("applicationid")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			session.setAttribute("err", "Something went wrong...<br>Please try after sometime!!");
			e.printStackTrace();
		}
		return "redirect:/applicationforloan";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
	}
	
	@RequestMapping(value="/uploaddocuments",method=RequestMethod.POST)
	public String uploadDocs(HttpServletRequest request,@RequestParam("idproof")MultipartFile file1,@RequestParam("salaryslip")MultipartFile file2) {
		HttpSession session = request.getSession();
		try{
		UserDocs userDocs = new UserDocs();
		userDocs.setIdProof(file1.getBytes());
		userDocs.setContentTypeIdProof(file1.getContentType());
		userDocs.setSalarySlip(file2.getBytes());
		userDocs.setContentTypeSalarySlip(file2.getContentType());
		if(userService.uploadDocs((Integer)session.getAttribute("id"),userDocs))
		{
			session.setAttribute("err", "Document uploaded successfully!!");
		}
		}catch(Exception e)
		{
			session.setAttribute("err", "Something went wrong...<br>Please try after sometime!!");
			e.printStackTrace();
		}
		return "redirect:/userprofile";
	}
	
	@RequestMapping("/docimageshow")
	public @ResponseBody ResponseEntity<byte[]> showDocumentImage(@RequestParam("applicationid")Integer applicationid,@RequestParam("docName")String docName) {
		HttpHeaders headers = new HttpHeaders();
		try {
			byte[] bytes = userService.showDocImage(applicationid, docName);
			headers.setContentType(MediaType.valueOf(userService.showDocContentType(applicationid, docName)));
			return new ResponseEntity<byte[]>(bytes, headers, HttpStatus.OK);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return new ResponseEntity<>("Document Not Uploaded".getBytes(),headers,HttpStatus.NOT_FOUND);
	}
}
