package com.cdac.service;

import java.util.ArrayList;

import pojos.Application;
import pojos.User;
import pojos.UserDocs;

public interface UserServiceInterface {

	boolean registerUser(User user) throws Exception;
	User loginUser(User user)throws Exception;
	boolean updateUser(Integer userId, User user) throws Exception;
	boolean changePassword(Integer userId,String oldpsw,String newpsw)throws Exception;
	User getUserProfile(Integer userid)throws Exception;
	ArrayList<Application> getAppliedFormList(Integer userid)throws Exception;
	boolean uploadDocs(Integer userid,UserDocs userDocs)throws Exception;
	byte[] showDocImage(Integer applicationid,String docName)throws Exception;
	String showDocContentType(Integer applicationid,String docName)throws Exception;
}
