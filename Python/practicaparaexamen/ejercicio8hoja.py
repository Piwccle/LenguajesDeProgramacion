"""Escribe una función que emule el comportamiento de zip, tomando como argumento cualquier número de secuencias
y devolviendo una lista de tuplas. Ejemplo: my_zip([10, 20,30], 'abc')
deberá devolver [(10, 'a'), (20, 'b'), (30, 'c')]."""


def my_zip(*args):
    if len(args) < 1:
        raise ValueError("Missing parameters")

    min_len = len(args[0])
    for arg in args:
        if len(arg) < min_len:
            min_len = len(arg)

    return [tuple([arg[i] for arg in args]) for i in range(min_len)]


print(my_zip([10, 20, 30], 'abcdd'))
