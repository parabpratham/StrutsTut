package com.c2s.base.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.util.ModuleException;

public class BaseAction extends DispatchAction
{
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ActionForward execute = null;
		try
		{
			execute = super.execute(mapping, form, request, response);
		} catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
		}
		if (execute == null)
		{
			return mapping.findForward("ErrorPage");
		} else
		{
			return execute;
		}
	}

	protected int convertID(String id) throws ModuleException
	{
		int idNum = 0;
		if (id != null)// id should contain the id of the album to delete
			if (!id.equals(""))// then user is request to delete an album
			{
				// convert the String id to int id
				try
				{
					idNum = Integer.parseInt(id);
				} catch (NumberFormatException nfe)
				{
					log.error("error in converting string to a number");
					log.error(nfe.getLocalizedMessage());
					ModuleException me = new ModuleException("error.nfe.message");
					throw me;
				}
			}
		return idNum;
	}
}
