squares = [x**2 for x in range(10)]
print(squares)

some_numbers = [-4, -2, 0, 2, 4]
dp_numbers = [number * 2 for number in some_numbers if number >= 0]
print(dp_numbers)

dp_numbers = [number * 2 if number >= 0 else number * - 2 for number in some_numbers]
print(dp_numbers)

combinations = [[x,y] for x in [1,2,3] for y in [3,1,4] if x != y]
print(combinations)

matrix = [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12, 13, 14, 15]]

transposed = []
for i in range(5):
    transposed_row = []
    for row in matrix:
        transposed_row.append(row[i])
    transposed.append(transposed_row)
print(transposed)

transposed = [[row[i] for row in matrix] for i in range(5)]
print(transposed)

