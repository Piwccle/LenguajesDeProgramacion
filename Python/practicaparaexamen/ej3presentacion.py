"""Desarrollar un programa en Python que reciba como argumento la
ruta de un fichero y muestre por pantalla sus últimas 10 líneas. Opcionalmente
el programa podrá recibir un segundo parámetro que indique el número de
líneas que se desean mostrar desde el final del fichero. A continuación, se
muestra dos ejemplos de llamadas que el programa deberá soportar:
○ python tail.py --file=/etc/hosts
○ python tail.py --file=/etc/hosts --lines=25"""

import argparse

parser = argparse.ArgumentParser()

parser.add_argument("--file", type=str, required=True,
                    help="File from where you want to read lines")

parser.add_argument("--lines", type=int, required=False, default=10,
                    help="Number of lines you want to read")

args = parser.parse_args()

path = args.file
lines = args.lines

with open(path) as file:
    file_lines = file.readlines()

reversed_lines = file_lines[::-1]
print("\n".join(reversed_lines[:lines]))
