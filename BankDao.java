package com.cdac.dao;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pojos.Application;
import pojos.Bank;
import pojos.Loan;
import pojos.User;

@Repository
public class BankDao implements BankDaoInterface {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean registerBank(Bank bank) throws Exception {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(bank);
		return true;
	}

	@Override
	public Bank loginBank(Bank bank) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return (Bank)session.createQuery("select b from Bank b where b.email= :em and b.password= :psw").setParameter("em", bank.getEmail()).setParameter("psw", bank.getPassword()).uniqueResult();
	}
	
	@Override
	public String addLoan(Loan loan,Integer bankid) throws Exception
	{
		Session session = sessionFactory.getCurrentSession();
		Bank bank = (Bank) session.get(Class.forName("pojos.Bank"), bankid);
		Loan loandb = (Loan)session.createQuery("select l from Loan l where l.loanType= :lt and l.bank= :bnk").setParameter("lt", loan.getLoanType()).setParameter("bnk", bank).uniqueResult();
		if(loandb == null)
		{
			loan.setBank(bank);
			session.save(loan);
			return loan.getLoanType()+" Loan details has been saved successfully!!";
		}
		else
		{
			loandb.setInterestRate(loan.getInterestRate());
			loandb.setLoanFee(loan.getLoanFee());
			session.save(loandb);
			return loan.getLoanType()+" Loan details has been updated successfull!!";
		}
	}

	@Override
	public boolean changePassword(Integer bankid,String oldpassword, String newpassword) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		Bank bank = (Bank) session.createQuery("select b from Bank b where b.bankId= :bid and b.password= :psw").setParameter("bid", bankid).setParameter("psw", oldpassword).uniqueResult();
		if(bank!=null)
		{
			bank.setPassword(newpassword);
			session.save(bank);
			return true;
		}		
		return false;
	}

	@Override
	public boolean editBank(Integer bankid, Bank bank) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Bank b = (Bank) session.get(Class.forName("pojos.Bank"), bankid);	
		b.setName(bank.getName());
		b.setEmail(bank.getEmail());
		b.setBankType(bank.getBankType());
		b.setHq(bank.getHq());
		b.setCustomerCare(bank.getCustomerCare());
		b.setWebsite(bank.getWebsite());
		session.save(b);
		return true;
	}

	@Override
	public Bank getBankProfile(Integer bankid) throws Exception {
		// TODO Auto-generated method stub
		return (Bank)sessionFactory.getCurrentSession().get(Class.forName("pojos.Bank"), bankid);
	}

	@Override
	public Loan getLoanData(Integer bankid,String loanType) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return (Loan)session.createQuery("select l from Loan l where l.loanType= :ltyp and l.bank= :b").setParameter("ltyp", loanType).setParameter("b", getBankProfile(bankid)).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Loan> getBankListForLoan(String loanType) throws Exception {
		// TODO Auto-generated method stub
		return (ArrayList<Loan>)sessionFactory.getCurrentSession().createQuery("select l from Loan l where l.loanType= :loantype").setParameter("loantype", loanType).list();
	}

	@Override
	public Integer saveLoanApplication(Integer userid, Integer loanid, Application application) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		User user = (User)session.get(Class.forName("pojos.User"), userid);
		Loan loan = (Loan)session.get(Class.forName("pojos.Loan"), loanid);
		Application app = (Application)session.createQuery("select a from Application a where a.user= :u and a.appliedLoan= :l").setParameter("u", user).setParameter("l", loan).uniqueResult();
		if(app==null)
		{
			application.setUser(user);
			application.setAppliedLoan(loan);
			return (Integer)session.save(application);
		}
		else
		{
			return app.getApplicationId();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Application> getApplicationFormList(Integer bankid) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Bank bank = (Bank)session.get(Class.forName("pojos.Bank"), bankid);
		return (ArrayList<Application>)session.createQuery("select appl from Application appl where appl.appliedLoan in (select l from Loan l where l.bank= :bank)").setParameter("bank", bank).list();
	}

	@Override
	public boolean willContactStatus(Integer applicationid) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Application application = (Application)session.get(Class.forName("pojos.Application"), applicationid);
		application.setAppStatus("Will Contact Soon...");
		session.save(application);
		return true;
	}

	@Override
	public boolean rejectStatus(Integer applicationid) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Application application = (Application)session.get(Class.forName("pojos.Application"), applicationid);
		application.setAppStatus("Rejected");
		session.save(application);
		return true;
	}

	@Override
	public Application getApplicationForm(Integer applicationid) throws Exception {
		// TODO Auto-generated method stub
		return (Application)sessionFactory.getCurrentSession().get(Class.forName("pojos.Application"), applicationid);
	}

	@Override
	public boolean docsRequiredStatus(Integer applicationid) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Application application = (Application)session.get(Class.forName("pojos.Application"), applicationid);
		application.setAppStatus("Latest documents required...");
		session.save(application);
		return true;
	}
	
	

}
