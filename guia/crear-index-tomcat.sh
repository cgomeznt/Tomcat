#!/bin/bash
COLOR=1

echo -e "<html>
<head>
<title>RapidPago / LOGs /</title>
<STYLE>
<!--H1 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:22px;} H2 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:16px;} H3 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:14px;} BODY {font-family:Tahoma,Arial,sans-serif;color:black;background-color:white;} B {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;} P {font-family:Tahoma,Arial,sans-serif;background:white;color:black;font-size:12px;}A {color : black;}A.name {color : black;}HR {color : #525D76;}--></STYLE> </head>
<body>
<img src=\"Dominio.png\" alt=\"width=\" height=\"60\" border=\"0\" />
<h1>APPS / Carlos Gomez ---> </h1>
<HR size=\"1\" noshade=\"noshade\">" > /opt/apache-tomcat-9.0.12/webapps/apps/index.html

echo -e "<table width=\"90%\" cellspacing=\"0\" cellpadding=\"5\" align=\"center\">
<tr>
<td>
<!-- table width=\"15%\" cellspacing=\"0\" cellpadding=\"5\" align=\"center\"-->
<table cellspacing="0" cellpadding="5" align="center">
<tr>
<td align=\"left\"><font size=\"+1\"><strong>Servidor :</strong></font></td>
</tr>" >> /opt/apache-tomcat-9.0.12/webapps/apps/index.html

for i in `ls /home/cgomez/Documentos/app/` 
do 
	if [ $COLOR -eq 1 ] ; then
		echo -e " <tr bgcolor=\"#eeeeee\">" >> /opt/apache-tomcat-9.0.12/webapps/apps/index.html
		COLOR=0
	else	
		COLOR=1
	fi
                echo -e "<td align=\"left\">&nbsp;&nbsp;" >> /opt/apache-tomcat-9.0.12/webapps/apps/index.html
		echo -e "<a href=\"$i\"><tt>$i/</tt></a></td>" >> /opt/apache-tomcat-9.0.12/webapps/apps/index.html
                echo -e "</tr>" >> /opt/apache-tomcat-9.0.12/webapps/apps/index.html
done
		echo -e "</table>" >> /opt/apache-tomcat-9.0.12/webapps/apps/index.html
echo -e "	    </td>
</tr>
</table>
</html>" >> /opt/apache-tomcat-9.0.12/webapps/apps/index.html
