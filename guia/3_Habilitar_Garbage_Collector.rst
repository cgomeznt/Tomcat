Habilitar el Garbage Collector
===============================

El archivo setenv NO existe se debe crear dentro del directorio $CATALINA_HOME/bin::

Garbage Collector G1, ultima generaciòn para Java 64 bit::

	export CATALINA_OPTS="$CATALINA_OPTS \
	-Xloggc:$CATALINA_HOME/logs/gc.log \
	-Xms2176m -Xmx2176m \
	-XX:PermSize=512m \
	-XX:MaxPermSize=512m \
	-XX:+PrintGCTimeStamps \
	-XX:+PrintGCDetails \
	-XX:+PrintGCTimeStamps \
	-XX:+UseG1GC \
	-server"

Garbage Collector ParallelGC muy utilizado en Java de 32bit::

	export CATALINA_OPTS="$CATALINA_OPTS \
	-Xloggc:$CATALINA_HOME/logs/gc.log \
	-Xms2176m -Xmx2176m \
	-XX:PermSize=512m \
	-XX:MaxPermSize=512m \
	-XX:+PrintGCTimeStamps \
	-XX:+PrintGCDetails \
	-XX:+PrintGCTimeStamps \
	-XX:+UseParallelGC \
	-server"
	
	
El Garbage Collector tambien se puede agregar en el template del Systemctl::

	Environment="CATALINA_OPTS=-Xms512M -Xmx512M -server -XX:+UseParallelGC"
Esta seria una configuración del setenv.bat para Windows::

	set "JAVA_OPTS=%JAVA_OPTS% -Xms512m -Xmx1024m -XX:MaxPermSize=256m -XX:+PrintGCTimeStamps -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+UseG1GC -server"