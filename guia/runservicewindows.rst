Ejecutar Tomcat como un servicio de Windows
======================================

Cuando instala Tomcat en un servidor de Windows, tiene la opción de ejecutarlo como un servicio de Windows. Si eligió esa opción y está ejecutando Tomcat como un servidor de Windows, su servicio de Windows no incluye la ruta de clases de Java ni las opciones de Java que acaba de configurar.
En esta sección, instalará y actualizará el servicio de Windows de Tomcat para incluir las opciones y la ruta de clases de Java requeridas.
NotaPara la autenticación Kerberos, el servidor Tomcat debe ejecutarse como un servicio de Windows y el servicio debe configurarse para ejecutarse como una cuenta del sistema local.

1. Detener el servicio: Hay dos formas de detener un servicio:
------------------------------------------------------------------

* Abra Inicio > Herramientas administrativas > Servicios. Seleccione el servicio Tomcat, haga clic con el botón derecho y luego haga clic en Detener.

* Ingrese net stop service-name donde service-name es el nombre de su servicio Tomcat actual.

2.- Abra una ventana de comando, vaya al directorio bin de Tomcat
------------------------------------------------------------------

luego ingrese el comando::

 service.bat eliminar nombre-servicio

Si no lo puedes borrar
---------------------

debes hacerlo con el comando de Microsoft::

 sc eliminar servidor de noticias

3.- En el mismo directorio, ingresa el siguiente comando:

service.bat instalar tomcatv

donde v es la versión de Tomcat (tomcat5, tomcat6 o tomcat7)

4.- En el mismo directorio
--------------------------

ingresa el siguiente comando::

 update_service_centrify.bat tomcatv

donde **v** es la versión de Tomcat.

5.- Abre Inicio > Herramientas administrativas > Servicios y selecciona el servicio de Tomcat que acabas de instalar.
--------------------------------------------------

6.- Haz clic derecho y selecciona Propiedades.
---------------------------------------------

7.- Haga clic en la pestaña Iniciar sesión y seleccione Cuenta del sistema local o Esta cuenta para especificar una cuenta de usuario y una contraseña para el uso del servicio.
------------------------------------
Haga su selección de acuerdo con los siguientes criterios:

* Para la autenticación Kerberos: el servicio de Windows debe ejecutarse como una cuenta del sistema local.

* Para aplicaciones que utilizan autenticación FORM, BASIC o NTLM: el servicio de Windows puede ejecutarse como un sistema local o puede especificar una cuenta de usuario.

* Para aplicaciones que utilizan los servicios de federación de Active Directory: el servicio de Windows puede ejecutarse como cualquier cuenta de usuario.

8.- Haz clic en la pestaña General para seleccionar el tipo de Inicio.
-----------------------------------------

Tenga en cuenta que si selecciona Manual, debe iniciar el servicio Tomcat explícitamente cada vez que inicie el servidor.

9.- Inicie el servicio haciendo clic en Inicio, luego en Aceptar.
----------------------------------

Como alternativa, puede iniciar el servicio abriendo una ventana de comandos y luego ingresando net start service-name donde service-name es el nombre de su nuevo servicio Tomcat.
