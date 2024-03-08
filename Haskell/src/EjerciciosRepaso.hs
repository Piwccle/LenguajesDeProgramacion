module EjerciciosRepaso 
        (separarPorPosicion,
        separarPorPosicion',
        listasMellizas,
        sumaListasPlegado,
        sumaListasPlegado'
        ) where

separarPorPosicion' :: [a] -> ([a], [a])
separarPorPosicion' list = ([list!!x| x<-listPosiciones, even x], [list!!x | x<-listPosiciones, odd x])
    where listPosiciones = [1..(length list)]

separarPorPosicion :: [a] -> ([a], [a])
separarPorPosicion list = foldr (\x (impares,pares) -> if even x then (impares,[list!!x]++pares) else ([list!!x]++impares,pares)) ([], []) [0..(length list - 1)]

listasMellizas :: (Eq a) => [a] -> [a] -> Bool
listasMellizas list1 list2 = (fst lista1) == (snd lista2) && snd lista1 == reverse(fst lista2)
        where lista1 = separarPorPosicion list1 
              lista2 = separarPorPosicion list2

sumaListasPlegado :: (Num a) => [[a]] -> a
sumaListasPlegado = foldr (\x base -> base + sum x) 0

sumaListasPlegado' :: (Num a) => [[a]] -> a
sumaListasPlegado' = foldr (\x base -> base + (foldr (\n ac -> n + ac) 0 x)) 0