Run Tomcat non-root
====================

Si esta ejecutando Tomcat como non-root, no podra iniciar por el puerto 443, le arrojara este error::

	SubClassException Failed to initialize component [Connector[HTTP/1.1-443]]
			org.apache.catalina.LifecycleException: Protocol handler initialization failed
	{....}
	Caused by: java.net.SocketException: Permission denied


	
Instalamos el paquete authbind. Una vez que se haya instalado authbind, ejecute lo siguiente según los puertos en los que desee que Tomcat escuche::

	sudo touch /etc/authbind/byport/80
	sudo chmod 500 /etc/authbind/byport/80
	sudo chown tomcat /etc/authbind/byport/80
	sudo touch /etc/authbind/byport/443
	sudo chmod 500 /etc/authbind/byport/443
	sudo chown tomcat /etc/authbind/byport/443
	

En el template de Systemctl para Tomcat utilizamos::

	ExecStart=/usr/local/bin/authbind --deep /opt/tomcat/bin/startup.sh
	ExecStop=/usr/local/bin/authbind --deep /opt/tomcat/bin/shutdown.sh

Link de original de Gitlab:

	https://gitlab.com/jcsm72/bd-knowledg/-/tree/master/Apache-Tomcat
	
Link original:

	https://blog.webhosting.net/how-to-get-tomcat-running-on-centos-7-2-using-privileged-ports-1024/
	
Link para la descarga:

	https://github.com/tootedom/authbind-centos-rpm/tree/master/authbind/RPMS/x86_64