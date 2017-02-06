package com.cdac.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cdac.dao.BankDaoInterface;

import pojos.Application;
import pojos.Bank;
import pojos.Loan;

@Service
public class BankService implements BankServiceInterface{

	@Autowired
	private BankDaoInterface bankDao;
	
	@Override
	@Transactional
	public boolean registerBank(Bank bank) throws Exception {
		// TODO Auto-generated method stub
		return bankDao.registerBank(bank);
	}

	@Override
	@Transactional
	public Bank loginBank(Bank bank) throws Exception {
		// TODO Auto-generated method stub
		return bankDao.loginBank(bank);
	}

	@Override
	@Transactional
	public String addLoanDetails(Loan loan, Integer bankId) throws Exception {
		// TODO Auto-generated method stub
		return bankDao.addLoan(loan, bankId);
	}

	@Override
	@Transactional
	public Loan getLoanData(Integer bankid,String loanType) throws Exception {
		// TODO Auto-generated method stub
		return bankDao.getLoanData(bankid,loanType);
	}

	@Override
	@Transactional
	public Bank getBankProfile(Integer bankid) throws Exception {
		// TODO Auto-generated method stub
		return bankDao.getBankProfile(bankid);
	}

	@Override
	@Transactional
	public boolean editBank(Integer bankid, Bank bank) throws Exception {
		// TODO Auto-generated method stub
		return bankDao.editBank(bankid, bank);
	}

	@Override
	@Transactional
	public boolean changePassword(Integer bankid, String oldpassword, String newpassword) throws Exception {
		// TODO Auto-generated method stub
		return bankDao.changePassword(bankid, oldpassword, newpassword);
	}

	@Override
	@Transactional
	public ArrayList<Loan> getBankListForLoan(String loanType) throws Exception {
		// TODO Auto-generated method stub
		return bankDao.getBankListForLoan(loanType);
	}

	@Override
	@Transactional
	public Integer saveLoanApplication(Integer userid, Integer loanid, Double interestRate, Application application) throws Exception {
		// TODO Auto-generated method stub
		int timesInMonths = application.getLoanDuration()*12;
		double monthlyInterestRate = (interestRate/100)/12;
		double top = Math.pow(1+monthlyInterestRate, timesInMonths);
		double bottom = top-1;
		double sp = top/bottom;
		application.setEmi(new Double(Math.round(application.getLoanAmount()*monthlyInterestRate*sp)));
		return bankDao.saveLoanApplication(userid, loanid, application);
	}

	@Override
	@Transactional
	public ArrayList<Application> getApplicationFormList(Integer bankid) throws Exception {
		// TODO Auto-generated method stub
		return bankDao.getApplicationFormList(bankid);
	}

	@Override
	@Transactional
	public boolean willContactStatus(Integer applicationid) throws Exception {
		// TODO Auto-generated method stub
		return bankDao.willContactStatus(applicationid);
	}

	@Override
	@Transactional
	public boolean rejectStatus(Integer applicationid) throws Exception {
		// TODO Auto-generated method stub
		return bankDao.rejectStatus(applicationid);
	}

	@Override
	@Transactional
	public Application getApplicationForm(Integer applicationid) throws Exception {
		// TODO Auto-generated method stub
		return bankDao.getApplicationForm(applicationid);
	}

	@Override
	@Transactional
	public boolean docsRequiredStatus(Integer applicationid) throws Exception {
		// TODO Auto-generated method stub
		return bankDao.docsRequiredStatus(applicationid);
	}

}
