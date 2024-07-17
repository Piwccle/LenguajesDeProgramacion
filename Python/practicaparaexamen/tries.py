names = ['Gato', 'Perro', 'Caballo', 'Cerdo', 'Conejo']


def sort_names(list):
    list.sort()


def sort_lenght(list):
    list.sort(key=len, reverse=True)


sort_lenght(names)
print(names)
