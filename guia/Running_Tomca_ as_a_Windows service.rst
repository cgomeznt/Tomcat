Running Tomcat as a Windows service
======================================

When you install Tomcat on a Windows Server you have the option to run it as a Windows service. If you chose that option and are running Tomcat as a Windows server, your Windows service does not include the Java classpath or Java options you just set.
In this section, you install and update the Tomcat Windows service to include the required Java classpath and options.
NoteFor Kerberos authentication, the Tomcat server must run as a Windows service and the service must be configured to run as a Local System account.

1.Stop the service: There are two ways to stop a service::

	* Open Start > Administrative Tools > Services. Select the Tomcat service, right click, then click Stop.
	* Enter net stop service-name where service-name is the name of your current Tomcat service.

2.- Open a command window, go to the Tomcat bin directory, then enter the command::

	service.bat remove service-name
	
Si no lo puede borrar puedes debes hacerlo con el comando de Microsoft::

	sc delete newserv

3.- In the same directory, enter the following command::

	service.bat install tomcatv
	
where v is the Tomcat version (tomcat5, tomcat6 or tomcat7)

4.- In the same directory, enter the following command::

	update_service_centrify.bat tomcatv
	
where v is the Tomcat version.

5.- Open Start > Administrative Tools > Services and select the Tomcat service you just installed.

6.- Right click and select Properties.

7.- Click the Log On tab and select either Local System account or This account to specify a user account and password for the service to use.
Make your selection according to the following criteria::

	* For Kerberos authentication: The Windows service must run as a Local System account.
	* For applications that use FORM, BASIC, or NTLM authentication: The Windows service can run as either a Local System or you can specify a user account.
	* For applications that use Active Directory Federation Services: The Windows service can run as any user account.

8.- Click the General tab to select the Startup type.

Note that if you select Manual, you must start the Tomcat service explicitly every time you start the server.

9.- Start the service by clicking Start, then clicking OK.
Alternatively, you can start the service by opening a Command window, then entering net start service-name where service-name is the name of your new Tomcat service.



Please check the configuration by starting the Tomcat applet:

"C:\Program Files\Tomcat\bin\tomcat8w.exe" //ES//Tomcat8
