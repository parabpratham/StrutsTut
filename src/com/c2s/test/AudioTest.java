package com.c2s.test;

import java.io.File;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.media.Format;
import javax.media.Manager;
import javax.media.MediaLocator;
import javax.media.Player;
import javax.media.PlugInManager;
import javax.media.format.AudioFormat;

import org.farng.mp3.MP3File;

public class AudioTest
{
	public static int			count		= 1;

	public static Set<String>	albumSet	= new TreeSet<String>();
	
	public static List<File>	songList	= new LinkedList<File>();

	public static void main(String[] args)
	{
		Format input1 = new AudioFormat(AudioFormat.MPEGLAYER3);
		Format input2 = new AudioFormat(AudioFormat.MPEG);
		Format output = new AudioFormat(AudioFormat.LINEAR);
		PlugInManager.addPlugIn("com.sun.media.codec.audio.mp3.JavaDecoder", new Format[]
		{ input1, input2 }, new Format[]
		{ output }, PlugInManager.CODEC);
		try
		{
			Player player = Manager.createPlayer(new MediaLocator(new File("F:/Songs/English/2046485.mp3").toURI().toURL()));
			//player.start();
			File directory = new File("F:/Songs/Hindi/New Movies");
			listSongDetails(directory);
			count = 1;
			System.out.println("===============");
			for (String albums : albumSet)
			{
				System.out.println(count++ + ">" + albums);
			}
			System.out.println("===============");
			
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
		}
		System.exit(0);
	}

	public static void listSongDetails(File directory)
	{
		File[] listFiles = directory.listFiles();
		for (File file : listFiles)
		{
			if (file.isDirectory())
			{
				listSongDetails(file);
			}
			else
			{
				try
				{
					if (file.getName().contains(".mp3"))
					{
						songList.add(file);
						System.out.println(count++ + "> " + file.getName());
						MP3File mp3 = new MP3File(file.getAbsolutePath());
						System.out.println("Album:" + (mp3.getID3v1Tag() != null ? mp3.getID3v1Tag().getAlbumTitle() : ""));
						System.out.println("Band:" + (mp3.getID3v1Tag() != null ? mp3.getID3v1Tag().getLeadArtist() : ""));
						System.out.println("Composer:" + (mp3.getID3v2Tag() != null ? mp3.getID3v2Tag().getAuthorComposer() : ""));
						System.out.println("Year:" + (mp3.getID3v1Tag() != null ? mp3.getID3v1Tag().getYearReleased() : ""));
						System.out.println("Song Title:" + (mp3.getID3v1Tag() != null ? mp3.getID3v1Tag().getSongTitle() : ""));
						System.out.println("Genre:" + (mp3.getID3v1Tag() != null ? mp3.getID3v1Tag().getSongGenre() : ""));
						albumSet.add((mp3.getID3v1Tag() != null ? mp3.getID3v1Tag().getAlbumTitle() : "unknown"));
						System.out.println("-------------");
						
						/*1. Song Title : file.getName()
						 *2. AlbumId : mp3.getID3v1Tag().getAlbumTitle()
						 *3. LeadArtist : mp3.getID3v1Tag().getLeadArtist()
						 *4. Composer :  mp3.getID3v2Tag().getAuthorComposer()
						 *5. Year Released :  mp3.getID3v1Tag().getYearReleased()
						 *6. Genre : mp3.getID3v1Tag().getSongGenre()
						 *7. Lyrics : mp3.getID3v1Tag().getSongLyric()
						 *8. Song Title : mp3.getID3v1Tag().getSongTitle()
						 *9. Track No on Album : mp3.getID3v1Tag().getTrackNumberOnAlbum()
						 *10. Frame count : mp3.getID3v2Tag().getFrameCount()
						 *11. Size : mp3.getID3v2Tag().getSize()
						 *12. BitRate : mp3.getBitRate()
						 *13. Frequency : mp3.getFrequency()
						 *14. ID3v1tag : mp3.getID3v1Tag()
						 *15. ID3v2tag :mp3.getID3v2Tag()
						 *16. Id
						 *17. crated
						 *18. noplayed
						 *19. enum keytag      
						*/
						
						
						
						
						
						
						
						
						
					}
				}
				catch (Exception e)
				{
					// TODO: handle exception
					e.printStackTrace();
				}

			}
		}
	}
}
