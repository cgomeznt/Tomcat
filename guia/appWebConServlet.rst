CREAR UNA APLICACION WEB CON JAVA SERVLETS DESDE CERO
=====================================================

Crea la siguiente estructura de carpetas:
+++++++++++++++++++++++++++++++++++++++++++

tomcat/webapps/hola     (el directorio raiz de nuestra web app)
tomcat/webapps/hola/WEB-INF     (es donde estan los archivos descriptores de tu app)
tomcat/webapps/hola/WEB-INF/classes     ( es donde estan las clases java de nuestra app)

Escribimos un pequeños archivo html para nuestra pagina principal de nuestra webapp llamado index.html y guardado en el directorio hola.::

	<html>
	<head><title>Hola WebApp</title></head>
	<body>
	<h1>Esta es mi primer web app con tomcat.</h1>
	</body>
	</html>

Puedes verlo en http://localhost:8088/hola/

Ahora vamos a crear nuestro primer Servlet Hola-Mundo! para esto vamos a abrir cualquier editor de texto y escribimos lo siguiente,::

	import java.io.*;
	import javax.servlet.*;
	import javax.servlet.http.*;

	public class HolaServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {

	response.setContentType("text/html");

	PrintWriter out = response.getWriter();

	try {
	out.println("<html>");
	out.println("<head><title>Hola Mundo!</title></head>");
	out.println("<body>");
	out.println("<h1>Hola amigo!</h1>");

	out.println("<p>Request URI: " + request.getRequestURI() + "</p>");
	out.println("<p>Protocol: " + request.getProtocol() + "</p>");
	out.println("<p>PathInfo: " + request.getPathInfo() + "</p>");
	out.println("<p>Remote Address: " + request.getRemoteAddr() + "</p>");
	out.println("<p>A Random Number: <strong>" + Math.random() + "</strong></p>");
	out.println("</body></html>");
	} finally {
	out.close();
	}
	}
	}

y lo guardamos como HolaServlet.java en tomcat/webapps/hola/WEB-INF/classes/

Necesitamos compilar este archivo java ya que queremos el .class resultado de la compilación así que compilamos este archivo de la siguiente forma::

	# javac -cp /opt/apache-tomcat-6.0.45/lib/servlet-api.jar /opt/apache-tomcat-6.0.45/webapps/hola/WEB-INF/classes/HolaServlet.java
javac -cp .;c:/tomcat/lib/servlet-api.jar HolaServlet.java


Cabe decir que compilamos con el jar servlet-api.jar que corresponde a la api de servlets de tomcat.

Después necesitamos que dirigir a nuestros usuarios a este servlet para lo cual nos crearemos un archivo de configuración llamado web.xml dentro de nuestro directorio WEB-INF de nuestro proyecto hola, este archivo realiza el request mapping asi,::


	<?xml version="1.0" encoding="ISO-8859-1"?>
	<web-app version="3.0"
	 xmlns="http://java.sun.com/xml/ns/javaee"
	 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	 xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd">
	 
	 <!-- To save as "hello\WEB-INF\web.xml" -->
	 
	 <servlet>
	 <servlet-name>HolaMundo</servlet-name>
	 <servlet-class>HolaServlet</servlet-class>
	 </servlet>
	 
	 <!-- Note: All <servlet> elements MUST be grouped together and
	 placed IN FRONT of the <servlet-mapping> elements -->
	 
	 <servlet-mapping>
	 <servlet-name>HolaMundo</servlet-name>
	 <url-pattern>/saludar</url-pattern>
	 </servlet-mapping>

	</web-app>


donde declaramos nuestro servlet llamado HolaMundo con una servlet class HolaServlet y un servlet mapping llamado tambien HolaMundo con la url /saludar. En resumen lo que hacemos aqui es decirle que cuando alguien pida la url hola/saludar/ entonces lo mandaremos al servlet HolaServlet.

Reinicia tu servidor tomcat e ingresa a la direccion http://localhost:8088/hola/saludar

Ahora vamos a agregar funcionalidad con base de datos, en especifico con mysql, para lo cual yo tengo una base de datos llamada agenda con una tabla llamada jugadores que contiene los campos: idjugador, nombre, partidos y puntos.

