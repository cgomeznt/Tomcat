Cambiar la configuración de la memoria JVM en Windows
========================================================

Tomcat generalmente se inicia como un servicio en Windows e incluye un cuadro de diálogo para configurar la JVM. La asignación de memoria total máxima se configura en su propio cuadro de texto, pero otras configuraciones se configuran en el cuadro de opciones generales de JVM utilizando la sintaxis de parámetros de la línea de comandos de Java.

Si cambió el nombre del servicio de Windows, debe usar el método 2.

Método 1:
+++++++++++

** Abra el Explorador de Windows.
** Vaya al directorio <CATALINA_HOME>/bin .
** Busque y ejecute el archivo tomcat#w.exe (donde # es el número de versión de Tomcat). Ejecute esto como administrador haciendo clic con el botón derecho en el archivo .exe y seleccionando Ejecutar como administrador .
** El comando abrirá una ventana del programa.
** Si esto produce un error que dice "El servicio especificado no existe en el servidor", vaya al Método 2 .
** Vaya a la pestaña Java en la nueva ventana.
** En el cuadro Opciones de Java , desplácese hasta la parte inferior de las propiedades y establezca la siguiente propiedad:
