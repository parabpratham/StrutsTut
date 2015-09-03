package com.c2s.login.bean;

import com.c2s.base.bean.BaseBO;
import java.util.HashMap;

public class LoginBean1 extends BaseBO
{

	private HashMap	validUsers	= new HashMap();

	/**
	 * Constructor for LoginBean Initializes the list of usernames/passwords
	 */

	public LoginBean1()
	{
		super();
		validUsers.put("Twinkle Toes", "tt");
		validUsers.put("administrator", "admin");
		validUsers.put("Barbara Smith", "smitty");
	}

	/**
	 * determine if the username/password combination are present in the
	 * validUsers repository.
	 * 
	 * @param userName
	 * @param password
	 * @return boolean true if valid, false otherwise
	 */

	public boolean validateUser(String userName, String password)
	{
		if (validUsers.containsKey(userName))
		{
			String thePassword = (String) validUsers.get(userName);
			if (thePassword.equals(password))
				return true;
		}
		return false;
	}
}
