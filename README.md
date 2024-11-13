# CODIGO ATLAS

## Introducción 
La automatización de procesos es la mayor arma que existe en el manejo de datos, desde que su creador sabe que dará los resultados esperados hasta el punto de ahorrar días de trabajo y convertirlos en segundos.

De acuerdo con los lineamientos técnicos y operativos para la actualización de los atlas de riesgos de las alcaldías de la Ciudad de México, dependiendo de si las capas de información geográfica son de tipo punto, líneas o polígonos, estas llevan entre 15 a 19 campos. De manera normal, agregar cada campo con las características solicitadas, por parte de una persona que ya sabe del tema, una capa puede tomar al rededor de 5 minutos. El Código Atlas fue diseñado con el propósito de disminuir a segundos un trabajo que, dependiendo de la cantidad de capas, podría tomar varias horas o días.

## Requerimientos:

1. Instalar QGis en la computadora (al mismo tiempo se instala GDAL)
2. Agregar la carpeta de bin de QGis al PATH de la computadora

## Instrucciones de uso

1. Descarga el codigo_atlas.bat en tu computadora.
2. Una vez que tengas todas las capas a las que necesitas agregar los campos, revisa que no tengan columnas cuyo nombre se vaya a repetir con los que se van a agregar, porque sucederá que si tienes en la capa original LONGITUD, el código agregará LONGITUD_1.
3. Las capas pueden estar todas en la misma carpeta o en subcarpetas. Solo verifica que el codigo_atlas.bat esté en la carpeta principal.
4. Ejecuta el archivo codigo_atlas.bat dando doble click sobre el archivo, se abrirá el CMD.
5. Apareceran unas instrucciones, escribe SI para continuar o NO para cancelar.
6. Cierra el CDM y revisa tus capas en un SIG como ArcGis o QGis.

## Problemas conocidos

- Si tu archivo es tipo MultiLineStringZM, el código no agregará los campos a esa capa, a todas las demás sí.
