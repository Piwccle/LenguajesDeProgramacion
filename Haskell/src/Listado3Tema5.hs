module Listado3Tema5 
        (qksort,
        divisiones,
        a1,a2,a3,a4,a5,
        listaAsociaciones,
        listaMatriculados,
        mostrarAlumnos,
        mismaFecha,
        insertarOrdenado,
        ordenarAux,
        ordenar,
        qs,
        temporada2013,
        getGanador,
        ordenarListaYMostrar,
        mostrarListadoOrdenadoTorneos,
        o,
        insertarEnMesa,
        insertarMesaLibre,
        quitarMesa,
        encontrarMesaLibre,
        ocuparMesa,
        esVacia,
        primero,
        insertar,
        size,
        eliminar,
        ee1
        ) where

data Fecha = Fecha {dia :: Int, mes :: Int, año :: Int}

instance Show Fecha where
    show (Fecha d m a) = show d ++ "/" ++ show m ++ "/" ++ show a

instance Eq Fecha where
    f1 == f2 = dia f1 == dia f2 && mes f1 == mes f2 && año f1 == año f2

instance Ord Fecha where
    compare x y 
        | x == y = EQ
        | año x < año y || (año x == año y && mes x < mes y) || (año x == año y && mes x == mes y && dia x < dia y) = LT
        | otherwise = GT
    
qksort :: (Ord a) => [a] -> [a]
qksort [] = []
qksort (p:xs) = qksort [x | x <- xs, x < p] ++ [p] ++ qksort [x | x <- xs, x >= p]

divisiones :: (Eq a, Integral a) => a -> [a] -> [Maybe a]
divisiones n list = [if x == 0 then Nothing else Just (n`div`x) | x <- list]

data Titulacion = GradoII | GradoADE_II | GradoADE deriving (Show, Eq)

data Estudiante = Estudiante String Titulacion

instance Show Estudiante where
    show (Estudiante n t) = "(" ++ n ++ show t ++ ")"

instance Eq Estudiante where
    (Estudiante nombre1 titulacion1) == (Estudiante nombre2 titulacion2) = nombre1 == nombre2 && titulacion1 == titulacion2

a1 :: Estudiante
a1 = Estudiante "Carlos Calle" GradoADE_II

a2 :: Estudiante
a2 = Estudiante "Irene Plaza" GradoADE

a3 :: Estudiante
a3 = Estudiante "Pepe Perez" GradoII

a4 :: Estudiante 
a4 = Estudiante "Manolo Lama" GradoADE_II

a5 :: Estudiante
a5 = Estudiante "Iciar Padilla" GradoADE

data ListaMatriculados = ListaMatriculados [Estudiante] deriving Show
data ListaAsociaciones = ListaAsociaciones [Estudiante] 

listaAsociaciones :: ListaAsociaciones
listaAsociaciones = ListaAsociaciones [a1,a2]

listaMatriculados :: ListaMatriculados
listaMatriculados = ListaMatriculados [a1,a2,a3,a4,a5]

instance Show ListaAsociaciones where
    show (ListaAsociaciones l) = show l

mostrarAlumnos :: (ListaMatriculados, ListaAsociaciones) -> String
mostrarAlumnos (_, la) = show la

mismaFecha :: Fecha -> Fecha -> Bool
mismaFecha f1 f2 = dia f1 == dia f2 && mes f1 == mes f2 && año f1 == año f2

insertarOrdenado :: Fecha -> [Fecha] -> [Fecha]
insertarOrdenado f [] = [f]
insertarOrdenado f [x] 
    | año f > año x = [x,f]
    | año f <= año x && mes f > mes x = [x,f]
    | año f <= año x && mes f <= mes x && dia f > dia x = [x,f]
    | otherwise = [f,x]
insertarOrdenado f (x:xs) 
    | año f < año x = [f,x] ++ xs
    | año f == año x && mes f < mes x = [f,x] ++ xs
    | año f == año x && mes f == mes x && dia f < dia x = [f,x] ++ xs
    | otherwise = [x] ++ insertarOrdenado f xs

ordenarAux :: [Fecha] -> [Fecha] -> [Fecha]
ordenarAux [] r = r
ordenarAux (x:xs) lista = ordenarAux xs (insertarOrdenado x lista)

ordenar :: [Fecha] -> [Fecha]
ordenar lista = ordenarAux lista []

qs :: [Fecha] -> [Fecha]
qs lista = qksort lista

class Coleccion c where
    esVacia :: c a -> Bool
    insertar :: a -> c a -> c a
    primero :: c a -> a
    eliminar :: c a -> c a
    size :: c a -> Int

data Pila a = Pil [a] deriving Show
data Cola a = Col [a] deriving Show

instance Coleccion Pila where
    esVacia (Pil list) = length list == 0
    insertar num (Pil list) = (Pil (list++[num]))
    primero (Pil list) = last list
    eliminar (Pil list) = (Pil (init list))
    size (Pil list) = length list


instance Coleccion Cola where
    esVacia (Col list) = length list == 0
    insertar num (Col list) = (Col (list++[num]))
    primero (Col list) = head list
    eliminar (Col list) = (Col (tail list))
    size (Col list) = length list

