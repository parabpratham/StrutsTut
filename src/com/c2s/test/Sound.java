package com.c2s.test;

import java.io.File;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Clip;

public class Sound
{
	private Clip	clip;

	public Sound(String filepath)
	{
		System.out.println(filepath);
		File file = new File(filepath);
		try
		{
			clip = AudioSystem.getClip();
			AudioInputStream inputStream = AudioSystem.getAudioInputStream(file);
			clip.open(inputStream);
		}
		catch (Exception e)
		{
			System.err.println(e.getMessage());
		}
	}

	public void play()
	{
		System.out.println("play");
		if (clip.isActive())
		{
			clip.stop();
		}
		clip.setFramePosition(0);
		clip.start();
	}

	public void stop()
	{
		clip.stop();
	}

	public void loop()
	{
		if (!clip.isActive())
		{
			clip.setFramePosition(0);
			clip.loop(Clip.LOOP_CONTINUOUSLY);
		}
		else
		{
			System.out.println("ALREADY PLAYING");
		}

	}

	public boolean getActive()
	{
		return clip.isActive();
	}
}
