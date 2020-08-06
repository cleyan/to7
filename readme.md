# Actualizar código de CodeCharge a php 7.x

Este pequeño script ajusta el código generado en codecharge para ser compatible con php 7.x (probado hasta 7.3)

### Ejemplo de uso:
Teniendo una carpeta llamada "proyecto" con el proyecto del código fuente de Codecharge

En el archivo de configuración se especifica el repositorio donde se guardará el código modificado y la ruta del binario de php que se quiere usar (en el caso que tengan mas de una versión de php en el sistema)

Hay que renombrar to7.conf.template a to7.conf para que se lean los valores

Como lo uso Yo (puede ser de otro modo, incluso se puede colcoar junto con el código):
Tengo en el mismo nivel las carpetas
- proyecto : Carpeta con el proyecto codecherge 
- proyecto7 : Carpeta con el código generado
- to7 : Carpeta con el código del script

Entonces ejecuto via linea de comandos desde la carpeta to7
(Todo esto válido para Linux o macOS, para Windows habría que hacer un .bat que reemplace al .sh)

Ejecución:
1) Ajustar código para que sea compatible con php 7.3 
```./to7.sh ../proyecto```

2) Ajustar código para que sea compatible con php 7.3 y ejecutar composer para instalar paquetes
```./to7.sh ../proyecto install```

2) Ajustar código para que sea compatible con php 7.3 y ejecutar composer para instalar paquetes y subir el código actaulizaco al reporsitorio
```./to7.sh ../proyecto install commit```

## Advertencias

- No hay garantía de éxito así que úselo con precaución
- Este script está basado en un script php publicado en el foro de usuarios de - codecharge de facebook
- Seguramente hay muchas mejoras que hacer, yo sólo hice las que fueron siendo necesarias según mis necesidades
 



