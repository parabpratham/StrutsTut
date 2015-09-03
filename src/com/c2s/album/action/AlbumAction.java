package com.c2s.album.action;

import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.c2s.album.bean.AlbumBO;
import com.c2s.album.dto.AlbumDTO;
import com.c2s.album.form.AlbumForm;
import com.c2s.base.action.BaseAction;
import com.c2s.base.service.BaseService;
import com.c2s.user.dto.UserDTO;

public class AlbumAction extends BaseAction
{
	public ActionForward add(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ServletContext sc = this.getServlet().getServletContext();
		AlbumForm albumForm = (AlbumForm) form;
		String id = "" + request.getAttribute("id");
		if (id != null && !"null".equalsIgnoreCase(id) && !"".equalsIgnoreCase(id))
			albumForm.setId(id);

		return (mapping.findForward("new"));
	}

	public ActionForward view(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		int id = convertID((String) request.getParameter("id"));
		if (id > 0)
		{
			// create a new AlbumBean passing the datasource
			AlbumDTO album = null;
			album = (AlbumDTO) (BaseService.findBaseDTOById(id, AlbumBO.class, album));
			ServletContext sc = this.getServlet().getServletContext();
			((AlbumForm) form).fillForm(album);
		}
		return (mapping.findForward("new"));
	}

	public ActionForward delete(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		try
		{
			AlbumDTO albumDTO = new AlbumDTO();
			albumDTO.setId("" + (String) request.getParameter("id"));
			BaseService.delete(albumDTO, AlbumBO.class);
		}
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		return (mapping.findForward("success"));
	}

	public ActionForward cancel(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		return (mapping.findForward("cancel"));
	}

	public ActionForward save(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		try
		{
			UserDTO user = (UserDTO) request.getSession().getAttribute("user");
			AlbumDTO album = new AlbumDTO();
			((AlbumForm) form).fillDTO(album);
			album.setUserId(user.getId());
			album = (AlbumDTO) (new AlbumBO()).saveBo(album);
			if (album != null)
			{
				// save UserDTO in session
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("userName", user.getUserName());
				return (mapping.findForward("success"));
			}
			else
			{
				// create ActionError and save in the request
				ActionErrors errors = new ActionErrors();
				ActionError error = new ActionError("error.join.exists");
				errors.add("join", error);
				saveErrors(request, errors);
				return (mapping.findForward("failure"));
			}

		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw e;
		}
	}

	public ActionForward update(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		try
		{
			UserDTO user = (UserDTO) request.getSession().getAttribute("user");

			AlbumDTO album = new AlbumDTO();
			((AlbumForm) form).fillDTO(album);
			album.setUserId(user.getId());
			album = (AlbumDTO) (new AlbumBO()).saveBo(album);
			if (album != null)
			{
				// save UserDTO in session
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("userName", user.getUserName());
				return (mapping.findForward("success"));
			}
			else
			{
				// create ActionError and save in the request
				ActionErrors errors = new ActionErrors();
				ActionError error = new ActionError("error.join.exists");
				errors.add("join", error);
				saveErrors(request, errors);
				return (mapping.findForward("failure"));
			}

		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw e;
		}
	}

	public ActionForward getTypeList(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		response.setContentType("text/xml");
		response.setHeader("cache-control", "no-cache");
		response.setStatus(HttpServletResponse.SC_OK);
		PrintWriter out = response.getWriter();
		String parameter = request.getParameter("param");
		System.out.println(parameter);
		out.println("<options>");
		ServletContext sc = this.getServlet().getServletContext();
		ArrayList<String> typeList = (ArrayList<String>) sc.getAttribute("types");
		for (String type : typeList)
		{
			out.println("<option>" + type + "</option>");
			System.out.println("<option>" + type + "</option>");
		}
		out.println("</options>");
		out.println();
		out.flush();
		return null;

	}

	public ActionForward getCategoryList(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		response.setContentType("text/xml");
		response.setHeader("cache-control", "no-cache");
		response.setStatus(HttpServletResponse.SC_OK);
		PrintWriter out = response.getWriter();
		out.println("<options>");
		ServletContext sc = this.getServlet().getServletContext();
		ArrayList<String> typeList = (ArrayList<String>) sc.getAttribute("categories");
		for (String type : typeList)
		{
			out.println("<option>" + type + "</option>");
		}
		out.println("</options>");
		out.println();
		out.flush();
		return null;

	}

	public ActionForward getYearList(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		response.setContentType("text/xml");
		response.setHeader("cache-control", "no-cache");
		response.setStatus(HttpServletResponse.SC_OK);
		PrintWriter out = response.getWriter();
		AlbumForm albumForm = (AlbumForm) form;
		out.println("<options>");
		ServletContext sc = this.getServlet().getServletContext();
		ArrayList<String> typeList = (ArrayList<String>) sc.getAttribute("year");
		for (String type : typeList)
		{
			out.println("<option>" + type + "</option>");
		}
		out.println("</options>");
		out.println();
		out.flush();
		return null;

	}

}