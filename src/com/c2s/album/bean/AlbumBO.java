package com.c2s.album.bean;

import java.util.Date;

import com.c2s.base.bean.BaseBO;

public class AlbumBO extends BaseBO
{

	public String	album;

	public String	type;

	public String	category;

	public String	description;

	public Integer	userId;

	public Date		created;

	public Date		year;

	public Date		artist;

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

	public Integer getUserId()
	{
		return userId;
	}

	public void setUserId(Integer userId)
	{
		this.userId = userId;
	}

	public Date getCreated()
	{
		return created;
	}

	public void setCreated(Date created)
	{
		this.created = created;
	}

	public Date getYear()
	{
		return year;
	}

	public void setYear(Date year)
	{
		this.year = year;
	}

	public Date getArtist()
	{
		return artist;
	}

	public void setArtist(Date artist)
	{
		this.artist = artist;
	}

}