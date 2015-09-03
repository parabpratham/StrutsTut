package com.c2s.login.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import com.c2s.base.form.BaseForm;
import com.c2s.login.dto.LoginDTO;

public class LoginForm extends BaseForm
{

	private static final long	serialVersionUID	= -7793441024557906868L;
	private String				email;
	private String				password;
	private int					id;

	public LoginForm()
	{

	}

	public LoginForm(int id, String email, String password)
	{
		this.id = id;
		this.email = email;
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

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request)
	{
		password = "";
		email = "";
	}

	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request)
	{
		ActionErrors errors = super.validate(mapping, request);
		if ("validate".equalsIgnoreCase(request.getParameter("method")))
		{
			if ((email == null) || (email.length() < 1))
				errors.add("userName", new ActionMessage("error.username.required"));
			if ((password == null) || (password.length() < 1))
				errors.add("password", new ActionMessage("error.password.required"));
		}
		return errors;
	}

	/*
	 * public LoginDTO fillDTO(LoginDTO loginDTO) {
	 * loginDTO.setUserName(getUserName().toUpperCase());
	 * loginDTO.setPassword(getPassword()); return loginDTO; } public void
	 * fillForm(LoginDTO loginDTO) { setUserName(loginDTO.getUserName());
	 * setPassword(loginDTO.getPassword()); }
	 */

}
