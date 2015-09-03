package com.c2s.test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class ClassCreator
{

	private final static String	projectSourcePath	= "G:\\Projects\\MusicCollection\\src\\";
	private final static String	rootPackage			= "com.c2s.music.";
	private final static String	className			= "Song";
	public final static int		PACKAGE				= 1;
	public final static int		ACTION				= 2;
	public final static int		BEAN				= 3;
	public final static int		DTO					= 4;
	public final static int		FORM				= 5;
	public final static int		SERVICE				= 6;

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception
	{
		int choice = 1;
		File file;
		String packageName = rootPackage + className.toLowerCase();
		System.out.println("Package Name : " + packageName);
		for (choice = 1; choice < 6; choice++)
		{

			switch (choice)
			{
			case PACKAGE:
				file = new File(projectSourcePath + packageName.replace(".", "\\"));
				break;
			case ACTION:
				// Create action,dto,form,service,jsp
				String action = packageName.replace(".", "\\") + "\\action";
				System.out.println(action);
				file = new File(projectSourcePath + action);
				file.mkdirs();
				String actionClass = packageName.replace(".", "\\") + "\\action\\" + className + "Action" + ".java";
				file = new File(projectSourcePath + actionClass);
				file.createNewFile();
				actionWriteClass(packageName, className + "Action");
				break;
			case BEAN:
				// Create Bean
				String bean = packageName.replace(".", "\\") + "\\bean";
				System.out.println(bean);
				file = new File(projectSourcePath + bean);
				file.mkdirs();
				String beanClass = packageName.replace(".", "\\") + "\\bean\\" + className + "BO" + ".java";
				file = new File(projectSourcePath + beanClass);
				file.createNewFile();
				String beanBOHBM = packageName.replace(".", "\\") + "\\bean\\" + className + "BO" + ".hbm.xml";
				file = new File(projectSourcePath + beanBOHBM);
				file.createNewFile();
				String beanScript = packageName.replace(".", "\\") + "\\bean\\" + className + "BO" + "_scripts.txt";
				file = new File(projectSourcePath + beanScript);
				file.createNewFile();
				break;
			case DTO:
				// Create DTO
				String DTO = packageName.replace(".", "\\") + "\\dto";
				file = new File(projectSourcePath + DTO);
				file.mkdirs();
				String DTOClass = packageName.replace(".", "\\") + "\\dto\\" + className + "DTO" + ".java";
				file = new File(projectSourcePath + DTOClass);
				file.createNewFile();
				break;
			case FORM:
				// Create DTO
				String form = packageName.replace(".", "\\") + "\\form";
				file = new File(projectSourcePath + form);
				file.mkdirs();
				String formClass = packageName.replace(".", "\\") + "\\form\\" + className + "Form" + ".java";
				file = new File(projectSourcePath + formClass);
				file.createNewFile();
				break;
			case SERVICE:
				// Create service
				String service = packageName.replace(".", "\\") + "\\service";
				file = new File(projectSourcePath + service);
				file.mkdirs();
				String serviceClass = packageName.replace(".", "\\") + "\\service\\" + className + "Service" + ".java";
				file = new File(projectSourcePath + serviceClass);
				file.createNewFile();
				serviceWriteClass(packageName, className + "Service");
				break;
			default:
				break;
			}
		}

		// Adopt property files.
		System.out.println("Enter property fields ");
		String propertyString = "";
		List<BOProperties> properties = new ArrayList<BOProperties>();
		do
		{
			if (!propertyString.equalsIgnoreCase(""))
				properties.add(createPropertyFields(propertyString));
			BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
			propertyString = in.readLine();
		}
		while (!propertyString.equalsIgnoreCase(""));

		writeTOFiles(packageName, className, properties);

	}

	private static String getRootImport(String type)
	{
		return "\n\nimport " + rootPackage.toLowerCase() + "base" + type;
	}

	private static void writeTOFiles(String packageName, String className, List<BOProperties> properties)
	{
		/*
		 * For BO beans
		 */
		StringBuffer BOJavabuffer = new StringBuffer();
		String BOclassName = projectSourcePath + packageName.replace(".", "\\") + "\\bean\\" + className + "BO.java";
		BOJavabuffer.append("package " + packageName.toLowerCase() + ".bean;");
		BOJavabuffer.append(getRootImport(".bean.BaseBO"));
		BOJavabuffer.append("\n\npublic class " + className + "BO extends BaseBO {");

		/*
		 * For DTO beans
		 */
		StringBuffer DTOJavabuffer = new StringBuffer();
		String DTOclassName = projectSourcePath + packageName.replace(".", "\\") + "\\dto\\" + className + "DTO.java";
		DTOJavabuffer.append("package " + packageName.toLowerCase() + ".dto;");
		DTOJavabuffer.append(getRootImport(".dto.BaseDTO"));
		DTOJavabuffer.append("\n\npublic class " + className + "DTO extends BaseDTO {");

		/*
		 * For FORM beans
		 */
		StringBuffer formJavabuffer = new StringBuffer();
		String formClassName = projectSourcePath + packageName.replace(".", "\\") + "\\form\\" + className + "Form.java";
		formJavabuffer.append("package " + packageName.toLowerCase() + ".form;");
		formJavabuffer.append(getRootImport(".form.BaseForm"));
		formJavabuffer.append("\n\npublic class " + className + "Form extends BaseForm {");

		for (BOProperties property : properties)
		{
			/*
			 * For BO beans
			 */
			BOJavabuffer.append("\n\n\t\tpublic " + property.propertyType + " " + property.propertyName + ";");

			/*
			 * For DTO beans
			 */

			DTOJavabuffer.append("\n\n\t\tpublic String " + property.propertyName + ";");

			/*
			 * For FORM beans
			 */

			formJavabuffer.append("\n\n\t\tpublic String " + property.propertyName + ";");

			System.out.println("<property name=\"" + property.propertyName + "\" column=\"" + property.propertyDBname + "\"></property>");
		}

		BOJavabuffer.append("\n\n\t}");
		write(BOclassName, BOJavabuffer);

		DTOJavabuffer.append("\n\n\t}");
		write(DTOclassName, DTOJavabuffer);

		formJavabuffer.append("\n\n\t}");
		write(formClassName, formJavabuffer);
	}

	private static BOProperties createPropertyFields(String propertyString)
	{
		String[] split = propertyString.split(",");
		BOProperties properties = new BOProperties();
		properties.propertyName = split[0];
		properties.propertyType = split[1];
		properties.propertyDBname = split[2];
		properties.propertyDBtype = split[3];
		return properties;
	}

	private static void serviceWriteClass(String packageName, String className)
	{
		StringBuffer buffer = new StringBuffer();
		buffer.append("package " + packageName.toLowerCase() + ".service;");
		buffer.append(getRootImport("service.BaseService"));
		buffer.append("\n\npublic class " + className + " extends BaseService {");
		/*
		 * buffer.append("\n\n\tpublic ActionForward execute(ActionMapping
		 * mapping, ActionForm form, HttpServletRequest request,
		 * HttpServletResponse response) throws Exception");
		 * buffer.append("\n\t{\n\t\tnew ActionForward();\n\t}");
		 */
		buffer.append("\n\n}");
		String fileName = projectSourcePath + packageName.replace(".", "\\") + "\\service\\" + className + ".java";
		write(fileName, buffer);

	}

	public static void actionWriteClass(String packageName, String className) throws FileNotFoundException
	{
		StringBuffer buffer = new StringBuffer();
		buffer.append("package " + packageName.toLowerCase() + ".action;");
		buffer.append(getRootImport("action.BaseAction"));
		buffer.append("\n\npublic class " + className + " extends BaseAction {");
		/*
		 * buffer.append("\n\n\tpublic ActionForward execute(ActionMapping
		 * mapping, ActionForm form, HttpServletRequest request,
		 * HttpServletResponse response) throws Exception");
		 * buffer.append("\n\t{\n\t\tnew ActionForward();\n\t}");
		 */
		buffer.append("\n\n}");
		System.out.println(buffer.toString());
		String fileName = projectSourcePath + packageName.replace(".", "\\") + "\\action\\" + className + ".java";
		write(fileName, buffer);
	}

	public static void write(String fileName, StringBuffer buffer)
	{
		try
		{
			// Create file
			FileWriter fstream = new FileWriter(fileName);
			BufferedWriter out = new BufferedWriter(fstream);
			out.write(buffer.toString());
			// Close the output stream
			out.close();
		}
		catch (Exception e)
		{// Catch exception if any
			System.err.println("Error: " + e.getMessage());
		}
	}

}