Configurar Tomcat para que pueda ver los archivos de un directorio
===================================================================

Descargar e Instalar Apache Tomcat Version 7.0.90.::

	# wget http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.90/bin/apache-tomcat-7.0.90.tar.gz
	# # rpm -ivh /home/accrapidpago/jdk-8u181-linux-x64.rpm

Abrir los puertos del firewalld.::

	# firewall-cmd --permanent --add-port=8080/tcp && firewall-cmd --reload && firewall-cmd --list-all

Para que Tomcat pueda ver los archivos que estan dentro de un directorio y si ese directorio es un enlace simbolico se deben hacer dos cosas.

1. Permitir que Tomcat muestre los archivos de un directorio. Editar el "/conf/web.xml" cambiar esto.::

	/conf/web.xml<init-param>
	    <param-name>listings</param-name>
	    <param-value>false</param-value>
	</init-param>

Por esto.::

	<init-param>
	    <param-name>listings</param-name>
	    <param-value>true</param-value>
	</init-param>

2. Para que tomcat permita los symlink debemos editar el “context.xml” y agregar en <Contex> el siguiente parámetro “allowLinking="true">” quedando asi: <Contex allowLinking="true">. Este es el archivo ya modificado.::

	<Context allowLinking="true">

	    <!-- Default set of monitored resources -->
	    <WatchedResource>WEB-INF/web.xml</WatchedResource>

	    <!-- Uncomment this to disable session persistence across Tomcat restarts -->
	    <!--
	    <Manager pathname="" />
	    -->

	    <!-- Uncomment this to enable Comet connection tacking (provides events
		 on session expiration as well as webapp lifecycle) -->
	    <!--
	    <Valve className="org.apache.catalina.valves.CometConnectionManagerValve" />
	    -->

	</Context>



Iniciamos el Tomcat::

	# /opt/apache-tomcat-7.0.90/bin/catalina.sh start

