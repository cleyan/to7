# Actualizar código de CodeCharge a php 7.x

Este pequeño script ajusta el código generado en codecharge para ser compatible con php 7.x (probado hasta 7.3)

### Ejemplo de uso:
Teniendo una carpeta llamada "proyecto" con el proyecto del código fuente de Codecharge

En el archivo de configuración se especifica:
* repositorio: El repositorio (GIT) donde se guardará el código modificado
* php: La ruta del binario de php que se quiere usar (en el caso que tengan mas de una versión de php en el sistema)
* composer: La ruta del binario de composer, es necesario si se quiere ejecutar composer con otra versión de php distinta a la predeterminada del sistema
* origen: el nombre de la carpeta por ejemplo ../proyecto (no sebe incluir el / al final)
* destino: el nombre de la carpeta de ,os archivos ya procesados por ejemplo ../proyecto7 (no sebe incluir el / al final)

Hay que renombrar to7.conf.template a to7.conf para que se lean los valores

Como lo uso Yo (puede ser de otro modo, incluso se puede colcoar junto con el código):
Tengo en el mismo nivel las carpetas
- proyecto : Carpeta con el proyecto codecherge 
- proyecto7 : Carpeta con el código generado
- to7 : Carpeta con el código del script

Entonces ejecuto via linea de comandos desde la carpeta to7
(Todo esto válido para Linux o macOS, para Windows habría que hacer un .bat que reemplace al .sh)

Ejecución:
Ajustar código para que sea compatible con php 7.3 
```./to7.sh [ -c | --commit] [ -i | --install ]```

Ejemplos:
Ajustar código para que sea compatible con php 7.3 y ejecutar composer para instalar paquetes y hacer dump-autoload
```./to7.sh --install``` o ```./to7.sh ../proyecto -i```

Ajustar código para que sea compatible con php 7.3 y ejecutar composer para instalar paquetes y subir el código actaulizaco al reporsitorio
```./to7.sh --install --commit```

Ajustar código para que sea compatible con php 7.3 y subir el código actaulizaco al reporsitorio
```./to7.sh --commit```


## Advertencias

- No hay garantía de éxito así que úselo con precaución
- Este script está basado en un script php publicado en el foro de usuarios de - codecharge de facebook
- Seguramente hay muchas mejoras que hacer, yo sólo hice las que fueron siendo necesarias según mis necesidades
 



