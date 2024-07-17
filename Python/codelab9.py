class Matrix:

    def __init__(self, m, n, value=0):
        self.m = m
        self.n = n

        self._rows = [[value] * n for _ in range(m)]

    def __str__(self):
        """result =
        for i in range(self.m):
            result = result + "\n"
            for j in range(self.n):
                if j == 0:
                    result = result + str(self._rows[i][j])
                else:
                    result = result + " " + str(self._rows[i][j])"""
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
        if self.m != other.m: return False
        if self.n != other.n: return False
        result = True
        for i in range(self.m):
            for j in range(self.n):
                if self._rows[i][j] != other._rows[i][j]: return False
        return result

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
        return self.n * self.m

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


if __name__ == '__main__':
    main()
