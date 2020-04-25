Habilitar el manager-gui y admin-gui
=========================

Configuramos el Tomcat Web Management Interface Para utilizar el manager webapp instalado en pasos previos, necesitamos agregar un login al Tomcat server. para eso editamos el archivo tomcat-users.xml.:

	<?xml version="1.0" encoding="UTF-8"?>
	<tomcat-users xmlns="http://tomcat.apache.org/xml"
				  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				  xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
				  version="1.0">
	<role rolename="manager-gui"/>
	<role rolename="admin-gui"/>
	<user username="tomcat" password="s3cret" roles="manager-gui,admin-gui"/>
	</tomcat-users>


Manager-gui esta accesible unicamente por localhost, para permitir el acceso remoto, editamos el archivo y comentamos la parte de la configuracion que especifica que solo sea de local host
Editamos el archivo::

	$CATALINA_HOME/webapps/manager/META-INF/context.xml::

y comentamos las lineas, queda algo como esto::


	<Context antiResourceLocking="false" privileged="true" >
	 <!-- <Valve className="org.apache.catalina.valves.RemoteAddrValve"
			 allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />-->
	  <Manager sessionAttributeValueClassNameFilter="java\.lang\.(?:Boolean|Integer|Long|Number|String)|org\.apache\.catalina\.filters\.CsrfPreventionFilter\$LruCache(?:\$1)?|java\.util\.(?:Linked)?HashMap"/>
	</Context>


Reiniciamos el Tomcat::

	# systemctl restart tomcat
	
	
Probamos el tomcat en http://localhost:8080/manager/html

.. figure:: ../images/img07.png

El Web Application Manager es usuado para manejar sus Java applications. Se puede Start, Stop, Reload, Deploy, and Undeploy desde aqui. Se pueden correr diagnosticos de la app (ej. find memory leaks). Lastly, information del server si esta disponible.

Ahora vamos a ver Host Manager, por medio de este link. 
http://localhost:8080/host-manager/html

.. figure:: ../images/img08.png