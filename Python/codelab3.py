list_to_work = ["examen", "de", "python"]
# list_to_work = ("examen", "de", "python")
# list_to_work = ("examen de python")

lista = [(x+1, list_to_work[x]) for x in range(len(list_to_work))]
print(lista)
