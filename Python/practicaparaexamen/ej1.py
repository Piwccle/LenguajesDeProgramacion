"""Dado un diccionario llamado ventas que contiene información sobre las ventas de productos
en diferentes tiendas, donde las claves son las tiendas y los valores son listas de tuplas con
información sobre los productos vendidos, precios y cantidades

ventas = {
    'tienda1': [('producto1', 10, 3), ('producto2', 20, 2), ('producto3', 30, 1)],
    'tienda2': [('producto1', 5, 2), ('producto2', 10, 4), ('producto3', 15, 1)],
    'tienda3': [('producto1', 15, 1), ('producto2', 30, 3), ('producto3', 45, 2)]
}

escribe una función en python llamada calcular_total que reciba un diccionario como ventas,
 y devuelva una lista de tuplas con el nombre de cada tienda y la suma total de las ventas en cada tienda.
 Utiliza la compresión de listas para reducir el número de líneas de código.

A continuación, se presenta un ejemplo de llamada a calcular_total:

calcular_total(ventas) --> [(tienda1, 100), (tienda2, 65), (tienda3, 195)]"""


def calcular_total(d):
    return {k: sum(p * c for _, p, c in v) for k, v in d.items()}
    '''result = {}
    for k, v in d.items():
        result[k] = result.get(k, 0)  # creo una nueva entrada en el diccionario
        for _, p, c in v:
            result[k] += p * c

    return result'''


ventas = {
    'tienda1': [('producto1', 10, 3), ('producto2', 20, 2), ('producto3', 30, 1)],
    'tienda2': [('producto1', 5, 2), ('producto2', 10, 4), ('producto3', 15, 1)],
    'tienda3': [('producto1', 15, 1), ('producto2', 30, 3), ('producto3', 45, 2)]
}
print(calcular_total(ventas))