Después necesitamos crear un archivo html que sera donde este el formulario que solicita la información de cada jugador de la base de datos, este archivo html sera algo como esto,::


	<html>
	<head>
	<title>Informacion de Jugadores</title>
	</head>
	<body>
	<h2>Informacion de Jugadores de la liga</h2>
	<form method="get" action="http://localhost:8088/hola/pedirjugadores">
	<b>Elige un jugador:</b>
	<input type="checkbox" name="jugador" value="Denisse">Denisse
	<input type="checkbox" name="jugador" value="Reerew Ali">Reerew
	<input type="checkbox" name="jugador" value="Jonathan">Jonathan
	<input type="submit" value="Buscar">
	</form>
	</body>
	</html>

donde el parámetro action apunta a la dirección hola/pedirjugadores que sera un servlet, también notamos que se envía por método get.

Nos falta crear el servlet que llamaremos PedirJugadoresServlet.java y que guardaremos en tomcat/webapps/hola/WEB-INF/classes/ y que compilaremos de la misma forma que la vez anterior solo cambiando el nombre del archivo .java a compilar. Recuerda cambiar el usuario y contraseña de tu base de datos.

Una vez compilado tenemos que volver a editar el archivo web.xml para que sepa que hacer con las peticiones a hola/pedirjugadores, el archivo web.xml quedaria al final asi,::


	<?xml version="1.0" encoding="ISO-8859-1"?>
	<web-app version="3.0"
	xmlns="http://java.sun.com/xml/ns/javaee"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd">

	<servlet>
	<servlet-name>HolaMundo</servlet-name>
	<servlet-class>HolaServlet</servlet-class>
	</servlet>

	<servlet>
	<servlet-name>PedirJugadores</servlet-name>
	<servlet-class>PedirJugadoresServlet</servlet-class>
	</servlet>

	<!-- Note: All <servlet> elements MUST be grouped together and
	placed IN FRONT of the <servlet-mapping> elements -->

	<servlet-mapping>
	<servlet-name>HolaMundo</servlet-name>
	<url-pattern>/saludar</url-pattern>
	</servlet-mapping>

	<servlet-mapping>
	<servlet-name>PedirJugadores</servlet-name>
	<url-pattern>/pedirjugadores</url-pattern>
	</servlet-mapping>
	</web-app>


Ahora puedes ver en http://localhost:8088/hola/pedirjugadores.html que cuando un usuario busque un jugador y utilice el formulario recibirá la información de ese jugador directo de la base de datos gracias al mapeo que hicimos en web.xml.

TRABAJANDO CON LA ANOTACION @WEBSERVLET

Podemos evitar tener que modificar el archivo web.xml para mapear las urls simplemente agregando la anotacion @WebServlet antes de cada clase del servlet asi,::


	import java.io.*;
	import javax.servlet.*;
	import javax.servlet.http.*;

	@WebServlet("saludar2")
	public class HolaServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {

	response.setContentType("text/html");

	PrintWriter out = response.getWriter();

	try {
	out.println("<html>");
	out.println("<head><title>Hola Mundo!</title></head>");
	out.println("<body>");
	out.println("<h1>Hola amigo!</h1>");

	out.println("<p>Request URI: " + request.getRequestURI() + "</p>");
	out.println("<p>Protocol: " + request.getProtocol() + "</p>");
	out.println("<p>PathInfo: " + request.getPathInfo() + "</p>");
	out.println("<p>Remote Address: " + request.getRemoteAddr() + "</p>");
	out.println("<p>A Random Number: <strong>" + Math.random() + "</strong></p>");
	out.println("</body></html>");
	} finally {
	out.close();
	}
	}
	}

de esta forma podemos ir a http://localhost:8088/hola/saludar2 sin tener que editar el archivo web.xml

Eso fue todo el día de hoy, espero que hayas aprendido a crear una aplicacion web con Java Servlets y tomcat, esto fue solo una pequeña introducción para hacer que tu seas capaz de realizar tus propias aplicaciones web con java, recuerda suscribirte al blog o compartir en redes sociales.
