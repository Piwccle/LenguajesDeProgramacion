module EjerciciosClase4 
        (arbolesIguales,
        menorListaAux,
        menorLista,
        menorLista',
        buscarPareja,
        alturaArbol,
        isPintor,
        isMayor1500,
        pintores,
        artistas,
        canCelebrateEvent,
        espaciosEmpresaPorEvento,
        espaciosIguales,
        es1,es2,es3,es4,empresa1,empresa2
        ) where
    
data Arbol a = AV | Rama (Arbol a) a (Arbol a) deriving Show

arbolesIguales :: Eq a => Arbol a -> Arbol a -> Bool
arbolesIguales a1 a2 = a1 == a2 

instance (Eq a) => Eq (Arbol a) where
    AV == AV = True
    AV == _ = False
    _ == AV = False
    (Rama izq1 r1 der1) == (Rama izq2 r2 der2) = (izq1 == izq2) && (r1 == r2) && (der1 == der2)

menorListaAux :: (Ord a) => [a] -> a -> Maybe a
menorListaAux [] r = Just r
menorListaAux (x:xs) mini 
    | x <= mini = menorListaAux xs x
    | otherwise = menorListaAux xs mini

menorLista :: (Ord a) => [a] -> Maybe a
menorLista [] = Nothing
menorLista list = menorListaAux list (head list)

menorLista' :: (Ord a) => [a] -> Maybe a
menorLista' [] = Nothing
menorLista' (x:xs) = foldr (\y base -> if (Just y) < base then (Just y) else base) (Just x) xs

buscarPareja :: (Eq a) => a -> [(a,b)] -> Maybe b
buscarPareja _ [] = Nothing
buscarPareja prim ((e1,e2):xs)
    | prim == e1 = Just e2
    | otherwise = buscarPareja prim xs

alturaArbol :: Arbol a -> Int
alturaArbol AV = 0
alturaArbol (Rama izq _ der) = 1 + (max (alturaArbol izq) (alturaArbol der))

type Arte = String
type Nombre = String
type Nacimiento = Int
data Artista = A Nombre Arte Nacimiento

instance Show Artista where
    show (A nombre arte nacimiento) = nombre ++ " - " ++ arte ++ ", nacido en " ++ show nacimiento ++ "\n"

artistas :: [Artista]
artistas = [A "Cervantes" "Literatura" 1547,
    A "Velazquez" "Pintura" 1599,
    A "Picasso" "Pintura" 1881,
    A "Beethoven" "Musica" 1770,
    A "Poincare" "Ciencia" 1854,
    A "Quevedo" "Literatura" 1580,
    A "Goya" "Pintura" 1746,
    A "Einstein" "Ciencia" 1879,
    A "Mozart" "Musica" 1756,
    A "Botticelli" "Pintura" 1445,
    A "Borromini" "Arquitectura" 1599,
    A "Bach" "Musica" 1685
    ]

isPintor :: Artista -> Bool
isPintor (A _ arte _) = arte == "Pintura"

isMayor1500 :: Artista -> Bool
isMayor1500 (A _ _ nac) = nac >= 1500

pintores :: [Artista] -> [Artista]
pintores list = [x | x <- list, isPintor x, isMayor1500 x]

data TipoEvento = EventoFamiliar | Boda | FiestaInfantil | ReunionEmpresa deriving (Eq,Show)
data TipoOcio = Escalada | Saltos | Bolos deriving (Eq, Show)

data Espacio = CelebracionesInfantiles {nombre :: String, direccion :: String, capacidad :: Int}
            | EspaciosDeportivos {nombre :: String, direccion :: String, capacidad :: Int, ocio :: TipoOcio}
            | Loft {nombre :: String, direccion :: String, capacidad :: Int, servicioCocina :: Bool} deriving Show

instance Eq Espacio where
    (CelebracionesInfantiles _ _ c1) == (CelebracionesInfantiles _ _ c2) = c1 == c2
    (EspaciosDeportivos _ _ c1 _) == (EspaciosDeportivos _ _ c2 _) = c1 == c2
    (Loft _ _ c1 _ ) == (Loft _ _ c2 _) = c1 == c2 
    _ == _ = False
    
data Empresa = Empresa {nombreEmpresa :: String, espacios :: [Espacio]} deriving Show

canCelebrateEvent :: Espacio -> TipoEvento -> Bool
canCelebrateEvent (CelebracionesInfantiles _ _ _ ) event = event == (FiestaInfantil)
canCelebrateEvent (EspaciosDeportivos _ _ _ _) event = event == ReunionEmpresa || event == FiestaInfantil
canCelebrateEvent (Loft _ _ _ _) event = not (event == FiestaInfantil)

espaciosEmpresaPorEvento :: Empresa -> TipoEvento -> [Espacio]
espaciosEmpresaPorEvento (Empresa _ esp) event = foldr(\x base -> if canCelebrateEvent x event then [x]++base else base) [] esp

espaciosIguales :: Empresa -> Empresa -> [Espacio]
espaciosIguales e1 e2 = [x | x <- espacios e1, elem x (espacios e2)]

es1 :: Espacio
es1 = (CelebracionesInfantiles "aaa" "aaa" 12)

es2 :: Espacio
es2 = (CelebracionesInfantiles "aaaaa" "aaaaa" 12)

es3 :: Espacio
es3 = (CelebracionesInfantiles "bbbb" "bbbb" 15)

es4 :: Espacio
es4 = (Loft "cccc" "cccc" 20 True)

empresa1 :: Empresa
empresa1 = (Empresa "ppaass" [es1, es3])

empresa2 :: Empresa
empresa2 = (Empresa "ppaass" [es2, es3, es4])