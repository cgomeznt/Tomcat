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
	-Djava.rmi.server.hostname=192.168.1.20"

	export CATALINA_OPTS="$CATALINA_OPTS -Xms512m"
	export CATALINA_OPTS="$CATALINA_OPTS -Xmx512m"


Ahora para hacer las pruebas utilizamos el cliente **cmdline-jmxclient-0.10.3.jar** de la siguiente forma::

	$ $JAVA_HOME/bin/java -jar /usr/local/bin/cmdline-jmxclient-0.10.3.jar - localhost:8050 java.lang:type=Memory HeapMemoryUsage

	11/12/2018 11:33:46 -0400 org.archive.jmx.Client HeapMemoryUsage: 
	committed: 514850816
	init: 536870912
	max: 514850816
	used: 50560328

