module EjerciciosExamen 
        (pertenece,
        eliminar,
        productoEscalar,
        bota1,
        zapatilla1,
        bota2,
        zapatilla2,
        bota3,
        zapatilla3,
        productos,
        order,
        librerias,
        insertarEnArbol,
        f,
        separarPorPosicion,
        p
        ) where

pertenece :: (Eq a) => a -> [a] -> Bool
pertenece elemento = foldr (\x base -> x == elemento || base) False

eliminar :: (Eq a) => a -> [a] -> [a]
eliminar elemento = foldr (\x base -> if x == elemento then base else [x]++base) []

type Vector = [Int]

productoEscalar :: Vector -> Vector -> Int
productoEscalar v1 v2 = foldl (\base x -> base + x) 0 ([(fst x * snd x) | x <- (zip v1 v2)])

data Botas = Botas {marcaB :: String, numeroB :: Int}
data Zapatillas = Zapatillas {marcaZ :: String, numeroZ :: Int, deporte :: String}
data Calzado = Bota Botas | Zapatilla Zapatillas

instance Show Calzado where
    show (Bota b) = "Bota de la marca " ++ marcaB b ++ " del numero " ++ show (numeroB b) ++ "\n"
    show (Zapatilla z) = "Zapatilla de la marca " ++ marcaZ z ++ " del numero " ++ show (numeroZ z) ++ " para " ++ deporte z ++ "\n"

instance Eq Calzado where
    Bota b1 == Bota b2 = marcaB b1 == marcaB b2 && numeroB b1 == numeroB b2
    Zapatilla z1 == Zapatilla z2 = marcaZ z1 == marcaZ z2 && numeroZ z1 == numeroZ z2 && deporte z1 == deporte z2 
    Bota _ == Zapatilla _ = False
    Zapatilla _ == Bota _ = False

getMarca :: Calzado -> String
getMarca (Bota b) = marcaB b
getMarca (Zapatilla z) = marcaZ z

instance Ord Calzado where
    compare c1 c2
        | c1 == c2 = EQ
        | getMarca c1 < getMarca c2 = LT
        | otherwise = GT

--datos de ejemplo
bota1 :: Calzado
bota1 = Bota (Botas "Fosco" 38)
zapatilla1 :: Calzado
zapatilla1 = Zapatilla (Zapatillas "Adidas" 40 "Running")
bota2 :: Calzado
bota2 = Bota (Botas "Diesel" 42)
zapatilla2 :: Calzado
zapatilla2 = Zapatilla (Zapatillas "Adidas" 40 "Running")
bota3 :: Calzado
bota3 = Bota (Botas "Martinelli" 40)
zapatilla3 :: Calzado
zapatilla3 = Zapatilla (Zapatillas "Nike" 32 "Padel")

productos :: [Calzado]
productos = [bota1,zapatilla2,bota2,zapatilla2,bota3,zapatilla3]

order :: Ord a => [a] -> [a]
order [] = []
order (x:xs) = order menores ++ [x] ++ order mayores
    where menores = [y | y <- xs, y <= x]
          mayores = [y | y <- xs, y > x]

data Version = Version {major :: Int, minor :: Int}

instance Show Version where
    show v = show (major v) ++ "." ++ show (minor v)

instance Eq Version where
    v1 == v2 = major v1 == major v2 && minor v1 == minor v2

instance Ord Version where
    compare v1 v2
        | v1 == v2 = EQ
        | major v1 < major v2 || (major v1 == major v2 && minor v1 < minor v2) = LT
        |otherwise = GT

data Libreria = Libreria {nombre :: String, version :: Version}

instance Show Libreria where
    show lib = nombre lib ++ " " ++ show (version lib)

instance Eq Libreria where
    lib1 == lib2 = nombre lib1 == nombre lib2 && getMajor (version lib1) == getMajor (version lib2) 
        && getMinor (version lib1) == getMinor (version lib2)

instance Ord Libreria where
    compare lib1 lib2
        | lib1 == lib2 = EQ
        | nombre lib1 < nombre lib2 || (nombre lib1 == nombre lib2) && version lib1 < version lib2  = LT
        | otherwise = GT

l1 :: Libreria
l1 = (Libreria "doker" (Version 2 1))
l2 :: Libreria
l2 = (Libreria "doker" (Version 3 2))
l3 :: Libreria
l3 = (Libreria "doker" (Version 2 2))
l4 :: Libreria
l4 = (Libreria "mtt" (Version 3 3))
l5 :: Libreria
l5 = (Libreria "ansible" (Version 1 21))
l6 :: Libreria
l6 = (Libreria "ruby" (Version 2 0))
l7 :: Libreria
l7 = (Libreria "ansible" (Version 1 2))

librerias :: [Libreria]
librerias = [l1,l2,l3,l4,l5,l6,l7]

getMajor :: Version -> Int
getMajor v = major v

getMinor :: Version -> Int
getMinor v = minor v

-- No puedo hacer ni el c ni el d de momento del listado 2 de examenes

--ABB
data Arbol a = AV | Rama (Arbol a) a (Arbol a) deriving Show

insertarEnArbol :: (Ord a) => a -> Arbol a -> Arbol a
insertarEnArbol r AV = (Rama AV r AV)
insertarEnArbol n (Rama AV raiz AV)
    | n < raiz = (Rama (Rama AV n AV) raiz AV)
    | otherwise = (Rama AV raiz (Rama AV n AV))
insertarEnArbol n (Rama izq raiz der)
    | n < raiz = (Rama (insertarEnArbol n izq) raiz der)
    | otherwise = (Rama izq raiz (insertarEnArbol n der))

isVocal :: Char -> Bool
isVocal 'a' = True
isVocal 'e' = True
isVocal 'i' = True
isVocal 'o' = True
isVocal 'u' = True
isVocal _ = False

f :: String -> (String, String)
f = foldr (\x (vocales,consonantes) -> if isVocal x then ([x]++vocales,consonantes) else (vocales,[x]++consonantes)) ("","")

separarPorPosicion :: [a] -> ([a], [a])
separarPorPosicion list = foldr (\x (impares,pares) -> if even x then (impares,[list!!x]++pares) else ([list!!x]++impares,pares)) ([], []) [0..(length list - 1)]

--Basicamente crea una lista de listas empezando por la vacia y sigue con la lista del primer numero, la lista formada por el primero
-- y el segundo, la lista formada por el primero segundo y tercero y asi sucesivamente
-- cualquier aplicacion es pasarle una lista cualquiera por ejemplo p [1,2,3,4] o p "asdf"
p :: [a] -> [[a]]
p [] = [[]]
p (x:xs) = []:map(x:)(p xs)