import random


class Matrix:

    def __init__(self, m, n, value=0):
        self.m = m
        self.n = n

        self._rows = [[value] * n for _ in range(m)]

    @classmethod
    def matrix_zeros(cls, m, n):
        return cls(m, n)

    @classmethod
    def matrix_identity(cls, m, n):
        if m != n:
            raise Exception("Matriz de dimensiones incorrectas")
        res = cls(m, n)

        for i in range(m):
            res._rows[i][i] = 1

        return res

    @classmethod
    def matrix_random(cls, m, n):
        res = cls(m, n)
        res._rows = [[random.randint(0, 22) for j in range(n)] for i in range(m)]
        return res

    def __str__(self):
        result = "\n".join(map(str, [[self._rows[i][j] for j in range(self.n)] for i in range(self.m)])) + "\n"
        return str(result)

    def __add__(self, other):
        if self.m != other.m: return 0
        if self.n != other.n: return 0
        result = Matrix(self.m, self.n, 0)
        for i in range(self.m):
            for j in range(self.n):
                result._rows[i][j] = self._rows[i][j] + other._rows[i][j]
        return result

    def __sub__(self, other):
        if self.m != other.m: return 0
        if self.n != other.n: return 0
        result = Matrix(self.m, self.n, 0)
        for i in range(self.m):
            for j in range(self.n):
                result._rows[i][j] = self._rows[i][j] - other._rows[i][j]
        return result

    def __eq__(self, other):
        return self._rows != other._rows

    def __iadd__(self, other):
        if self.m != other.m: return 0
        if self.n != other.n: return 0
        self = self + other
        return self

    def __isub__(self, other):
        if self.m != other.m: return 0
        if self.n != other.n: return 0
        self = self - other
        return self

    def transpose(self):
        result = Matrix(self.n, self.m)
        for i in range(self.m):
            for j in range(self.n):
                result._rows[j][i] = self._rows[i][j]
        return result

    def size(self):
        return self.n, self.m

    def __getitem__(self, item):
        return self._rows[item]

    def __setitem__(self, key, value):
        self._rows[key] = value


def main():
    matriz = Matrix(3, 3, 3)
    matriz2 = Matrix(3, 3, 2)
    matriz3 = Matrix(3, 3, 3)
    matriz4 = Matrix(4, 2, 3)
    # print(matriz)
    suma = matriz + matriz2
    resta = matriz - matriz2
    matriz += matriz2
    matriz3 -= matriz2

    matriz4[3][0] = 2
    matriz4[1][1] = 5
    print(matriz4)

    matriz5 = matriz4.transpose()
    print(matriz5)

    print(suma)
    print(resta)
    print(matriz)
    print(matriz3)

    matrix = Matrix.matrix_zeros(4, 4)
    print(matrix)

    matrix2 = Matrix.matrix_identity(4, 4)
    print(matrix2)

    matrix3 = Matrix.matrix_random(4, 4)
    print(matrix3)


if __name__ == '__main__':
    main()
