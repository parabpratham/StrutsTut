package com.c2s.test;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import com.c2s.base.dto.BaseDTO;
import com.c2s.login.dto.LoginDTO;
import com.c2s.login.form.LoginForm;

public class FillDTOTest
{

	/**
	 * @param args
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @throws IllegalArgumentException 
	 */
	public static void main(String[] args) throws IllegalArgumentException, IllegalAccessException, InvocationTargetException
	{
		LoginForm form = new LoginForm(10,"as","bb"); 
		/*Method[] formMethods = form.getClass().getMethods();
		for (Method method : formMethods)
		{
			System.out.print(method.getReturnType());
			System.out.println(" -- "+method.getName());
			if(method.getName().contains("get"))
			{
				Object invoke = method.invoke(form, null);
				System.out.println(""+invoke);
			}
		}*/
		/*LoginDTO loginDTO = new LoginDTO();
		loginDTO = (LoginDTO)form.fillDTO(loginDTO);
		System.out.print(loginDTO.getId()+" "+loginDTO.getEmail()+" "+loginDTO.getPassword());*/
		
		LoginDTO loginDTO = new LoginDTO();
		try
		{
			BaseDTO baseDTO = (BaseDTO) (Class.forName(loginDTO.getClass().getName()).newInstance());
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public BaseDTO fillDTO(BaseDTO baseDTO)
	{
		Class noparams[] =
		{};
		Method[] formMethods = this.getClass().getMethods();
		for (Method method : formMethods)
		{
			try
			{
				if (method.getName().contains("get"))
				{
					System.out.println(method.getName());
					Method declaredMethod = baseDTO.getClass().getDeclaredMethod(method.getName().replace("get", "set"), noparams);
					declaredMethod.invoke(baseDTO,method.invoke(this,null));
				}
			} catch (Exception e)
			{
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return baseDTO;
	}


}
