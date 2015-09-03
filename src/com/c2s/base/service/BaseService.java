package com.c2s.base.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts.util.ModuleException;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

import com.c2s.base.bean.BaseBO;
import com.c2s.base.dto.BaseDTO;

public class BaseService
{
	public static SessionFactory	buildSessionFactory	= null;
	public static int				openSessions		= 0;

	public BaseService()
	{
		buildSessionFactory();
	}

	private static void buildSessionFactory() throws HibernateException
	{
		if (buildSessionFactory == null)
		{
			Configuration configuration = new Configuration();
			configuration.configure("hibernate.cfg.xml");
			buildSessionFactory = configuration.buildSessionFactory();
		}
	}

	public static synchronized Session getSession()
	{
		buildSessionFactory();
		openSessions++;
		return buildSessionFactory.openSession();
	}

	public static synchronized void closeSession(Session openSession)
	{
		buildSessionFactory();
		openSessions--;
		openSession.close();
	}

	public static List<BaseDTO> findBaseDTOList(String BOClass, String dtoClass, String specification) throws ModuleException
	{
		Session openSession = null;
		List<BaseDTO> dtoList = new ArrayList<BaseDTO>();
		try
		{
			openSession = BaseService.getSession();
			String query = "from " + BOClass;
			if (specification != null)
				query += specification.equalsIgnoreCase("") ? "" : " where " + specification;
			Query createQuery = openSession.createQuery(query);
			List<BaseBO> list = createQuery.list();
			for (BaseBO baseBO : list)
			{
				BaseDTO dto = baseBO.toDTO(dtoClass);
				dtoList.add(dto);
			}

		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			if (openSession != null)
				BaseService.closeSession(openSession);
		}
		return dtoList;

	}

	public static BaseBO findBaseBOById(int id, Class<?> type) throws ModuleException
	{

		Session openSession = null;
		BaseBO baseBO = null;
		try
		{
			openSession = BaseService.getSession();
			Query createQuery = openSession.createQuery("from " + type.getName() + " where id = '" + id + "' ");
			List list = createQuery.list();
			if (list != null && list.size() > 0)
			{
				baseBO = (BaseBO) (type.cast(list.get(0)));
			}

		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			if (openSession != null)
				BaseService.closeSession(openSession);
		}
		return baseBO;

	}

	public static void saveOrUpdate(BaseBO baseBO) throws Exception
	{
		Session openSession = null;
		try
		{
			openSession = BaseService.getSession();
			Transaction beginTransaction = openSession.beginTransaction();
			beginTransaction.begin();
			openSession.saveOrUpdate(baseBO);
			beginTransaction.commit();
		} catch (Exception e)
		{
			e.printStackTrace();
			throw new Exception("Error in saving");
		} finally
		{
			if (openSession != null)
				BaseService.closeSession(openSession);
		}
	}

	public static void delete(BaseDTO baseDTO, Class<?> type) throws Exception
	{
		Session openSession = null;
		try
		{
			BaseBO baseBO = findBaseBOById(Integer.parseInt(baseDTO.getId()), type);
			if (baseBO == null)
			{
				throw new Exception("Object not Found");
			} else
			{
				openSession = BaseService.getSession();
				Transaction beginTransaction = openSession.beginTransaction();
				beginTransaction.begin();
				openSession.delete(baseBO);
				beginTransaction.commit();
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			throw new Exception("Error in saving");
		} finally
		{
			if (openSession != null)
				BaseService.closeSession(openSession);
		}
	}

	/**
	 * @param id
	 * @param type
	 * @param baseDTO
	 * @return
	 * @throws ModuleException
	 *             Type ==> Type of BO
	 */

	public static BaseDTO findBaseDTOById(int id, Class<?> type, BaseDTO baseDTO) throws ModuleException
	{
		BaseBO baseBO = findBaseBOById(id, type);
		return baseBO.toDTO(baseDTO);

	}
}
