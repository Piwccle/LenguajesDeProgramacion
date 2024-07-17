"""Se tiene una clase  Empleado con los atributos nombre, apellido y salario.
Se desea crear un método de clase llamado from_string que reciba una cadena de texto en formato
"nombre-apellido-salario" y cree un objeto Empleado con los valores correspondientes.
El método debe devolver el objeto creado. Diseña la clase Empleado, que tan solo
debe contener un constructor y el método from_string utilizando el decorador @classmethod."""


class Empleado:
    def __init__(self, nombre, apellido, salario):
        self.nombre = nombre
        self.apellido = apellido
        self.salario = salario

    @classmethod
    def from_string(cls, cadena):
        lista_nombres = cadena.split("-")
        return cls(lista_nombres[0], lista_nombres[1], lista_nombres[2])


empleado = Empleado.from_string("Alberto-Jimenez-1000")
print(empleado.nombre)
print(empleado.apellido)
print(empleado.salario)
