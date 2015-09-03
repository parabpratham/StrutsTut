package com.c2s.login.dto;

import com.c2s.base.dto.BaseDTO;

public class LoginDTO extends BaseDTO
{
	private String	email;
	private String	password;

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}
}
