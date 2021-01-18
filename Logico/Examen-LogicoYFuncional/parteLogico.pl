% Base de conocimiento

% club(Nombre, Ubicacion, Hinchas).
club(velez, amba,5).
club(boca,amba, 100).
club(racing,amba, 80).
club(nob,rosario, 50).
club(godoy,mendoza, 5).
club(central,rosario,60).
club(lanus, amba,10).
club(banfield, amba,4).

tienePlata(velez).
tienePlata(boca).

clasico(central, nob).
clasico(banfield, lanus).

% Resolucion punto 1)
esGrande(Equipo) :-
    club(Equipo,amba,_),
    tienePlata(Equipo).

cabezaDeGrupo(Equipo) :-
    esGrande(Equipo).

noEsGrande(Equipo) :-
    club(Equipo,_,_),
    not(esGrande(Equipo)).

interiorDelPais(Equipo) :-
    club(Equipo,Ubicacion,_),
    Ubicacion \= amba.

sonDistintos(V1,V2,V3,V4) :-
    V1 \= V2,
    V1 \= V3,
    V1 \= V4,
    V2 \= V3,
    V2 \= V4,
    V3 \= V4.

grupoValido(Equipo1,Equipo2,Equipo3,Equipo4) :-
    club(Equipo1,_,_),
    club(Equipo2,_,_),
    club(Equipo3,_,_),
    club(Equipo4,_,_),
    sonDistintos(Equipo1,Equipo2,Equipo3,Equipo4),
    cabezaDeGrupo(Equipo1),
    noEsGrande(Equipo2),
    interiorDelPais(Equipo3),
    not(clasico(Equipo4,Equipo2)),
    not(clasico(Equipo4,Equipo3)),
    not(clasico(Equipo2,Equipo4)),
    not(clasico(Equipo3,Equipo4)).

% Resolución punto 2)

tieneMasHinchas(UnEquipo, OtroEquipo) :-
    club(UnEquipo,_,Hinchada),
    club(OtroEquipo,_,OtraHinchada),
    Hinchada > OtraHinchada.

clubPopular(Equipo) :-
    club(Equipo,_,_),
    noEsGrande(Equipo),
    club(OtroEquipo,_,_),
    esGrande(OtroEquipo),
    tieneMasHinchas(Equipo,OtroEquipo).

clubPopular(Equipo) :-
    club(Equipo,_,_),
    esGrande(Equipo),
    forall(noEsGrande(OtroEquipo),tieneMasHinchas(Equipo,OtroEquipo)).

% Resolución punto 3)

ciudadDeUnEquipo(Ciudad) :-
    club(_,Ciudad,_).

ciudadImportante(Ciudad) :-
    ciudadDeUnEquipo(Ciudad),
    forall(club(Equipo,Ciudad,_),clubPopular(Equipo)).

% Resolución punto 4)

% ---------------------Ejemplos de consulta de grupoValido verdaderos

%?- grupoValido(Equipo1,Equipo2,Equipo3,Equipo4).
%Equipo1 = velez,
%Equipo2 = racing,
%Equipo3 = nob,
%Equipo4 = boca ;
%Equipo1 = velez,
%Equipo2 = racing,
%Equipo3 = nob,
%Equipo4 = godoy ;
%Equipo1 = velez,
%Equipo2 = racing,
%Equipo3 = nob,
%Equipo4 = lanus ;

% ---------------------Ejemplos de consulta de grupoValido falsos

%?- grupoValido(boca,banfield,central,nob).
%false.

%?- grupoValido(boca,banfield,central,lanus). 
%false.

%?- grupoValido(boca,lanus,central,banfield). 
%false.

%?- grupoValido(boca,godoy,godoy,boca). 
%false.

% ---------------------Ejemplos de consulta de clubPopular verdaderos

%?- clubPopular(Equipo).
%Equipo = racing ;
%Equipo = nob ;
%Equipo = central ;
%Equipo = lanus ;
%Equipo = boca ;
%false.

% ---------------------Ejemplos de consulta de clubPopular falsos

%?- clubPopular(velez).
%false.

%?- clubPopular(godoy).
%false.

%?- clubPopular(banfield).
%false.

% ---------------------Ejemplos de consulta de ciudadImportante verdaderos.

%?- ciudadImportante(Ciudad).
%Ciudad = rosario ;
%Ciudad = rosario ;
%false.

% ---------------------Ejemplos de consulta de ciudadImportante falsos.

%?- ciudadImportante(amba).
%false.

%?- ciudadImportante(mendoza).
%false.

% Resolución punto 5)

% Por la forma en la que definí los predicados principales, que a propósito busqué que sean inversibles para facilitar las
%consultas en consola, justamente todos son inversibles ya que puedo usar todos los predicados tanto para preguntar si un
%determinado "elemento" lo verifica, como también para averiguar cuales son todos los "elementos" que lo verifican,
%utilizando una variable, un elemento genérico, en lugar de un elemento determinado.