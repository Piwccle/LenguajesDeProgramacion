"""Escribe una función dict_partition que reciba como argumentos un
diccionario (d) y una función (f). dict_partition devolverá dos diccionarios, donde
cada uno contendrá pares clave-valor extraídos de d. La decisión de en cuál de
los dos diccionarios colocar cada par clave-valor dependerá de la salida de la
función f. f recibirá un par clave valor y devolverá True o False. Si devuelve True,
el par clave valor se insertará en el primer diccionario. Si devuelve False, en el
segundo."""


def dict_partition(d, f):
    result1 = {}
    result2 = {}
    d = dict(d)
    for k, v in d.items():
        if f(k, v):
            result1[k] = v
        else:
            result2[k] = v
    return result1, result2


def foo(k, v):
    if k == "x":
        return True
    if v > 10:
        return True
    return False


diccionario1 = {"x": 5, "y": 3, "z": 31, "w": 10}

diccionario2, diccionario3 = dict_partition(diccionario1, foo)
print(diccionario2)
print(diccionario3)
