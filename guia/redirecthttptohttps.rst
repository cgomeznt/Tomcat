Redirect HTTP request to HTTPS in Apache Tomcat
================================================


Archivos que se requieren modificar

* **server.xml**

* **web.xml**

server.xml
+++++++++++++++

Buscamos este conector y nos aseguramos que no este comentado::

	<Connector port=”80" protocol=”HTTP/1.1"
	 connectionTimeout=”20000"
	 redirectPort=”443" />

web.xml
+++++++++++++

Estas lineas no existen y la debemos agregar::

	<security-constraint>
		<web-resource-collection>
		<web-resource-name>Entire Application</web-resource-name>
		<url-pattern>/*</url-pattern>
	</web-resource-collection>
	<user-data-constraint>
		<transport-guarantee>CONFIDENTIAL</transport-guarantee>
		</user-data-constraint>
	</security-constraint>

