package com.c2s.album.action;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.c2s.album.bean.AlbumBO;
import com.c2s.album.dto.AlbumDTO;
import com.c2s.base.action.BaseListAction;
import com.c2s.base.dto.BaseDTO;
import com.c2s.base.service.BaseService;
import com.c2s.user.dto.UserDTO;

public class AlbumListAction extends BaseListAction
{
	public ActionForward list(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		UserDTO user = (UserDTO) request.getSession().getAttribute("user");
		List<BaseDTO> findBaseDTOList = BaseService.findBaseDTOList(AlbumBO.class.getName(),AlbumDTO.class.getName(), " userId = " + user.getId());
		List<AlbumDTO> albumList = new LinkedList<AlbumDTO>();
		for (BaseDTO baseDTO : findBaseDTOList)
		{
			AlbumDTO albumDTO = (AlbumDTO) baseDTO;
			albumDTO.setDeleteLink(getDeleteLink(albumDTO.getId()));
			albumList.add(albumDTO);
		}
		request.setAttribute("albumList", albumList);
		return mapping.findForward("success");
	}

	@Override
	protected String getDeleteLink(String id)
	{
		String deleteLink = "http://localhost:11090/StrutsTut/album.do?method=delete&id=" + id;
		return deleteLink;
	}

	public ActionForward add(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		return mapping.findForward("newalbum");
	}

	public ActionForward logoff(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		return mapping.findForward("logoff");
	}
}
