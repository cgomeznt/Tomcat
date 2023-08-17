Crear Virtual Hosts en Tomcat
========================================

Virtual Hosting nos permite alojar múltiples dominios (sitios web) en un solo servidor. Es un concepto de intercambio de recursos entre varias cuentas de alojamiento. El mejor uso del alojamiento virtual son los servidores de alojamiento compartido, donde varios usuarios pueden alojar varios sitios web en un solo servidor.


Detalle de Instalación
--------------------------

IP address 192.168.1.100

Tomcat server 7 con el port 80

Deployed 2 apliucaciones, la primera aplicación es configurara en http://192.168.1.100/myapp1

la segunda aplicacion configurada en  http://192.168.1.100/myapp2

debe tener los registros de DNS example.com y demo.example.com

La tarea es configurar hosts virtuales para ambas aplicaciones. El primer host virtual usa el dominio ejemplo.com y el segundo host virtual usará un subdominio demo.ejemplo.com.

Crear Virtual Hosts en Tomcat
-------------------------------

Tomcat almacena las configuraciones de host virtual en el archivo server.xml. El host virtual predeterminado 'localhost' está configurado en los servidores Tomcat. Ahora tenemos que agregar dos hosts virtuales más como se muestra a continuación:

Edite el archivo server.xml en su editor de texto favorito. Este archivo existe en el directorio conf de la instalación de Tomcat.
Vaya al final del archivo y obtendrá la configuración de host virtual predeterminada como se muestra a continuación::

	<Host name="example.com"  appBase="webapps" unpackWARs="true" autoDeploy="true">
		<Alias>www.example.com</Alias>

		<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
			   prefix="example_access_log" suffix=".txt"
			   pattern="%h %l %u %t %r %s %b" />

		<Context path="" docBase="/opt/tomcat/webapps/myapp1"
			   debug="0" reloadable="true"/>
	</Host>


El segundo host virtual se creará para un subdominio demo.example.com con la raíz del documento /opt/tomcat/webapps/myapp2::

	<Host name="demo.example.com"  appBase="webapps" unpackWARs="true" autoDeploy="true">

		<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
			   prefix="demo_example_access_log" suffix=".txt"
			   pattern="%h %l %u %t %r %s %b" />

		<Context path="" docBase="/opt/tomcat/webapps/myapp2"
			   debug="0" reloadable="true"/>
	</Host>



Reiniciar Tomcat Service

