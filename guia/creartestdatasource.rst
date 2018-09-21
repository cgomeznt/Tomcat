Configurar y probar Datasource 
===============================

Lo primero es leer la documento oficial de Tomcat.

https://tomcat.apache.org/tomcat-8.0-doc/jndi-datasource-examples-howto.html

Introducción
++++++++++++++

La configuración de JNDI Datasource está cubierta extensamente en JNDI-Resources-HOWTO. Sin embargo, los comentarios de usuarios de tomcat han demostrado que las especificaciones para configuraciones individuales pueden ser bastante complicadas.

Aquí hay algunas configuraciones de ejemplo que se han publicado en tomcat-user para bases de datos populares y algunos consejos generales para el uso de db.

Debe tener en cuenta que estas notas se derivan de la configuración y / o comentarios publicados en el usuario YMMV de tomcat.

Tenga en cuenta que la configuración de recursos JNDI cambió algo entre Tomcat 7.x y Tomcat 8.x ya que están utilizando diferentes versiones de la biblioteca Apache Commons DBCP. Lo más probable es que necesite modificar las configuraciones de recursos JNDI anteriores para que coincidan con la sintaxis en el ejemplo siguiente para que funcionen en Tomcat 8. Consulte la Guía de migración de Tomcat para obtener más información.

Además, tenga en cuenta que la configuración de JNDI DataSource en general, y este tutorial en particular, asume que ha leído y entendido las referencias de configuración Contexto y Host, incluida la sección sobre Implementación automática de aplicaciones en la última referencia.


DriverManager, el mecanismo del proveedor de servicio y pérdidas de memoria
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

java.sql.DriverManager es compatible con el mecanismo del proveedor de servicios. Esta característica es que todos los controladores JDBC disponibles que se anuncian al proporcionar un archivo META-INF / services / java.sql.Driver se descubren, cargan y registran automáticamente, lo que evita la necesidad de cargar el controlador de la base de datos explícitamente antes de crear un archivo. Conexión JDBC. Sin embargo, la implementación está fundamentalmente rota en todas las versiones de Java para un entorno de contenedor de servlets. El problema es que java.sql.DriverManager buscará los controladores solo una vez.

El módulo de escucha de prevención de fuga de memoria JRE que se incluye con Apache Tomcat resuelve esto activando el análisis de los controladores durante el arranque de Tomcat. Esto está habilitado por defecto. Significa que solo las bibliotecas visibles para el oyente como las de $ CATALINA_BASE / lib se analizarán en busca de controladores de base de datos. Si está considerando desactivar esta función, tenga en cuenta que la primera aplicación web que usa JDBC activará el escaneo, lo que ocasionará fallas cuando se vuelva a cargar esta aplicación web y para otras aplicaciones web que dependan de esta característica.

Por lo tanto, las aplicaciones web que tienen controladores de base de datos en su directorio WEB-INF / lib no pueden confiar en el mecanismo del proveedor de servicios y deben registrar los controladores de forma explícita.

La lista de controladores en java.sql.DriverManager también es una fuente conocida de pérdidas de memoria. Todos los controladores registrados por una aplicación web deben cancelarse cuando se detiene la aplicación web. Tomcat intentará descubrir y eliminar automáticamente cualquier controlador JDBC cargado por el cargador de clases de la aplicación web cuando se detenga la aplicación web. Sin embargo, se espera que las aplicaciones lo hagan por sí mismas a través de ServletContextListener.

Database Connection Pool (DBCP 2) Configurations
+++++++++++++++++++++++++++++++++++++++++++++++++


La implementación del grupo de conexiones de la base de datos predeterminada en Apache Tomcat se basa en las bibliotecas del proyecto Apache Commons. Se usan las siguientes bibliotecas:

DBCP Comunes
Pool de los comunes
Estas bibliotecas se encuentran en un único JAR en $ CATALINA_HOME / lib / tomcat-dbcp.jar. Sin embargo, solo se han incluido las clases necesarias para la agrupación de conexiones, y los paquetes se han renombrado para evitar interferir con las aplicaciones.

DBCP 2.0 proporciona soporte para JDBC 4.1.


Preventing database connection pool leaks
+++++++++++++++++++++++++++++++++++++++++++

Un grupo de conexión de base de datos crea y administra un conjunto de conexiones a una base de datos. Reciclar y reutilizar conexiones ya existentes en una base de datos es más eficiente que abrir una nueva conexión.

Hay un problema con la agrupación de conexiones. Una aplicación web debe cerrar explícitamente ResultSet, Statement y Connection's. La falla de una aplicación web para cerrar estos recursos puede hacer que nunca vuelvan a estar disponibles para su reutilización, una "fuga" en el grupo de conexiones de la base de datos. Esto puede ocasionar que las conexiones de la base de datos de la aplicación web fallen si no hay más conexiones disponibles.

Hay una solución a este problema. Apache Commons DBCP se puede configurar para rastrear y recuperar estas conexiones de bases de datos abandonadas. No solo puede recuperarlos, sino también generar un seguimiento de pila para el código que abrió estos recursos y nunca los cerró.

Para configurar un DBCP DataSource para que las conexiones abandonadas de la base de datos se eliminen y se reciclen, agregue uno o ambos de los siguientes atributos a la configuración del recurso para su DBCP DataSource::

	removeAbandonedOnBorrow=true
	removeAbandonedOnMaintenance=true


El valor predeterminado para estos dos atributos es falso. Tenga en cuenta que removeAbandonedOnMaintenance no tiene ningún efecto a menos que el mantenimiento del grupo esté habilitado estableciendo timeBetweenEvictionRunsMillis en un valor positivo. Consulte la documentación de DBCP para obtener la documentación completa sobre estos atributos.

Use el atributo removeAbandonedTimeout para establecer el número de segundos que una conexión de base de datos ha estado inactiva antes de que se considere abandonada.::

	removeAbandonedTimeout="60"


El tiempo de espera predeterminado para eliminar conexiones abandonadas es de 300 segundos.

El atributo logAbandoned se puede establecer en verdadero si desea que DBCP registre un seguimiento de la pila del código que abandonó los recursos de conexión de la base de datos.::

	logAbandoned="true"

Por defecto es false.


MySQL DBCP Example
+++++++++++++++++++

* *Introduccion*






