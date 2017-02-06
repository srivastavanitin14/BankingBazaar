package com.cdac.service;

import java.util.ArrayList;

import pojos.Application;
import pojos.Bank;
import pojos.Loan;

public interface BankServiceInterface {

	boolean registerBank(Bank bank)throws Exception;
	Bank loginBank(Bank bank)throws Exception;
	String addLoanDetails(Loan loan,Integer bankId)throws Exception;
	Bank getBankProfile(Integer bankid)throws Exception;
	Loan getLoanData(Integer bankid,String loanType)throws Exception;
	boolean editBank(Integer bankid,Bank bank) throws Exception;
	boolean changePassword(Integer bankid,String oldpassword,String newpassword) throws Exception;
	ArrayList<Loan> getBankListForLoan(String loanType)throws Exception;
	Integer saveLoanApplication(Integer userid,Integer loanid,Double interestRate,Application application)throws Exception;
	ArrayList<Application> getApplicationFormList(Integer bankid)throws Exception;
	boolean willContactStatus(Integer applicationid)throws Exception;
	boolean rejectStatus(Integer applicationid)throws Exception;
	Application getApplicationForm(Integer applicationid)throws Exception;
	boolean docsRequiredStatus(Integer applicationid)throws Exception;
}
