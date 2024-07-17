with open("./ficheros/etcpasswd.txt") as file:
    first_line = file.readline().split(":")
    length_linea = len(first_line)
    first_shell = first_line[length_linea - 1].replace("\n", "")

    listShells = {first_shell: 1}

    for line in file:
        shell = line.split(":")[length_linea - 1].replace("\n", "")
        # shell = line.strip().split(":")[length_linea - 1]
        if shell:
            listShells[shell] = listShells.get(shell, 0) + 1

print(listShells)
print(sorted(listShells, key=listShells.get, reverse=True))
