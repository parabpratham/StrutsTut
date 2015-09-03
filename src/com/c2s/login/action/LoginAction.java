package com.c2s.login.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import com.c2s.album.form.AlbumForm;
import com.c2s.base.action.BaseAction;
import com.c2s.login.bean.LoginBO;
import com.c2s.login.dto.LoginDTO;
import com.c2s.login.form.LoginForm;
import com.c2s.user.dto.UserDTO;

public class LoginAction extends BaseAction
{
	public ActionForward Login(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ActionForward forward = null;
		// create a new LoginBean with valid users in it
		LoginBO lb = new LoginBO();
		// check to see if this user/password combination are valid
		LoginDTO fillDTO = (LoginDTO) ((LoginForm) form).fillDTO(new LoginDTO());
		if (lb.validateUser(fillDTO))
		{
			request.setAttribute("email", ((LoginForm) form).getEmail());
			request.getSession().setAttribute("user", lb.findByUserName(((LoginForm) form).getEmail()));
			forward = (mapping.findForward("success"));
		}
		else
		{
			// username/password not validated
			// create ActionError and save in the request
			ActionErrors errors = new ActionErrors();
			ActionMessage error = new ActionMessage("error.login.invalid");
			errors.add("login", error);
			saveErrors(request, errors);
			forward = (mapping.findForward("failure"));
		}

		return forward;
	}

	public ActionForward SignUp(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		return (mapping.findForward("join"));
	}

	public ActionForward reset(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ActionErrors errors = new ActionErrors();
		LoginForm loginForm = (LoginForm) form;
		loginForm.setPassword("");
		loginForm.setEmail("");
		return mapping.findForward("failure");
	}

	public ActionForward logoff(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// retrieve the user object
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute("user");
		// write logoff info to application log
		if (user != null)
		{
			log.info("LogoffAction: User '" + user.getFirstName() + "' logged off in session " + session.getId());
		}
		else
		{
			log.info("LogoffActon: User logged off in session " + session.getId());
		}
		// make the session invalid
		session.invalidate();
		// Forward control to the specified success URI
		return (mapping.findForward("failure"));
	}

	public ActionForward checkLogin(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ActionErrors errors = new ActionErrors();
		HashMap<String, String> errorMap = new HashMap<String, String>();
		String email = "" + request.getParameter("email");
		String passwd = "" + request.getParameter("pwd");
		boolean isValid = true;
		if (email == null || email.equalsIgnoreCase("null"))
		{
			errors.add("username", new ActionMessage("error.username.required"));
			errorMap.put("email", "User Name required");
			isValid = false;
		}
		if (passwd == null || passwd.equalsIgnoreCase("null"))
		{
			errors.add("password", new ActionMessage("password is required."));
			errorMap.put("password", "Password required");
			isValid = false;
		}
		/*
		 * if(isValid) { LoginForm loginForm = new LoginForm();
		 * loginForm.setEmail(email); loginForm.setPassword(passwd); LoginBO lb =
		 * new LoginBO(); LoginDTO fillDTO = (LoginDTO) (loginForm).fillDTO(new
		 * LoginDTO()); if (lb.validateUser(fillDTO)) { errors.add("login", new
		 * ActionMessage("error.login.invalid")); errorList.add("Invalid
		 * username/password"); } }
		 */
		response.setContentType("text/xml");
		response.setHeader("cache-control", "no-cache");
		response.setStatus(HttpServletResponse.SC_OK);
		PrintWriter out = response.getWriter();
		out.println("<pageerrors>");
		Set<String> keySet = errorMap.keySet();
		for (String key : keySet)
		{
			out.print("--" + key +"-"+errorMap.get(key)+ "--");
			System.out.print("--" + key +"-"+errorMap.get(key)+ "--");
		}
		out.println();
		out.println("</pageerrors>");
		out.println();
		out.flush();
		return null;
	}
}
