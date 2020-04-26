Run Tomcat non-root
====================

Si esta ejecutando Tomcat como non-root, no podra iniciar por el puerto 443, le arrojara este error::

	SubClassException Failed to initialize component [Connector[HTTP/1.1-443]]
			org.apache.catalina.LifecycleException: Protocol handler initialization failed
	{....}
	Caused by: java.net.SocketException: Permission denied
