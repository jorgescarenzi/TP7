# TP7
Jenkins Pipeline for PHP web.

contenido:
- PHP data : Archivos de PHP necesarios para la aplicacion web.Estos van a ser agregados de acuerdo al dockerfile.
- Dockerfile : especificaciones para crear la imagen de la app web utilizando imagen PHP como base e instalando prerequisitos.
- Checkport : script para validar si el puerto (80 en este caso) se encuentra en uso.
- checkrunning: script para validar si no hay otra instancia con el mismo nombre corriendo.
- Jenkinsfile : Archivo de Jenkins para la ejecucion de stages.

  nota:Si bien  hay un stage de autenticación hacia github y dockerhub ambos repositorios son publicos.
