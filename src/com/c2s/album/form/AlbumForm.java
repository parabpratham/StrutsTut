package com.c2s.album.form;

import java.util.ArrayList;

import com.c2s.base.form.BaseForm;

public class AlbumForm extends BaseForm
{

	private static final long	serialVersionUID	= 6304317744398538831L;

	public String				album;

	public String				type;

	public String				category;

	public String				description;

	public String				userId;

	public String				artist;

	public String				years;

	public ArrayList<String>	yearsList;

	public ArrayList<String>	categoryList;

	public ArrayList<String>	typeList;

	public String getArtist()
	{
		return artist;
	}

	public void setArtist(String artist)
	{
		this.artist = artist;
	}

	public String getAlbum()
	{
		return album;
	}

	public void setAlbum(String album)
	{
		this.album = album;
	}

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}

	public String getCategory()
	{
		return category;
	}

	public void setCategory(String category)
	{
		this.category = category;
	}

	public String getDescription()
	{
		return description;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}

	public String getUserId()
	{
		return userId;
	}

	public void setUserId(String userId)
	{
		this.userId = userId;
	}

	public String getYears()
	{
		return years;
	}

	public void setYears(String years)
	{
		this.years = years;
	}

	public ArrayList<String> getYearsList()
	{
		return yearsList;
	}

	public void setYearsList(ArrayList<String> yearsList)
	{
		this.yearsList = yearsList;
	}

	public ArrayList<String> getCategoryList()
	{
		return categoryList;
	}

	public void setCategoryList(ArrayList<String> categoryList)
	{
		this.categoryList = categoryList;
	}

	public ArrayList<String> getTypeList()
	{
		return typeList;
	}

	public void setTypeList(ArrayList<String> typeList)
	{
		this.typeList = typeList;
	}

}