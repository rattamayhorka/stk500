#!/usr/bin/env bash
set -e

rm -rf ./temp
mkdir ./temp
echo "generando carpeta temporal"
sleep 2

touch ./temp/main.c
echo "generando codigo fuente"
sleep 2

echo "#include <avr/io.h>" >> ./temp/main.c
echo "#define F_CPU 4000000UL" >> ./temp/main.c
echo "#include <util/delay.h>" >> ./temp/main.c
echo "#include <avr/interrupt.h>" >> ./temp/main.c
echo "int main(void){ DDRB = 0xFF; while(1) {PORTB = 0x00; _delay_ms(200); PORTB= 0xFF; _delay_ms(200);}}" >> ./temp/main.c

avr-gcc -v -mmcu=atmega32 -Os ./temp/main.c -o ./temp/main.o
echo "generando archivo object"
sleep 2

avr-objcopy -v -j .text -j .data -O ihex  ./temp/main.o ./temp/main.hex
echo "generando ejecutable HEX"
sleep 2

avrdude -c stk500 -p m32 -P /dev/ttyUSB0 -v -U flash:w:./temp/main.hex
echo "programando microcontrolador"
sleep 2

rm -r ./temp
echo "borrando archivos temporales"
sleep 2

#for the fuses external crystal
#avrdude -c stk500 -p m32 -P /dev/ttyUSB0 -v -U lfuse:w:0xDD:m -U hfuse:w:0xD9:m -U lock:w:0xFF:m
#avrdude -c stk500 -p m32 -P /dev/ttyUSB0 -v -U lfuse:w:0xff:m -U hfuse:w:0x99:m

