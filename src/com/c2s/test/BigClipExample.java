package com.c2s.test;

import java.net.URL;

import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.swing.JOptionPane;

public class BigClipExample
{
	public static void main(String[] args) throws Exception
	{
		URL url = new URL("F:/Songs/English/2046485.mp3");
		BigClip clip = new BigClip();
		AudioInputStream ais = AudioSystem.getAudioInputStream(url);
		clip.open(ais);
		clip.start();
		JOptionPane.showMessageDialog(null, "BigClip.start()");
		clip.loop(4);
		JOptionPane.showMessageDialog(null, "BigClip.loop(4)");
		clip.setFastForward(true);
		clip.loop(8);
		// the looping/FF combo. reveals a bug..
		// there is a slight 'click' in the sound that should not be audible
		JOptionPane.showMessageDialog(null, "Are you on speed?");
	}

}
