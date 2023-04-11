Activar el JMX remote
======================


Editar o crear el archivo **setenv.sh** en la ruta "$CATALINA_HOME/bin" y colocar los siguiente parametros::

	JRE_HOME=/opt/jdk1.8.0_152/jre
	CATALINA_PID="$CATALINA_BASE/tomcat.pid"

	# Para activar el JMX remote
	export CATALINA_OPTS="$CATALINA_OPTS \
	-Dcom.sun.management.jmxremote \
	-Dcom.sun.management.jmxremote.port=8050 \
	-Dcom.sun.management.jmxremote.rmi.port=8050 \
	-Dcom.sun.management.jmxremote.ssl=false \
	-Dcom.sun.management.jmxremote.authenticate=false \
	-Djava.rmi.server.hostname=10.132.0.232"

	export CATALINA_OPTS="$CATALINA_OPTS -Xms512m"
	export CATALINA_OPTS="$CATALINA_OPTS -Xmx512m"


Ahora para hacer las pruebas utilizamos el cliente **cmdline-jmxclient-0.10.3.jar** de la siguiente forma::

	$ $JAVA_HOME/bin/java -jar /usr/local/bin/cmdline-jmxclient-0.10.3.jar - localhost:8050 java.lang:type=Memory HeapMemoryUsage

	11/12/2018 11:33:46 -0400 org.archive.jmx.Client HeapMemoryUsage: 
	committed: 514850816
	init: 536870912
	max: 514850816
	used: 50560328

	
Esto se configuro en un Windows con el comando tomcat-GUIw.exe::

	-Dcom.sun.management.jmxremote
	-Dcom.sun.management.jmxremote.port=8050
	-Dcom.sun.management.jmxremote.rmi.port=8050
	-Dcom.sun.management.jmxremote.ssl=false
	-Dcom.sun.management.jmxremote.authenticate=false
	-Djava.rmi.server.hostname=10.134.3.154

Desde el CMD lo probamos::

	H:\APPS>java -jar cmdline-jmxclient-0.10.3.jar - 10.134.3.154:8050 java.lang:type=Memory HeapMemoryUsage
	09/12/2022 21:07:01 -0400 org.archive.jmx.Client HeapMemoryUsage:
	committed: 8232370176
	init: 8589934592
	max: 8232370176
	used: 618640360

Tambien desde el CMD::

	jconsole localhost:8050

Y con jvisualvm que viene con Java es excelente, porque vemos todo::

	jvisualvm
