SSL
====

Todo esta aqui https://tomcat.apache.org/tomcat-6.0-doc/ssl-howto.html
configurar Tomcat para acceder a las aplicaciones web empleando HTTP sobre SSL.

Generamos un certificado autofirmado y cambiar la configuración server.xml para activar un conector SSL.


Creando el almacén de claves y un certificado autofirmado.::

	# keytool –genkey –alias tomcat –keyalg RSA

La clave por defecto de Tomcat es “changeit” y es la que introduciremos. Si queremos usar cualquier otra clave, lo único que tenemos que hacer es añadir al Connector el parámetro keystorePass especificando la clave a usar.

Pide nuestro nombre, el nombre de nuestra unidad de organización, el nombre de nuestra organización, la ciudad o localidad, el estado o provincia, y el código del pais. Nos pregunta si los datos introducidos son correctos.

Pide la contraseña clave para <tomcat>. Visualmente permite una distinta, pero siempre debemos poner la misma contraseña. (Nos da la opción de pulsar INTRO para este efecto). Informacion de http://tomcat.apache.org/tomcat-6.0-doc/ssl-howto.html. Tomcat lanzaría un java.io.IOException: Cannot recover key si no usaramos la misma clave

Se crea un archivo .keystore en el perfil del usuario que se ejecuto, en este caso en /root/.keystore

Ahora en /opt/apache-tomcat-7.0.70/conf/server.xml descomentar la parte del Connector SSL y agregar dos lineas, una de la ruta del .keystore y la otra de la clave.::


	<Connector port="8443" protocol="org.apache.coyote.http11.Http11Protocol"
		           maxThreads="150" SSLEnabled="true" scheme="https" secure="true"
		           clientAuth="false" sslProtocol="TLS"
		            keystorePass="Venezuela21"
		            keystoreFile="/root/.keystore" />


Podemos utilizart otros puertos, verificamos, https://localhost:8443

.. figure:: ../images/img09.png






