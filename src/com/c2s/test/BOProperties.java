package com.c2s.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class BOProperties
{
	public BOProperties()
	{
	}

	public BOProperties(String propertyName, String propertyType, String propertyDBname, String propertyDBtype)
	{
		this.propertyName = propertyName;
		this.propertyType = propertyType;
		this.propertyDBname = propertyDBname;
		this.propertyDBtype = propertyDBtype;
	}

	String	propertyName;
	String	propertyType;
	String	propertyDBname;
	String	propertyDBtype;

	// /URL url = new
	// URL("http://www.google.com/complete/search?hl=en&js=true&qu=ajax");
	public static void main(String[] args) throws Exception
	{

		URL url = new URL("https://ajax.googleapis.com/ajax/services/search/images?"
				+ "v=1.0&q=barack%20obama&key=ABQIAAAAMDidA1PAO0alsihAElsy3xTLCrE5uk8Ud_JrDKiWLKYeT0PD8xQ9hbFvmXJ2enaXdFRHJflbRAe36A&userip=222.222.222.10");
		URLConnection connection = url.openConnection();
		connection.addRequestProperty("Referer", "http://www.defekas.com");
		String line;
		StringBuilder builder = new StringBuilder();
		BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		while ((line = reader.readLine()) != null)
		{
			builder.append(line);
		}

	}
}
