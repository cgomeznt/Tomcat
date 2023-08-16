How to Create Virtual Hosts in Tomcat
========================================


https://tecadmin.net/create-virtualhost-in-tomcat/

By RahulSeptember 9, 20222 Mins Read
Virtual Hosting provides us to host multiple domains (websites) on a single server. It is a concept of resource sharing among multiple hosting accounts. The best use of Virtual hosting is shared hosting servers, where multiple users can host multiple websites on a single server.

This blog post will help you to create virtual hosts in the Tomcat web server.

Setup Details
Here are the basic setup details used in this article:

A Linux host with IP address 192.168.1.100
Running the Tomcat server on the host on port 80
Deployed two sample applications, the first application is configured at http://192.168.1.100/myapp1
The second application is configured at http://192.168.1.100/myapp2
The task is to configure virtual hosts for both applications. The first virtual host uses the domain example.com and the second virtual host will use a subdomain demo.example.com.
ADVERTISEMENT



Create Virtual Hosts in Tomcat
Tomcat stores the virtual host configurations under the server.xml file. The default ‘localhost’ virtual host is configured in Tomcat servers. Now we have to add two more virtual hosts as below:

Edit the server.xml file in your favorite text editor. This file exists under the conf directory of tomcat installation.
Go to the end of the file and you will get the default virtual host configuration as shown below:
Creating Virtual Host in Tomcat
Default virtual host settings in Tomcat
Create the first virtual host for the domain example.com with the document root /opt/tomcat/webapps/myapp1. You can also add an Alias directive to set up www.example.com.
ADVERTISEMENT



<Host name="example.com"  appBase="webapps" unpackWARs="true" autoDeploy="true">
	<Alias>www.example.com</Alias>

	<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
           prefix="example_access_log" suffix=".txt"
           pattern="%h %l %u %t %r %s %b" />

	<Context path="" docBase="/opt/tomcat/webapps/myapp1"
		   debug="0" reloadable="true"/>
</Host>
1
2
3
4
5
6
7
8
9
10
<Host name="example.com"  appBase="webapps" unpackWARs="true" autoDeploy="true">
 <Alias>www.example.com</Alias>
 
 <Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
           prefix="example_access_log" suffix=".txt"
           pattern="%h %l %u %t %r %s %b" />
 
 <Context path="" docBase="/opt/tomcat/webapps/myapp1"
    debug="0" reloadable="true"/>
</Host>
The second virtual host will be created for a subdomain demo.example.com with /opt/tomcat/webapps/myapp2 document root.
<Host name="demo.example.com"  appBase="webapps" unpackWARs="true" autoDeploy="true">

	<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
           prefix="demo_example_access_log" suffix=".txt"
           pattern="%h %l %u %t %r %s %b" />

	<Context path="" docBase="/opt/tomcat/webapps/myapp2"
		   debug="0" reloadable="true"/>
</Host>
1
2
3
4
5
6
7
8
9
<Host name="demo.example.com"  appBase="webapps" unpackWARs="true" autoDeploy="true">
 
 <Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
           prefix="demo_example_access_log" suffix=".txt"
           pattern="%h %l %u %t %r %s %b" />
 
 <Context path="" docBase="/opt/tomcat/webapps/myapp2"
    debug="0" reloadable="true"/>
</Host>
ADVERTISEMENT
Ads

The configuration file will look like this:
How to Create Virtual Hosts in Tomcat
Virtual hosts configuration in Tomcat
Save changes and close the file.
Restart Tomcat Service
Once you made changes to the Tomcat configuration file, it’s required to restart the service to apply changes. If the Tomcat is running as a systemd service, use the following command to restart.

sudo systemctl restart tomcat 
If you are running tomcat with the shell scripts. use the following commands:

./bin/shutdown.sh 
./bin/startup.sh 
Conclusion
Virtual hosts allow us to configure multiple domains on a single server. This tutorial helped you to configure virtual hosts on Tomcat server.
