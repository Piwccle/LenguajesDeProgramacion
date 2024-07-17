def interseccion_sec(sec1, sec2):
    return sorted({value for value in sec1 if value in sec2})


def interseccion_sec_varios(*args):
    if len(args) == 2:
        return interseccion_sec(args[0], args[1])
    else:
        interseccion1tomany = [[value for value in args[0] if value in args[i]] for i in range(1, len(args))]
        return interseccion_sec_varios(*interseccion1tomany)


print(interseccion_sec([1, 2, 3], [2, 3, 4]))
print(interseccion_sec({1, 2, 3}, {2, 3, 4}))
print(interseccion_sec([1, 1, 1, 1, 1], [2, 2, 2, 2, 2, 2]))
print(interseccion_sec("Hello", "World"))
print(interseccion_sec_varios([1, 2, 3, 4, 4], [2, 3, 4, 4], [3, 4, 5, 4], [3, 4, 5, 6, 7, 4]))
