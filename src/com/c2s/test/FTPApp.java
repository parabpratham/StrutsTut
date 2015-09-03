package com.c2s.test;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Cursor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.StringTokenizer;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JProgressBar;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.SwingUtilities;
import javax.swing.border.BevelBorder;
import javax.swing.border.EmptyBorder;

import sun.net.TelnetInputStream;
import sun.net.ftp.FtpClient;

public class FTPApp extends JFrame
{
	public static int			BUFFER_SIZE			= 10240;

	protected JTextField		userNameTextField	= new JTextField("anonymous");

	protected JPasswordField	passwordTextField	= new JPasswordField(10);

	protected JTextField		urlTextField		= new JTextField(20);

	protected JTextField		fileTextField		= new JTextField(10);

	protected JTextArea			monitorTextArea		= new JTextArea(5, 20);

	protected JProgressBar		m_progress			= new JProgressBar();

	protected JButton			putButton			= new JButton("Put");

	protected JButton			getButton;

	protected JButton			fileButton			= new JButton("File");

	protected JButton			closeButton			= new JButton("Close");

	protected JFileChooser		fileChooser			= new JFileChooser();
	protected FtpClient			ftpClient;

	protected String			localFileName;

	protected String			remoteFileName;

	public FTPApp()
	{
		super("FTP Client");

		JPanel p = new JPanel();
		p.setBorder(new EmptyBorder(5, 5, 5, 5));

		p.add(new JLabel("User name:"));
		p.add(userNameTextField);
		p.add(new JLabel("Password:"));
		p.add(passwordTextField);
		p.add(new JLabel("URL:"));
		p.add(urlTextField);
		p.add(new JLabel("File:"));
		p.add(fileTextField);

		monitorTextArea.setEditable(false);
		JScrollPane ps = new JScrollPane(monitorTextArea);
		p.add(ps);

		m_progress.setStringPainted(true);
		m_progress.setBorder(new BevelBorder(BevelBorder.LOWERED, Color.white, Color.gray));
		m_progress.setMinimum(0);
		JPanel p1 = new JPanel(new BorderLayout());
		p1.add(m_progress, BorderLayout.CENTER);
		p.add(p1);

		ActionListener lst = new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				if (connect())
				{
					Thread uploader = new Thread()
					{
						public void run()
						{
							putFile();
							disconnect();
						}
					};
					uploader.start();
				}
			}
		};
		putButton.addActionListener(lst);
		putButton.setMnemonic('p');
		p.add(putButton);

		getButton = new JButton("Get");
		lst = new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				if (connect())
				{
					Thread downloader = new Thread()
					{
						public void run()
						{
							getFile();
							disconnect();
						}
					};
					downloader.start();
				}
			}
		};
		getButton.addActionListener(lst);
		getButton.setMnemonic('g');
		p.add(getButton);

		lst = new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				if (fileChooser.showSaveDialog(FTPApp.this) != JFileChooser.APPROVE_OPTION)
					return;
				File f = fileChooser.getSelectedFile();
				fileTextField.setText(f.getPath());
			}
		};
		fileButton.addActionListener(lst);
		fileButton.setMnemonic('f');
		p.add(fileButton);
		lst = new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				if (ftpClient != null)
					disconnect();
				else
					System.exit(0);
			}
		};
		closeButton.addActionListener(lst);
		closeButton.setDefaultCapable(true);
		closeButton.setMnemonic('g');
		p.add(closeButton);

		getContentPane().add(p, BorderLayout.CENTER);
		fileChooser.setCurrentDirectory(new File("."));
		fileChooser.setApproveButtonToolTipText("Select file for upload/download");

		WindowListener wndCloser = new WindowAdapter()
		{
			public void windowClosing(WindowEvent e)
			{
				disconnect();
				System.exit(0);
			}
		};
		addWindowListener(wndCloser);

		setSize(720, 240);
		setVisible(true);
	}

	public void setButtonStates(boolean state)
	{
		putButton.setEnabled(state);
		getButton.setEnabled(state);
		fileButton.setEnabled(state);
	}

	protected boolean connect()
	{
		monitorTextArea.setText("");
		setButtonStates(false);
		closeButton.setText("Cancel");
		setCursor(Cursor.getPredefinedCursor(Cursor.WAIT_CURSOR));

		String user = userNameTextField.getText();
		if (user.length() == 0)
		{
			setMessage("Please enter user name");
			setButtonStates(true);
			return false;
		}
		String password = new String(passwordTextField.getPassword());
		String sUrl = urlTextField.getText();
		if (sUrl.length() == 0)
		{
			setMessage("Please enter URL");
			setButtonStates(true);
			return false;
		}
		localFileName = fileTextField.getText();

		// Parse URL
		int index = sUrl.indexOf("//");
		if (index >= 0)
			sUrl = sUrl.substring(index + 2);

		index = sUrl.indexOf("/");
		String host = sUrl.substring(0, index);
		sUrl = sUrl.substring(index + 1);

		String sDir = "";
		index = sUrl.lastIndexOf("/");
		if (index >= 0)
		{
			sDir = sUrl.substring(0, index);
			sUrl = sUrl.substring(index + 1);
		}
		remoteFileName = sUrl;

		try
		{
			setMessage("Connecting to host " + host);
			ftpClient = new FtpClient(host);
			ftpClient.login(user, password);
			setMessage("User " + user + " login OK");
			setMessage(ftpClient.welcomeMsg);
			ftpClient.cd(sDir);
			setMessage("Directory: " + sDir);
			ftpClient.binary();
			return true;
		} catch (Exception ex)
		{
			setMessage("Error: " + ex.toString());
			setButtonStates(true);
			return false;
		}
	}

	protected void disconnect()
	{
		if (ftpClient != null)
		{
			try
			{
				ftpClient.closeServer();
			} catch (IOException ex)
			{
			}
			ftpClient = null;
		}
		Runnable runner = new Runnable()
		{
			public void run()
			{
				m_progress.setValue(0);
				putButton.setEnabled(true);
				getButton.setEnabled(true);
				fileButton.setEnabled(true);
				closeButton.setText("Close");
				FTPApp.this.setCursor(Cursor.getPredefinedCursor(Cursor.DEFAULT_CURSOR));
			}
		};
		SwingUtilities.invokeLater(runner);
	}

	protected void getFile()
	{
		if (localFileName.length() == 0)
		{
			localFileName = remoteFileName;
			SwingUtilities.invokeLater(new Runnable()
			{
				public void run()
				{
					fileTextField.setText(localFileName);
				}
			});
		}
		byte[] buffer = new byte[BUFFER_SIZE];
		try
		{
			int size = getFileSize(ftpClient, remoteFileName);
			if (size > 0)
			{
				setMessage("File " + remoteFileName + ": " + size + " bytes");
				setProgressMaximum(size);
			} else
				setMessage("File " + remoteFileName + ": size unknown");
			FileOutputStream out = new FileOutputStream(localFileName);
			InputStream in = ftpClient.get(remoteFileName);
			int counter = 0;
			while (true)
			{
				int bytes = in.read(buffer);
				if (bytes < 0)
					break;

				out.write(buffer, 0, bytes);
				counter += bytes;
				if (size > 0)
				{
					setProgressValue(counter);
					int proc = (int) Math.round(m_progress.getPercentComplete() * 100);
					setProgressString(proc + " %");
				} else
				{
					int kb = counter / 1024;
					setProgressString(kb + " KB");
				}
			}
			out.close();
			in.close();
		} catch (Exception ex)
		{
			setMessage("Error: " + ex.toString());
		}
	}

	protected void putFile()
	{
		if (localFileName.length() == 0)
		{
			setMessage("Please enter file name");
		}
		byte[] buffer = new byte[BUFFER_SIZE];
		try
		{
			File f = new File(localFileName);
			int size = (int) f.length();
			setMessage("File " + localFileName + ": " + size + " bytes");
			setProgressMaximum(size);
			FileInputStream in = new FileInputStream(localFileName);
			OutputStream out = ftpClient.put(remoteFileName);

			int counter = 0;
			while (true)
			{
				int bytes = in.read(buffer);
				if (bytes < 0)
					break;
				out.write(buffer, 0, bytes);
				counter += bytes;
				setProgressValue(counter);
				int proc = (int) Math.round(m_progress.getPercentComplete() * 100);
				setProgressString(proc + " %");
			}

			out.close();
			in.close();
		} catch (Exception ex)
		{
			setMessage("Error: " + ex.toString());
		}
	}

	protected void setMessage(final String str)
	{
		if (str != null)
		{
			Runnable runner = new Runnable()
			{
				public void run()
				{
					monitorTextArea.append(str + '\n');
					monitorTextArea.repaint();
				}
			};
			SwingUtilities.invokeLater(runner);
		}
	}

	protected void setProgressValue(final int value)
	{
		Runnable runner = new Runnable()
		{
			public void run()
			{
				m_progress.setValue(value);
			}
		};
		SwingUtilities.invokeLater(runner);
	}

	protected void setProgressMaximum(final int value)
	{
		Runnable runner = new Runnable()
		{
			public void run()
			{
				m_progress.setMaximum(value);
			}
		};
		SwingUtilities.invokeLater(runner);
	}

	protected void setProgressString(final String string)
	{
		Runnable runner = new Runnable()
		{
			public void run()
			{
				m_progress.setString(string);
			}
		};
		SwingUtilities.invokeLater(runner);
	}

	public static int getFileSize(FtpClient client, String fileName) throws IOException
	{
		TelnetInputStream lst = client.list();
		String str = "";
		fileName = fileName.toLowerCase();
		while (true)
		{
			int c = lst.read();
			char ch = (char) c;
			if (c < 0 || ch == '\n')
			{
				str = str.toLowerCase();
				if (str.indexOf(fileName) >= 0)
				{
					StringTokenizer tk = new StringTokenizer(str);
					int index = 0;
					while (tk.hasMoreTokens())
					{
						String token = tk.nextToken();
						if (index == 4)
							try
							{
								return Integer.parseInt(token);
							} catch (NumberFormatException ex)
							{
								return -1;
							}
						index++;
					}
				}
				str = "";
			}
			if (c <= 0)
				break;
			str += ch;
		}
		return -1;
	}

	public static void main(String argv[])
	{
		new FTPApp();
	}
}