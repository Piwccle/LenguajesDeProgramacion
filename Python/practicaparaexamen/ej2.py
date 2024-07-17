"""esarrollar una función en python llamada preproceso_tuits que reciba como argumento un número variable
de cadenas de texto (tuits) y los devuelva preprocesados en forma de tupla. El preprocesado consistirá en:
pasar a minúscula, eliminar hashtags (#) y eliminar menciones (@).

La función debe respetar el siguiente interfaz:

def preproceso_tuits (*args).

A continuación, se muestran dos ejemplos de llamada junto con su resultado esperado:

Llamada: preproceso_tuits (“@antonio enhorabuena por el PAPER”, “muy buen trabajo en equipo #equipazo”,
“VAMOS A POR EL SIGUIENTE @antonio #seguimos”)
Valor devuelto: ("enhorabuena por el paper”, “muy buen trabajo en equipo”, “vamos a por el siguiente)

Llamada: preproceso_tuits (“hola a #todos, estoy por fin en TWITTER”)

Valor devuelto: (“hola a, estoy por fin en twitter”)"""


def preproceso_tuits(*args):
    return tuple([" ".join([i for i in x.lower().split() if i[0] not in ("#", "@")]) for x in args])


def preproceso_tuits2(*args):
    if len(args) < 1: return Exception("Missing atributes")
    result = []
    for arg in args:
        string_list = str(arg).split()
        phrase = []
        for string in string_list:
            if string[0] in "#@":
                continue
            else:
                phrase.append(string)
        result.append(" ".join(phrase))
    return tuple(result)


print(preproceso_tuits("hola a #todos, estoy por fin en TWITTER"))

print(preproceso_tuits2("@antonio enhorabuena por el PAPER", "muy buen trabajo en equipo #equipazo",
                        "VAMOS A POR EL SIGUIENTE @antonio #seguimos"))
