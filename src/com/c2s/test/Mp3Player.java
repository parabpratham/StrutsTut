package com.c2s.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.SourceDataLine;
import javax.sound.sampled.TargetDataLine;

public class Mp3Player
{

	Mp3Player(String filename)
	{

		int total, totalToRead, numBytesRead, numBytesToRead;
		byte[] buffer;
		boolean stopped;
		AudioFormat wav;
		TargetDataLine line;
		SourceDataLine lineIn;
		DataLine.Info info;
		File file;
		FileInputStream fis;

		// AudioFormat(float sampleRate, int sampleSizeInBits,
		// int channels, boolean signed, boolean bigEndian)
		wav = new AudioFormat(44100, 16, 2, true, false);
		info = new DataLine.Info(SourceDataLine.class, wav);

		buffer = new byte[1024 * 333];
		numBytesToRead = 1024 * 333;
		total = 0;
		stopped = false;

		if (!AudioSystem.isLineSupported(info))
		{
			System.out.print("no support for " + wav.toString());
		}
		try
		{
			// Obtain and open the line.
			lineIn = (SourceDataLine) AudioSystem.getLine(info);
			lineIn.open(wav);
			lineIn.start();
			fis = new FileInputStream(file = new File(filename));
			totalToRead = fis.available();

			while (total < totalToRead && !stopped)
			{
				numBytesRead = fis.read(buffer, 0, numBytesToRead);
				if (numBytesRead == -1)
					break;
				total += numBytesRead;
				lineIn.write(buffer, 0, numBytesRead);
			}

		}
		catch (LineUnavailableException ex)
		{
			ex.printStackTrace();
		}
		catch (FileNotFoundException nofile)
		{
			nofile.printStackTrace();
		}
		catch (IOException io)
		{
			io.printStackTrace();
		}
	}

	public static void main(String[] argv)
	{
		// example playing file
		Mp3Player mb_745 = new Mp3Player("F:/Songs/English/2046485.mp3");

	}
}