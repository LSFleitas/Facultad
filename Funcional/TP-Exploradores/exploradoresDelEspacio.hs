----------------Primer punto---------------
--De cada planeta conocemos su nombre, su posición en coordenadas PDP (un punto con coordenadas x,y,z) y su porcentaje de agua.

--Sabemos que al menos existen 3 planetas:

--Próxima Centauri b, se encuentra orbitando la estrella Próxima Centauri, actualmente en el punto (43.2, 14.2, 8.9). Según nuestros 
--métodos, su porcentaje de agua es 74%. 

--Alpha Centauri Bb, según nuestros reportes se encuentra actualmente en el punto (17, 31.2, 32) y su porcentaje de agua es realmente 
--bajo, solo 3% de agua.

--Alpha Centauri Cc, el último planeta descubierto. Se encuentra en la ubicación (42, 42, 42), el agua que detectamos está congelada 
--pero representa un 60% según los reportes.
-------------------------------------------


data Posicion = UnaPosicion {
    x :: Float,
    y :: Float,
    z :: Float
    }
    deriving Show

data Planeta = UnPlaneta {
    nombre :: String,
    posicion :: Posicion,
    porcentajeDeAgua :: Float
    }
    deriving Show

proximaCentauriB :: Planeta
proximaCentauriB = UnPlaneta {
    nombre = "Proxima Centauri b",
    posicion = UnaPosicion {
        x = 43.2,
        y = 14.2,
        z = 8.9
        },
    porcentajeDeAgua = 0.74
    }

alphaCentauriBb :: Planeta
alphaCentauriBb = UnPlaneta {
    nombre = "Alpha Centauri Bb",
    posicion = UnaPosicion {
        x = 17,
        y = 31.2,
        z = 32
        },
    porcentajeDeAgua = 0.03
    }

alphaCentauriCc :: Planeta
alphaCentauriCc = UnPlaneta {
    nombre = "Alpha Centauri Cc",
    posicion = UnaPosicion {
        x = 42,
        y = 42,
        z = 42
        },
    porcentajeDeAgua = 0.6
    }


----------------Segundo punto---------------
--Para poder dirigirnos a explorar los diferentes planetas de Alpha Centauri, primero debemos saber a qué distancia estamos de ellos.
--Para ello es necesario tener una función `distanciaA` que dado un planeta destino y nuestra ubicación (en coordenadas PDP) pueda 
--calcular la distancia al mismo.

--La fórmula utilizada para calcular la distancia es:

--dist((x1, y1, z1), (x2, y2, z2)) = x1x2 + 2y1z2 + |y2 - z1|
--------------------------------------------

--distanciaA :: Planeta -> Posicion -> Float
--distanciaA planeta pos = abs(( x (posicion planeta)) *2 + 2* ( y (posicion planeta) ) * z pos + abs (y pos  - z (posicion planeta)))

distanciaA_v2 :: Nave -> Planeta -> Float
distanciaA_v2 nave planeta = abs (( x (posicion planeta)) *2 + 2* ( y (posicion planeta) ) * z (posicionNave nave) + abs (y (posicionNave nave) - z (posicion planeta)))


----------------Tercer punto---------------
--Ahora que sabemos a qué distancia estamos de cada planeta, necesitamos saber si un planeta es apto. Esto es, cuando su 
--porcentaje de agua es mayor a 52% y la distancia a él desde nuestra nave es menor a 100.
-------------------------
------------------


--esApto :: Planeta -> Posicion -> Bool
--esApto planeta pos = ( (porcentajeDeAgua planeta > 0.52) ) && ( distanciaA planeta pos < 100)

esApto_v2 :: Planeta -> Bool
esApto_v2 planeta = (porcentajeDeAgua planeta > 0.52) && (distanciaA_v2 miNave planeta < 100)


----------------Cuarto punto---------------
--Por último, debemos cargar el próximo planeta al que se dirigirá la nave, para ello necesitamos primero modelarla.
--De nuestra nave conocemos su nombre, cantidad de combustible expresada en litros, sus tripulantes y el próximo planeta 
--al que se dirigirá.
--Inicialmente el planeta destino es Alpha Centauri Bb, pero nos gustaría poder cambiarlo, por lo que deben hacer una 
--función `cargarProximoPlaneta` que dada una nave y una lista de planetas explorados fije el primer planeta de la lista como próximo 
--destino de la nave.
--Inicialmente el planeta destino es Alpha Centauri Bb, pero nos gustaría poder cambiarlo, por lo que deben hacer una 
--función `cargarProximoPlaneta` que dada una nave y una lista de planetas explorados fije el primer planeta de la lista como próximo 
--destino de la nave.
-------------------------------------------


