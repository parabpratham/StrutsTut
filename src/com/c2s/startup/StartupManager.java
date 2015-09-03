package com.c2s.startup;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.apache.struts.action.ActionServlet;
import org.apache.struts.action.PlugIn;
import org.apache.struts.config.ModuleConfig;

public class StartupManager implements PlugIn
{
	private static List<String>	years		= new ArrayList<String>();
	private static List<String>	types		= new ArrayList<String>();
	private static List<String>	categories	= new ArrayList<String>();

	public StartupManager()
	{
		if (years.size() == 0)
		{
			years.add("1999");
			years.add("2000");
			years.add("2001");
		}

		if (types.size() == 0)
		{
			types.add("Jazz");
			types.add("Pop");
		}

		if (categories.size() == 0)
		{
			categories.add("A");
			categories.add("B");
		}

	}

	public void destroy()
	{
		
	}

	public void init(ActionServlet arg0, ModuleConfig arg1) throws ServletException
	{
		ServletContext sc = arg0.getServletContext();
		sc.setAttribute("years", years);
		sc.setAttribute("types", types);
		sc.setAttribute("categories", categories);
	}

}
