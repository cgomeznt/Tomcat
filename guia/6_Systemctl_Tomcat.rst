SystemCtl para Tomcat
=========================

Vamos instalar tomcat en /opt y luego creamos un link simbolico hacia tomcat.

	ln -s /opt/apache-tomcat-9.0.34 /opt/tomcat

Creamos un usuario llamado tomcat sin privilegios.:.

	adduser tomcat

Cambiamos el propietario de /opt/tomcat al usuario tomcat

	chown -R tomcat. /opt/tomcat


Creamos la plantilla de servicio en  /etc/systemd/system/tomcat.service::

	[Unit]
	Description=Tomcat - instance %i
	After=syslog.target network.target

	[Service]
	Type=forking

	User=tomcat
	Group=tomcat

	WorkingDirectory=/opt/tomcat

	Environment="JAVA_HOME=/opt/jdk1.8.0_251"
	Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom"

	Environment="CATALINA_PID=/opt/tomcat/tomcat.pid"
	Environment="CATALINA_BASE=/opt/tomcat"
	Environment="CATALINA_HOME=/opt/tomcat/"
	Environment="CATALINA_OPTS=-Xms512M -Xmx512M -server -XX:+UseParallelGC"

	ExecStart=/opt/tomcat/bin/startup.sh
	ExecStop=/opt/tomcat/bin/shutdown.sh

	RestartSec=10
	Restart=always

	[Install]
	WantedBy=multi-user.target
	
Recargamos el demonios SystemCtl, habilitamos e iniciamos el Tomcat ::

	systemctl daemon-reload
	systemctl enable tomcat.service
	systemctl start tomcat.service