data Nave = UnaNave {
    posicionNave :: Posicion,
    nombreNave :: String,
    combustible :: Float,
    tripulacion :: [String],
    destino :: Planeta 
    }
    deriving Show

miNave :: Nave
miNave = UnaNave {
    posicionNave = UnaPosicion {
        x = 10,
        y = 10,
        z = 10
    },
    nombreNave = "Lucas I",
    combustible = 10,
    tripulacion = ["Lucas"],
    destino = alphaCentauriBb
    }

cargarProximoPlaneta :: Nave -> [Planeta] -> Nave
cargarProximoPlaneta nave [] = nave {destino = destino nave}
cargarProximoPlaneta nave listaPlanetas = nave {destino = head listaPlanetas}

pl1 = [alphaCentauriBb, alphaCentauriCc, proximaCentauriB]
--pl2 = [proximaCentauriB, alphaCentauriBb, alphaCentauriCc]
--pl3 = [alphaCentauriCc, proximaCentauriB, alphaCentauriBb]
--pl4 = [proximaCentauriB, alphaCentauriBb]
--pl5 = []


----------------Quinto punto---------------
--Por último, necesitamos saber si una lista de planetas está ordenada de menor a mayor distancia. Para ello define una 
--función `estaOrdenada` usando recursión.
-------------------------------------------


--menoramayor ([]) = False
--menoramayor (x:[]) = True
--menoramayor (x:xs) = (x <= head xs) && menoramayor xs

--estaOrdenada :: [Planeta] -> (a, Float, Float) -> Bool
--estaOrdenada ([]) (_,_,_) = False
--estaOrdenada (_:[]) (_,_,_) = True
--estaOrdenada (planeta:colaPlanetas) (x1,y1,z1) = (distanciaA planeta (x1,y1,z1) <= distanciaA (head colaPlanetas) (x1,y1,z1)) && (estaOrdenada colaPlanetas (x1,y1,z1))

estaOrdenada_v2 :: [Planeta] -> Nave -> Bool
estaOrdenada_v2 ([]) (_)= False
estaOrdenada_v2 (_:[]) (_) = True
estaOrdenada_v2 (planeta:colaPlanetas) nave = (distanciaA_v2 nave planeta <= distanciaA_v2 nave (head colaPlanetas)) && (estaOrdenada_v2 colaPlanetas nave)





----------------Aclaracion---------------
--Todas las funciones del tipo "..._v2" funcionan para la posición que le di a la nave, y para cualquier otra que se le defina. Esa posición no se la dí 
--porque haya sido la que la consigna pide que tenga la nave, sino porque justamente en ningún lugar dice cuál es la posición, pero según la consigna 
--hay funciones que están basadas en la posición que supuestamente tiene la nave, así que arbitrariamente le dí una. Como no entendí cuál de las dos 
--"versiones" es la válida, por las dudas ahí dejo las dos.

-------------------------------------------
-- PARTE ADICIONAL:

-- Dada una lista de planetas calcular cuantas son aptas

cuantosSonAptos :: [Planeta] -> Int
cuantosSonAptos listaDePlanetas = length (map (esApto_v2) listaDePlanetas)


-- La maxima distancia a la nave

maximaDistanciaANave :: [Planeta] -> Nave -> Float
maximaDistanciaANave listaDePlanetas nave = maximum (map (distanciaA_v2 nave) listaDePlanetas)


-- Hacer que todos lo planetas tengan un 10% mas de agua

aumentarAgua :: Planeta -> Planeta
aumentarAgua planeta = planeta {porcentajeDeAgua = (porcentajeDeAgua planeta) * 0.1 + porcentajeDeAgua planeta}

aumentarAguaAVarios :: [Planeta] -> [Planeta]
aumentarAguaAVarios planetas = map (aumentarAgua) planetas