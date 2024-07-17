"""Escribe una función que reciba una lista o tupla de números, y devuelva el resultado de sumar y
restar los números de forma alternativa. Ejemplo: plus_minus([10, 20, 30, 40, 50, 60]),
deberá devolver 50 (10+20-30+40-50+60)"""


def plus_minus(numbers):
    result = numbers[0]
    condition = 0
    
    for number in numbers[1:]:
        if condition == 0:
            result += number
            condition = 1
        else:
            result -= number
            condition = 0
    return result


numbers = [10, 20, 30, 40, 50, 60]
print(plus_minus(numbers))
