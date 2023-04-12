Desplegar WAR EAR etc de forma manual
========================================

En $CATALINA_HOME/webapps/ es donde debemos realizar la copia del EAR, WAR o JAR que se quiera desplegar

Vemos el contenido de dicho directorio::

	# ls /opt/tomcat/webapps/
	docs  examples  host-manager  manager  ROOT
	
Utilizamos el war de ejemplo que tenemos y simplemente lo copiamos en la ruta::

	# cp /root/sample.war /opt/tomcat/webapps/
	
Consultamos nuevamente el contenido y vemos nuestro archivo war, aun no se ha desplegado dependiendo del tamaño del despliegue puede remorar::

	# ls /opt/tomcat/webapps/
	docs  examples  host-manager  manager  ROOT  sample.war
	
En el log de $CATALINA_HOME/logs/catalina.out debemos ver lo siguiente::


	24-Apr-2020 23:24:54.857 INFO [Catalina-utility-1] org.apache.catalina.startup.HostConfig.deployWAR Deploying web application archive [/opt/apache-tomcat-9.0.34/webapps/sample.war]
	24-Apr-2020 23:24:55.100 INFO [Catalina-utility-1] org.apache.catalina.startup.HostConfig.deployWAR Deployment of web application archive [/opt/apache-tomcat-9.0.34/webapps/sample.war] has finished in [243] ms

Volvemos a consultar el directorio y ya vemos que esta desplegado::

	# ls /opt/tomcat/webapps/
	docs  examples  host-manager  manager  ROOT  sample  sample.war
	
Consultamos la URL https://192.168.1.20:8443/sample y se debe ver nustra aplicacion


Undeploy un WAR EAR etc de forma manual
========================================

En $CATALINA_HOME/webapps/ en donde esta desplegado el war.

Vemos el contenido de dicho directorio::

	# ls /opt/tomcat/webapps/
	docs  examples  host-manager  manager  ROOT  sample sample.war
	
Eliminamos el WAR y el Tomcat realiza el undeploy::

	$ rm sample.war
	$ ls
	docs  examples  host-manager  manager  ROOT  sample
	
En el LOG veremos un mensaje como el siguiente::

	12-Apr-2023 13:51:01.553 INFO [Catalina-utility-1] org.apache.catalina.startup.HostConfig.undeploy Undeploying context [/sample]


