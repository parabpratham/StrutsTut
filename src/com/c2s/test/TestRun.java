	package com.c2s.test;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.classic.Session;

import com.c2s.album.bean.AlbumBO;
import com.c2s.album.dto.AlbumDTO;
import com.c2s.base.service.BaseService;
import com.c2s.user.bean.UserBO;

public class TestRun
{

	/**
	 * @param args
	 */
	public static void main(String[] args)
	{
		Session openSession = BaseService.getSession();
		Query createQuery = openSession.createQuery("from " + UserBO.class.getName());
		List<UserBO> list = createQuery.list();
		int i = 1;
		try
		{
			UserBO userBO = list.get(0);
			AlbumDTO album = new AlbumDTO();
			album.setAlbum("Prit ki");
			album.setDescription("Prit ki desc");
			album.setCategory("A");
			album.setType("Jazz");
			album.setUserId("" + userBO.getId());
			album.setYear(DateUtils.toString(DateUtils.now()));
			album.setCreated(DateUtils.toString(DateUtils.now()));
			AlbumDTO saveBo = (AlbumDTO) new AlbumBO().saveBo(album);
			System.out.println(saveBo.getId());
			
			/*AlbumDTO album = new AlbumDTO();
			album.setId(""+2);
			BaseService.delete(album, AlbumBO.class);*/
			
			
			/*
			 * UserDTO userDTO = new UserDTO(); userBO.toDTO(userDTO); UserBO
			 * userDTO1 = (UserBO) userBO.fillBO(userDTO);
			 * System.out.println("Connection succesfull");
			 */

			/*
			 * UserBO findBaseBOById = (UserBO)
			 * BaseService.findBaseBOById(userBO.getId(), UserBO.class);
			 * System.out.println(findBaseBOById.getId());
			 */

			/*
			 * Transaction beginTransaction = openSession.beginTransaction();
			 * for (UserBO userBO : list) { beginTransaction.begin();
			 * userBO.setEmail(userBO.getUserName() == null ? "C2S" + i :
			 * userBO.getUserName().replace(" ", "") + "@C2S.COM");
			 * openSession.saveOrUpdate(userBO); beginTransaction.commit(); }
			 */
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			BaseService.closeSession(openSession);
		}
		System.out.println("Connection succesfull");
	}

}
