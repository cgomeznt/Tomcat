# yum install tomcat6 tomcat6-webapps tomcat6-admin-webapps

Creamos un .war para hacer el deploy.
The easiest way to run this application is simply to move the war file to your CATALINA_HOME/webapps directory. Tomcat will automatically expand and deploy the application for you. You can view it with the following URL (assuming that you're running tomcat on port 8080 as is the default): 
http://localhost:8080/sample

If you just want to browse the contents, you can unpack the war file with the jar command.
jar -xvf sample.war

Con solo descomprimir y con los permisos requeridos se puede colocar la carpeta en donde lo dice la variable ATALINA_HOME/webapps directory y solo llamariamos http://direccion-ip:8080/nombre-carpeta

falta poner el 
apache con ssl
o poner ssl solo en tomcat


