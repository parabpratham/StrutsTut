package com.c2s.base.dto;

import java.lang.reflect.Method;

import com.c2s.base.form.BaseForm;

public class BaseDTO
{

	private String	id;

	private String	updateLink;

	private String	deleteLink;

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public void fillDTO(BaseForm baseForm)
	{
		// String parameter
		Class[] paramString = new Class[1];
		paramString[0] = String.class;
		Method[] formMethods = baseForm.getClass().getMethods();
		for (Method method : formMethods)
		{
			try
			{
				if (method.getName().contains("get"))
				{
					Method DTOMethod = this.getClass().getDeclaredMethod(method.getName().replace("get", "set"), paramString);
					DTOMethod.invoke(this, method.invoke(baseForm, null));
				}
			} catch (Exception e)
			{
				// e.printStackTrace();
			}
		}
	}

	public String getUpdateLink()
	{
		return updateLink;
	}

	public void setUpdateLink(String updateLink)
	{
		this.updateLink = updateLink;
	}

	public String getDeleteLink()
	{
		return deleteLink;
	}

	public void setDeleteLink(String deleteLink)
	{
		this.deleteLink = deleteLink;
	}
}
