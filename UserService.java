package com.cdac.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pojos.Application;
import pojos.User;
import pojos.UserDocs;

import com.cdac.dao.UserDaoInterface;

@Service
public class UserService implements UserServiceInterface {

	@Autowired
	private UserDaoInterface userdao;
	
	
	@Override
	@Transactional
	public boolean registerUser(User user) throws Exception {
	
	return	userdao.registerUser(user);
	
	}
	
	@Override
	@Transactional
	public User loginUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return userdao.loginUser(user);
	}
	
	@Override
	@Transactional
	public boolean updateUser(Integer userId,User user)throws Exception {
		// TODO Auto-generated method stub
		return userdao.updateUser(userId, user);

	}

	@Override
	@Transactional
	public boolean changePassword(Integer userId,String oldpsw, String newpsw) throws Exception {
		// TODO Auto-generated method stub
		return userdao.changePassword(userId, oldpsw, newpsw);
	}

	@Override
	@Transactional
	public User getUserProfile(Integer userid) throws Exception {
		// TODO Auto-generated method stub
		return userdao.getUserProfile(userid);
	}

	@Override
	@Transactional
	public ArrayList<Application> getAppliedFormList(Integer userid) throws Exception {
		// TODO Auto-generated method stub
		return userdao.getAppliedFormList(userid);
	}

	@Override
	@Transactional
	public boolean uploadDocs(Integer userid,UserDocs userDocs) throws Exception {
		// TODO Auto-generated method stub
		return userdao.uploadDocs(userid,userDocs);
	}

	@Override
	@Transactional
	public byte[] showDocImage(Integer applicationid,String docName) throws Exception {
		// TODO Auto-generated method stub
		return userdao.showDocImage(applicationid, docName);
	}

	@Override
	@Transactional
	public String showDocContentType(Integer applicationid, String docName) throws Exception {
		// TODO Auto-generated method stub
		return userdao.showDocContentType(applicationid, docName);
	}

}
