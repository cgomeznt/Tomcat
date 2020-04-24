Connector HTTP
=============================


El elemento del conector HTTP representa un componente del conector que admite el protocolo HTTP / 1.1. 
Permite a Catalina funcionar como un servidor web independiente, además de su capacidad para ejecutar servlets y páginas JSP. 
Una instancia particular de este componente escucha las conexiones en un número de puerto TCP específico en el servidor. 
Uno o más de estos conectores se pueden configurar como parte de un único servicio, cada uno de los cuales se reenvía al motor asociado para realizar el procesamiento de solicitudes y crear la respuesta.

Si desea configurar el conector que se utiliza para las conexiones a servidores web utilizando el protocolo AJP (como el conector mod_jk 1.2.x para Apache 1.3), consulte la documentación del conector AJP.

Cada solicitud entrante requiere un hilo para la duración de esa solicitud. 
Si se reciben más solicitudes simultáneas de las que pueden manejar los hilos de procesamiento de solicitudes disponibles actualmente, 
se crearán hilos adicionales hasta el máximo configurado (el valor del atributo maxThreads). 
Si aún se reciben más solicitudes simultáneas, se apilan dentro del socket del servidor creado por el conector, hasta el máximo configurado (el valor del atributo acceptCount). 
Cualquier otra solicitud simultánea recibirá errores de "conexión rechazada", hasta que haya recursos disponibles para procesarlos.

Configuracion en el server.xml::

   <Connector address="192.168.1.20" port="443"
                maxThreads="600" minSpareThreads="100" maxSpareThreads="350"
                enableLookups="false" disableUploadTimeout="true"
                acceptCount="2000" debug="0"
                scheme="https" secure="true" clientAuth="false"
                sslProtocols="TLSv1,TLSv1.1,TLSv1.2"
                ciphers="TLS_RSA_WITH_AES_128_CBC_SHA, TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256,
                TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA, TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384,
                TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA, TLS_RSA_WITH_AES_128_CBC_SHA256,
                TLS_DHE_RSA_WITH_AES_128_CBC_SHA, TLS_DHE_DSS_WITH_AES_128_CBC_SHA,
                SSL_RSA_WITH_3DES_EDE_CBC_SHA, SSL_DHE_RSA_WITH_3DES_EDE_CBC_SHA,
                SSL_DHE_DSS_WITH_3DES_EDE_CBC_SHA"
                keystoreFile="/opt/tomcat/keystoreFile/keystore2020.jks"  keystorePass="changeme"
                maxKeepAliveRequests="100" socketBuffer="9000"
                maxSpareProcessors="200" maxProcessors="400"
                minProcessors="10">
     </Connector>
