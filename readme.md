# Actualizar código de CodeCharge a php 7.x

Este pequeño script ajusta el código generado en codecharge para ser compatible con php 7.x (probado hasta 7.4)

### Ejemplo de uso:
Teniendo una carpeta llamada "proyecto" con el proyecto del código fuente de Codecharge

En el archivo de configuración se especifica:
* repositorio: El repositorio (GIT) donde se guardará el código *modificado*
* php: La ruta del binario de php que se quiere usar (útil en el caso que tengan mas de una versión de php en el sistema) 
* composer: La ruta del binario de composer, es necesario si se quiere ejecutar composer con otra versión de php distinta a la predeterminada del sistema
* origen: el nombre de la carpeta por ejemplo ../proyecto (no sebe incluir el / al final)
* destino: el nombre de la carpeta de l

La estructura de cómo se colocan las carpetas sería:
```
/projects
  +-projectccs5
  +-projectccs5to7
  +-to7
```
- projectccs5 : Carpeta con el proyecto CodeCharge Studio 5
- projectccs5to7 : Carpeta con el código generado
- to7 : Carpeta con el código del script

Entonces ejecuto via linea de comandos desde la carpeta to7
(Todo esto válido para Linux o macOS, para Windows habría que hacer un .bat que reemplace al .sh)

Ejecución:
Ajustar código para que sea compatible con php 7.4
```./to7.sh [ -c | --commit] [ -i | --install ] [-h | --help]```


Ejemplos:

* Ajustar código para que sea compatible con php 7.4 y ejecutar composer para instalar paquetes y hacer dump-autoload
```./to7.sh --install``` o ```./to7.sh ../proyecto -i```


* Ajustar código para que sea compatible con php 7.4 y ejecutar composer para instalar paquetes y subir el código actualizado al repositorio 
```./to7.sh --install --commit```


* Ajustar código para que sea compatible con php 7.4 y subir el código actaulizaco al reporsitorio
```./to7.sh --commit```


* Pedir ayuda de las opciones disponibles
```./to7.sh --help```



## Advertencias

- El repositorio donde se publican los cambios es el repositorio de código ya corregido para ser compatible con php 7.4 (para subir al servidor donde se despliega el software) NO es el repositorio del código fuente para editar con CodeCharge Studio.
- No hay garantía de éxito así que úselo con precaución y haga pruebas antes de usarlo definitivamente
- Este script está basado en un script (conv_fnames.php) publicado en el foro de usuarios de CodeCharge de facebook, no se quién lo creó originalmente pero todo mi reconocimiento para el/ella
- Este script no tiene ninguna relación con YesSoftware la empresa que está (o estaba) destrás de la creación de ChodeCharge Studio
- Sólo se ha probado con CodeCharge Studio 5.x
- Seguramente hay muchas mejoras que hacer, yo sólo hice las que fueron necesarias según surgían mis necesidades
 

