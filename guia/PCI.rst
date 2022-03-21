Para pasar las evaluaciones de PCI
====================================

# How to disable HTTP TRACE/TRACK methods
https://knowledge.broadcom.com/external/article/160152/is-the-http-trace-method-enabled-in-the.html

Por defecto este valor viene en false en Tomcat.
allowTrace="false"

# How Apache Tomcat Default Files
Eliminar la carpeta examples que esta dentro de webapps

# Habilitar el HSHS en Tomcat.
https://docs.microfocus.com/SM/9.60/Hybrid/Content/security/concepts/support_of_http_strict_transport_security_protocol.htm

en el archivo web.xml

<filter>
    <filter-name>httpHeaderSecurity</filter-name>
  <filter-class>org.apache.catalina.filters.HttpHeaderSecurityFilter</filter-class>
    <init-param>
      <param-name>hstsMaxAgeSeconds</param-name>
      <param-value>31536000</param-value>
    </init-param>
    <async-supported>true</async-supported>
</filter>
<filter-mapping>
    <filter-name>httpHeaderSecurity</filter-name>
    <url-pattern>/*</url-pattern>
    <dispatcher>REQUEST</dispatcher>
</filter-mapping>

# Hacer el redireccionamiento (Este punto no es necesario, es mejor deshabilitar el puerto 8080 inseguro)
 en server.xml Buscamos este conector y nos aseguramos que no este comentado:

<Connector port=”80" protocol=”HTTP/1.1"
 connectionTimeout=”20000"
 redirectPort=”443" />

En el archivo web.xml Estas lineas no existen y la debemos agregar:

<security-constraint>
        <web-resource-collection>
        <web-resource-name>Entire Application</web-resource-name>
        <url-pattern>/*</url-pattern>
</web-resource-collection>
<user-data-constraint>
        <transport-guarantee>CONFIDENTIAL</transport-guarantee>
        </user-data-constraint>
</security-constraint>


# How enable only TLS 2 and Cipher
En el archivo server.xml

   <Connector address="10.134.3.35" port="443" protocol="org.apache.coyote.http11.Http11NioProtocol"
        maxThreads="150" SSLEnabled="true" >
        <UpgradeProtocol className="org.apache.coyote.http2.Http2Protocol" />
        <SSLHostConfig
            clientAuth="false"
            protocols="TLSv1.2"
            ciphers="TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA" >
			<Certificate certificateKeystoreFile="conf/certs/keystore.jks"
                certificateKeystorePassword="Venezuela21"
                certificateKeystoreType="JKS"
                type="RSA" />
        </SSLHostConfig>
    </Connector>

