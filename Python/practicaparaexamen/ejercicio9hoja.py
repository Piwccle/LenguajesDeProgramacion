"""9. Escribe una función que reciba una lista de diccionarios y devuelva un solo diccionario que contenga
todas las claves y valores. Si una clave aparece más de una vez en distintos diccionarios,
el valor asociado a esa clave en el diccionario final deberá ser una lista con todos sus valores."""


def foo(*args):
    if len(args) < 1:
        return Exception("Missing args")

    result = {}
    for arg in args:
        d = dict(arg)
        for k, v in d.items():
            if k not in result:
                result[k] = [v]
            else:
                result[k].append(v)
    return result


diccionario1 = {"x": 3, "z": 1, "w": 5}
diccionario2 = {"x": 1, "y": 2, "z": 3}
diccionario3 = {"y": 4, "w": 10}
diccionario4 = {"v": 6}
diccionario5 = {"y": 20}
print(foo(diccionario1, diccionario2, diccionario3, diccionario4, diccionario5))
