package com.c2s.login.action;

import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.validator.DynaValidatorForm;

import com.c2s.base.action.BaseAction;
import com.c2s.user.bean.UserBO;
import com.c2s.user.dto.UserDTO;
import com.c2s.user.form.UserForm;

public class JoinAction extends BaseAction
{

	public ActionForward SignUp(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		UserForm userForm = (UserForm) form;
		if (userForm.getPassword().equalsIgnoreCase(userForm.getPassword2()))
		{
			UserDTO user = new UserDTO();
			user.fillDTO(userForm);
			user = (UserDTO)(new UserBO().saveBo(user));

			if (user != null)
			{
				// save UserDTO in session
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("userName", user.getUserName());
				return (mapping.findForward("success"));
			} else
			{
				// create ActionError and save in the request
				ActionErrors errors = new ActionErrors();
				ActionError error = new ActionError("error.join.exists");
				errors.add("join", error);
				saveErrors(request, errors);
				return (mapping.findForward("failure"));
			}

		} else
		// passwords did not match
		{
			// create ActionError and save in the request
			ActionErrors errors = new ActionErrors();
			ResourceBundle bundle = ResourceBundle.getBundle("ApplicationResources");
			ActionError error = new ActionError("error.join.passmismatch", bundle.getString("join.password2"), bundle.getString("join.password"));
			errors.add("password2", error);
			saveErrors(request, errors);
			return (mapping.findForward("failure"));
		}
	}

	public ActionForward Cancel(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		return (mapping.findForward("cancel"));
	}

/*	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{

		Boolean bCancel = (Boolean) request.getAttribute("org.apache.struts.action.CANCEL");
		if (bCancel != null)
			if (bCancel.booleanValue())
				return (mapping.findForward("cancel"));
		// compare password with password2
		if (((String) ((DynaValidatorForm) form).get("password2")).equals((String) ((DynaValidatorForm) form).get("password")))
		{
			// create a new JoinBean passing the datasource
			JoinBean jb = new JoinBean(getDataSource(request, "musiccollection"));
			// create an account for the user
			UserDTO user = jb.createUser((String) ((DynaValidatorForm) form).get("fname"), (String) ((DynaValidatorForm) form).get("lname"), (String) ((DynaValidatorForm) form).get("email"),
					(String) ((DynaValidatorForm) form).get("password"));
			if (user != null)
			{
				// save UserDTO in session
				request.getSession().setAttribute("user", user);
				return (mapping.findForward("success"));
			} else
			// could not add the use. Must be because already exists.
			{
				// create ActionError and save in the request
				ActionErrors errors = new ActionErrors();
				ActionError error = new ActionError("error.join.exists");
				errors.add("join", error);
				saveErrors(request, errors);
				return (mapping.findForward("failure"));
			}
		} else
		// passwords did not match
		{
			// create ActionError and save in the request
			ActionErrors errors = new ActionErrors();
			ResourceBundle bundle = ResourceBundle.getBundle("ApplicationResources");
			ActionError error = new ActionError("error.join.passmismatch", bundle.getString("join.password2"), bundle.getString("join.password"));
			errors.add("password2", error);
			saveErrors(request, errors);
			return (mapping.findForward("failure"));
		}
	}*/
}
