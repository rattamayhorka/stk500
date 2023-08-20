# stk500
para poder tener acceso al puerto ttyUSB0
usa el comando: 
sudo chmod 777 /dev/ttyUSB0
para programar un microcontrolador debes seguir estos pasos:
- entra a la carpeta del proyecto
- verifica en el archivo makefile que tenga el cristal correcto con F_CPU
- los archivos del codigo fuente a compilar (ejemplo main.c) que se
  encuentren en la misma carpeta.
- las librerías a agregar (ejemplo lcd.h)
- modifica tu codigo fuente.

#compilar: 
corre el codigo 
make

#programar el microcontrolador: 

make program

#limpiar archivos innecesarios: 
make clean
