--club(Nombre, Ubicacion, Hinchas).

--club(boca,amba, 100).
--club(racing,amba, 80).
--club(nob,rosario, 50).
--club(godoy,mendoza, 5).
--club(central,rosario,60).
--club(velez, amba,5).
--club(lanus, amba,10).
--club(banfield, amba,4).



--tienePlata(velez).
--tienePlata(boca).

data Club = UnClub {
    nombre :: String,
    ubicacion :: String,
    hinchas :: Float
    }
    deriving Show

boca :: Club
boca = UnClub {
    nombre = "boca",
    ubicacion ="amba",
    hinchas = 100
    }

racing :: Club
racing = UnClub {
    nombre = "racing",
    ubicacion = "amba",
    hinchas = 80
    }

nob :: Club
nob  = UnClub {
    nombre = "nob",
    ubicacion = "rosario",
    hinchas = 50
    }

godoy :: Club
godoy  = UnClub {
    nombre = "godoy",
    ubicacion = "mendoza",
    hinchas = 5
    }

central :: Club
central = UnClub {
    nombre = "central",
    ubicacion = "rosario",
    hinchas = 60
    }

velez :: Club
velez = UnClub {
    nombre = "velez",
    ubicacion = "amba",
    hinchas = 5
    }

lanus :: Club
lanus = UnClub {
    nombre = "lanus",
    ubicacion = "amba",
    hinchas = 10
    }

banfield :: Club
banfield = UnClub {
    nombre = "banfield",
    ubicacion = "amba",
    hinchas = 4
    }

--tienePlata(velez).
--tienePlata(boca).

tienePlata :: Club -> Bool
tienePlata club = (nombre club == "boca") || (nombre club == "velez")

--clasico(central, nob).
--clasico(banfield, lanus).

clasico :: Club -> Club -> Bool
clasico unClub otroClub = (nombre unClub == "central") && (nombre otroClub == "nob") ||
                          (nombre unClub == "nob") && (nombre otroClub == "central") ||
                          (nombre unClub == "banfield") && (nombre otroClub == "lanus") ||
                          (nombre unClub == "lanus") && (nombre otroClub == "banfield")


listaClubes :: [Club]
listaClubes = [boca,racing,nob,godoy,central,velez,lanus,banfield]



-- Resolucion punto 1)

esGrande :: Club -> Bool
esGrande club = ((ubicacion club) == "amba") && (tienePlata club)

noEsGrande :: Club -> Bool
noEsGrande club = not (esGrande club)

tieneMasHinchas :: Club -> Club -> Bool
tieneMasHinchas unClub otroClub = hinchas unClub > hinchas otroClub

--clubPopular(Equipo) :-
  --  club(Equipo,_,_),
   -- noEsGrande(Equipo),
   -- club(OtroEquipo,_,_),
   -- esGrande(OtroEquipo),
   -- tieneMasHinchas(Equipo,OtroEquipo).

--clubPopular(Equipo) :-
   -- club(Equipo,_,_),
 --   esGrande(Equipo),
   -- forall(noEsGrande(OtroEquipo),tieneMasHinchas(Equipo,OtroEquipo)).

--clubPopular club = noEsGrande club && (map (tieneMasHinchas club) (filter (esGrande) listaClubes))

clubPopular :: Club -> Bool
clubPopular club = noEsGrande club && not (null (filter (tieneMasHinchas club) (filter (esGrande) listaClubes)))
                || esGrande club && all (tieneMasHinchas club) (filter (noEsGrande) listaClubes)


-- Resolucion punto 2)
hacerPublicidad :: Club -> Club
hacerPublicidad club = club {hinchas = 0.05 * hinchas club + hinchas club}

                                --NOTA: Se que debería redondear el numero para que me de un entero,
                                --pero no recuerdo esa funcion de haskell. Probé con round, pero no funciona.
                                --Para salir del paso, los hinchas de un club son de tipo Float.
                                --Continúo para no perder más tiempo.


mudarClub :: String -> Club -> Club
mudarClub nuevaUbicacion club = club {
    ubicacion = nuevaUbicacion,
    hinchas = fromIntegral (length nuevaUbicacion) / 100 + hinchas club
    }

tirarMaiz :: Float -> Club -> Club
tirarMaiz cantidad club
    |elem 'v' (nombre club) = club {hinchas = 10 * cantidad + hinchas club}
    |otherwise = club {hinchas = max (10 * cantidad - hinchas club) 0}

darApoyo :: Club -> Club -> Club
darApoyo unClub otroClub = unClub {hinchas = hinchas unClub + hinchas otroClub}


miIniciativa :: Club -> Club
miIniciativa = (mudarClub "mendoza").darApoyo godoy

-- Resolucion punto 3)
mayorHinchadaAlAplicarIniciativa :: Club -> Club -> (Club -> Club) -> String
mayorHinchadaAlAplicarIniciativa unClub otroClub iniciativa
    |hinchas (iniciativa unClub) > hinchas (iniciativa otroClub) = nombre unClub
    |otherwise = nombre otroClub

-- Resolucion punto 4)