data Torneo = Torneo {nombre :: String, finalistas :: (String, String), resultado :: ([Int], [Int])} 

instance Show Torneo where
    show t = nombre t ++ ", Ganador: " ++ getGanador t ++ ", en " ++ show (length (fst (resultado t))) ++ " sets.\n"

instance Eq Torneo where
    t1 == t2 = nombre t1 == nombre t2 && finalistas t1 == finalistas t2 && resultado t1 == resultado t2

instance Ord Torneo where
    compare t1 t2
        | t1 == t2 = EQ
        | nombre t1 <= nombre t2 = LT
        | otherwise = GT

getGanador :: Torneo -> String
getGanador t 
    | sum (fst (resultado t)) > sum (snd (resultado t)) = fst (finalistas t)
    | sum (fst (resultado t)) < sum (snd (resultado t)) = snd (finalistas t)
    | sum (fst (resultado t)) < sum (snd (resultado t)) && last (fst (resultado t)) > last (snd (resultado t)) = fst (finalistas t)
    | otherwise = snd (finalistas t)

temporada2013 :: [Torneo]
temporada2013 = [(Torneo "Open de Australia" ("Novak Djokovic","Andy Murray") ([6,7,6,6], [7,6,3,2]))] 
    ++ [(Torneo "Indian Wells" ("Juan Martín del Potro","Rafael Nadal") ([6,3,4],[4,6,6]))]
    ++ [(Torneo "Mutua Madrid Open" ("Rafael Nadal", "Stanislas Wawrinka") ([6,6],[2,4]))]
    ++ [(Torneo "Wimbledon" ("Novak Djokovic", "Andy Murray") ([6,7,6],[4,5,4]))]

ordenarListaYMostrar :: [Torneo] -> String
ordenarListaYMostrar [] = ""
ordenarListaYMostrar (x:xs) = show x ++ ordenarListaYMostrar xs

mostrarListadoOrdenadoTorneos :: [Torneo] -> String
mostrarListadoOrdenadoTorneos list = ordenarListaYMostrar (qksort list)

data Student = Student {fullname :: String, age :: Integer, qualifications :: [Integer]}

ee1 :: Student
ee1 = (Student "Sergio" 21 [1,2,3,4,5,6])

instance Eq Student where
    s1 == s2 = fullname s1 == fullname s2 && age s1 == age s2 && qualifications s1 == qualifications s2

--Si suponemos que un estudiante es mayor que otro por la edad seria asi, si fuera
--alfabeticamente habria que cambiar age por fullname
instance Ord Student where
    compare x y 
        | x == y = EQ
        | age x <= age y = LT
        | otherwise = GT

data Mesa = Mesa {numeroMesa :: Int, capacidad :: Int}

instance Show Mesa where
    show m = "Mesa " ++ show (numeroMesa m) ++ " -> Capacidad: " ++ show (capacidad m)

instance Eq Mesa where
    m1 == m2 = numeroMesa m1 == numeroMesa m2 && capacidad m1 == capacidad m2

instance Ord Mesa where
    compare m1 m2
        | m1 == m2 = EQ
        | capacidad m1 <= capacidad m2 = LT
        | otherwise = GT

data Ocupacion = Ocupacion {libres :: [Mesa], ocupadas :: [Mesa]}

instance Show Ocupacion where
    show oc = "Libres: \n" ++ show (libres oc) ++ "\nOcupadas: \n" ++ show (ocupadas oc)

o :: Ocupacion
o = Ocupacion [(Mesa 3 5), (Mesa 1 10)] [(Mesa 2 20)]

insertarEnMesa :: [Mesa] -> Mesa -> [Mesa]
insertarEnMesa [] _ = []
insertarEnMesa [x] m 
    | x < m = [x,m]
    | otherwise = [m,x]
insertarEnMesa (x:xs) m 
    | m < x = [m,x] ++ xs
    | otherwise = [x] ++ insertarEnMesa xs m 

insertarMesaLibre :: Ocupacion -> Mesa -> Ocupacion
insertarMesaLibre o1 m1  
    | null (libres o1) = (Ocupacion [m1] (ocupadas o1))
    | otherwise = (Ocupacion (insertarEnMesa (libres o1) m1) (ocupadas o1))

type NumeroComensales = Int 

quitarMesa :: [Mesa] -> Mesa -> [Mesa]
quitarMesa lista m = [x | x <- lista, not(x == m)]

encontrarMesaLibre :: [Mesa] -> NumeroComensales -> Mesa
encontrarMesaLibre [] _ = error "No hay mesas libres para estos comensales"
encontrarMesaLibre (x:xs) num
    | capacidad x > num = x
    | otherwise = encontrarMesaLibre xs num

ocuparMesa :: Ocupacion -> NumeroComensales -> Ocupacion
ocuparMesa o1 num = (Ocupacion (quitarMesa (libres o1) mesa) (insertarEnMesa (ocupadas o1) mesa))
    where mesa = encontrarMesaLibre (libres o1) num

--No puedo hacer el 10 hasta el miercoles
--Ni el 11
--Ni el 12