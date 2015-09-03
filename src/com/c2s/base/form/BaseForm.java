package com.c2s.base.form;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;

import com.c2s.base.dto.BaseDTO;
import com.c2s.login.dto.LoginDTO;
import com.c2s.validator.form.ValidatorForm;

public class BaseForm extends ValidatorForm
{

	private String				id;

	private static final long	serialVersionUID	= -1403004488524251953L;

	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request)
	{
		ActionErrors errors = new ActionErrors();
		return errors;
	}

	public BaseDTO fillDTO(BaseDTO baseDTO)
	{
		// String parameter
		Class[] paramString = new Class[1];
		paramString[0] = String.class;
		Method[] formMethods = this.getClass().getMethods();
		for (Method method : formMethods)
		{
			try
			{
				if (method.getName().contains("get"))
				{
					Method declaredMethod = baseDTO.getClass().getDeclaredMethod(method.getName().replace("get", "set"), paramString);
					declaredMethod.invoke(baseDTO, method.invoke(this, null));
				}
			} catch (Exception e)
			{
				// e.printStackTrace();
			}
		}
		return baseDTO;
	}

	public void fillForm(BaseDTO baseDTO)
	{
		Class noparams[] =
		{};
		Method[] formMethods = this.getClass().getMethods();
		for (Method method : formMethods)
		{
			try
			{
				if (method.getName().contains("set"))
				{
					Method declaredMethod = baseDTO.getClass().getDeclaredMethod(method.getName().replace("set", "get"), noparams);
					method.invoke(this, declaredMethod.invoke(baseDTO, null));
				}
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		}
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

}
