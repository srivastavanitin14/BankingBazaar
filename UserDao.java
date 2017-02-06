package com.cdac.dao;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pojos.Application;
import pojos.User;
import pojos.UserDocs;

@Repository
public class UserDao implements UserDaoInterface {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean registerUser(User user) throws Exception {
		//System.out.println("in Userdao : reg user " + user);
		sessionFactory.getCurrentSession().persist(user);
		
		return true;
	}

	@Override
	public User loginUser(User user) throws Exception {
		
		return (User)sessionFactory.getCurrentSession().createQuery("select u from User u where u.email= :em and u.password= :psw").setParameter("em", user.getEmail()).setParameter("psw", user.getPassword()).uniqueResult();
		//return null;
	}
	
	@Override
	public boolean updateUser(Integer userid, User user) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		User u = (User) session.get(Class.forName("pojos.User"), userid);
		u.setName(user.getName());
		u.setEmail(user.getEmail());
		u.setDob(user.getDob());
		u.setMobileNo(user.getMobileNo());
		u.setAddress(user.getAddress());
		u.setState(user.getState());
		u.setCity(user.getCity());
		u.setPincode(user.getPincode());
		session.save(u);
		return true;
	}

	@Override
	public boolean changePassword(Integer userid, String oldpsw, String newpsw) throws Exception {
		
		Session session = sessionFactory.getCurrentSession();
		User user = (User) session.createQuery("select u from User u where u.userId= :uid and u.password= :psw").setParameter("uid", userid).setParameter("psw", oldpsw).uniqueResult();
		if(user!=null)
		{
			user.setPassword(newpsw);
			session.save(user);
			return true;
		}		
		return false;
	}

	@Override
	public User getUserProfile(Integer userid) throws Exception {
		
		return (User)sessionFactory.getCurrentSession().get(Class.forName("pojos.User"), userid);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Application> getAppliedFormList(Integer userid) throws Exception {
		
		Session session = sessionFactory.getCurrentSession();
		User user = (User)session.get(Class.forName("pojos.User"), userid);
		return (ArrayList<Application>)session.createQuery("select appl from Application appl where appl.user= :u").setParameter("u", user).list();
	}

	@Override
	public boolean uploadDocs(Integer userid,UserDocs userDocs) throws Exception {
		
		Session session = sessionFactory.getCurrentSession();
		User u = (User)session.get(Class.forName("pojos.User"), userid);
		UserDocs ud = (UserDocs)session.createQuery("select ud from UserDocs ud where ud.user= :us").setParameter("us", u).uniqueResult();
		if(ud != null)
		{
			ud.setIdProof(userDocs.getIdProof());
			ud.setSalarySlip(userDocs.getSalarySlip());
			ud.setContentTypeIdProof(userDocs.getContentTypeIdProof());
			ud.setContentTypeSalarySlip(userDocs.getContentTypeSalarySlip());
			session.save(ud);
		}
		else
		{
			userDocs.setUser(u);
			session.save(userDocs);
		}
		return true;
	}

	@Override
	public byte[] showDocImage(Integer applicationid,String docName) throws Exception {
		
		Session session = sessionFactory.getCurrentSession();
		Application application = (Application)session.get(Class.forName("pojos.Application"), applicationid);
		User user = application.getUser();
		UserDocs userDocs = (UserDocs)session.createQuery("select ud from UserDocs ud where ud.user = :u").setParameter("u", user).uniqueResult();
		if(docName.equalsIgnoreCase("idProof"))
		{
			return userDocs.getIdProof();
		}
		else if(docName.equalsIgnoreCase("salaryslip"))
		{
			return userDocs.getSalarySlip();
		}
		return null;
	}

	@Override
	public String showDocContentType(Integer applicationid, String docName) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Application application = (Application)session.get(Class.forName("pojos.Application"), applicationid);
		User user = application.getUser();
		UserDocs userDocs = (UserDocs)session.createQuery("select ud from UserDocs ud where ud.user = :u").setParameter("u", user).uniqueResult();
		if(docName.equalsIgnoreCase("idProof"))
		{
			return userDocs.getContentTypeIdProof();
		}
		else if(docName.equalsIgnoreCase("salaryslip"))
		{
			return userDocs.getContentTypeSalarySlip();
		}
		return null;
	}

}
