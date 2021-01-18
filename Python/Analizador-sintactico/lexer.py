import Automatas.automataAceptar #.automata_Aceptar
import Automatas.automataBrackOpen #.automata_BrackOpen
import Automatas.automataBrackClose #.automata_BrackClose
import Automatas.automataDosPuntosIgual #.automata_DosPuntosIgual
import Automatas.automataEntonces #.automata_Entonces
import Automatas.automataHacer #.automata_Hacer
import Automatas.automataIdentificador #.automata_Identificador
import Automatas.automataLiteral #.automata_Literal
import Automatas.automataMientras #.automata_Mientras
import Automatas.automataMostrar #.automata_Mostrar
import Automatas.automataMulop #.automata_Mulop
import Automatas.automataRelop #.automata_Relop
import Automatas.automataSumop #.automata_Sumop
import Automatas.automataNumero #.automata_Numero
import Automatas.automataParOpen #.automata_ParOpen
import Automatas.automataParClose #.automata_ParClose
import Automatas.automataPuntoYComa #.automata_PuntoYComa
import Automatas.automataSi #.automata_Si
import Automatas.automataSino #.automata_Sino
import Automatas.automataComa #.automata_Coma

TRAP_STATE = -1
RESULT_TRAP = "RESULT_TRAP"
RESULT_ACCEPTED = "RESULT_ACCEPTED"
RESULT_NOT_ACCEPTED = "RESULT_NOT_ACCEPTED"

# DEFINO UNA LISTA DE TUPLA EN LA QUE CADA TUPLA CONTIENE COMO PRIMER ELEMENTO UN
# TIPO DE TOKEN Y EL AUTOMATA "ASOCIADO" A ESE TIPO DE TOKEN. 

TOKEN_CONFIG = [
  ("[", Automatas.automataBrackOpen.automata_BrackOpen),
  ("]", Automatas.automataBrackClose.automata_BrackClose),
  ("(", Automatas.automataParOpen.automata_ParOpen),
  (")", Automatas.automataParClose.automata_ParClose),
  (";", Automatas.automataPuntoYComa.automata_PuntoYComa),
  (":=", Automatas.automataDosPuntosIgual.automata_DosPuntosIgual),
  (",", Automatas.automataComa.automata_Coma),
  ("OP", Automatas.automataMulop.automata_Mulop),
  ("OP",Automatas.automataRelop.automata_Relop),
  ("OP", Automatas.automataSumop.automata_Sumop),
  ("numero", Automatas.automataNumero.automata_Numero),
  ("si", Automatas.automataSi.automata_Si),
  ("sino", Automatas.automataSino.automata_Sino),
  ("hacer", Automatas.automataHacer.automata_Hacer),
  ("string", Automatas.automataLiteral.automata_Literal),
  ("aceptar", Automatas.automataAceptar.automata_Aceptar),
  ("mostrar", Automatas.automataMostrar.automata_Mostrar),
  ("mientras", Automatas.automataMientras.automata_Mientras),
  ("entonces", Automatas.automataEntonces.automata_Entonces),
  ("ID", Automatas.automataIdentificador.automata_Identificador)
]

# FUNCION QUE RECIBE COMO INPUT UN STRING Y RETORNA UNA TUPLA, QUE TIENE COMO
# PRIMER ELEMENTO UN BOOLEANO Y COMO SEGUNDO ELEMENTO EL TIPO DE TOKEN CON EL 
# QUE SE CLASIFICA AL INPUT. 

def calcCandidates(source):
  allTrapped = True
  candidates = []
  #print("**********************************************************************")
  for (token_kind, automata) in TOKEN_CONFIG:
    result = automata(source)
    #print("********************************************************************")
    #print("ALLTRAPPED: ", allTrapped)
    #print("TOKEN_KIND: ", token_kind)
    #print("AUTOMATA: ", automata)
    #print("RESULT: ", result)


    if result == RESULT_ACCEPTED:
      allTrapped = False
      candidates.append(token_kind)
      #print("CANDIDATES: ", candidates)
    if result == RESULT_NOT_ACCEPTED:
      allTrapped = False


  if len(candidates) == 0:
    return ((allTrapped, []))

  #print("SOURCE: ", source)
  #print("token_kind: ", candidates[0])
  #print("**********************************************************************")
  return ((allTrapped, candidates[0]))

# FUNCION "PRINCIPAL" DEL LEXER:
# RECIBE UN STRING COMO INPUT Y DEVUELVE UNA LISTA DE TUPLAS,
# CADA TUPLA SE LLAMA "TOKEN",
# EL PRIMER ELEMENTO DEL TOKEN ES EL TIPO DE TOKEN,
# EL SEGUNDO ELEMENTO ES EL LEXEME.

# EL LEXEME ES UNA PALABRA QUE ESTA CONTENIDA EN EL INPUT,
# EL TIPO DE TOKEN ES LA CLASIFICACION QUE LE CORRESPONDE A ESA PALABRA SEGUN LA GRAMATICA DADA.

def lexer(source):
  source +=" "
  index = 0
  tokens = []

  while index < len(source):
    if source[index] == " ":
      index += 1
      continue

    #print("INDEX COMIENZA EN: ", index)
    candidates = []
    start = index

    while True:
      next = calcCandidates(source[start:index + 1])
      #print("CANDIDATOS: ", next[1])
      if next[0]:
        break

      candidates = next[1]
      #print("CANDIDATOS: ", candidates)
      index += 1

    if len(candidates) == 0:
      candidates = "TOKEN_DESCONOCIDO"

    token_kind = candidates
    lexeme = source[start:index]
    token = ((token_kind, lexeme))

    tokens.append(token)
  # AGREGO UN ULTIMO TOKEN QUE SIEMPRE DEBE ESTAR EN LA LISTA DE TOKEN: ("EOF", "EOF")
  tokens.append(("EOF", "EOF"))
  #print("SOURCE: ", source)
  #print(tokens)    #( DESCOMENTAR PARA MOSTRAR POR CONSOLA LA LISTA DE TOKENS QUE
  #                  DEVUELVE CADA LLAMADA A LA FUNCION lexer )
  return tokens

assert lexer("1 + edad") == [("numero","1"), ("OP","+"), ("ID","edad"), ("EOF", "EOF")]
assert lexer("mientras ALGO hacer") == [("mientras","mientras"),("ID","ALGO"),("hacer","hacer"), ("EOF", "EOF")]
assert lexer("hola >= si") == [("ID","hola"), ("OP",">="), ("si","si"), ("EOF", "EOF")]
assert lexer("(chau)") == [("(","("), ("ID","chau"), (")",")"), ("EOF", "EOF")]
assert lexer("'queremos' and aprobar") == [("string","'queremos'"), ("OP","and"), ("ID","aprobar"), ("EOF", "EOF")]
assert lexer("minimo 1 ocho") == [("ID","minimo"), ("numero","1"), ("ID","ocho"), ("EOF", "EOF")]
assert lexer("or 1 diez 'jeje'") == [("OP","or"), ("numero","1"), ("ID","diez"), ("string","'jeje'"), ("EOF", "EOF")]
assert lexer("by the way 'xdxd'") == [("ID","by"), ("ID","the"), ("ID","way"), ("string","'xdxd'"), ("EOF", "EOF")]
assert lexer("ocho <= 8.5") == [("ID","ocho"), ("OP","<="), ("numero","8.5"), ("EOF", "EOF")]
assert lexer("diez := 10;") == [("ID","diez"), (":=",":="), ("numero","10"), (";",";"), ("EOF", "EOF")] 
assert lexer("sino si [no se]") == [("sino","sino"), ("si","si"), ("[","["), ("ID","no"), ("ID","se"), ("]","]"), ("EOF", "EOF")]
assert lexer(":== ") == [(":=", ":="), ("TOKEN_DESCONOCIDO","="), ("EOF", "EOF")]

#calcCandidates("mientras")
#calcCandidates("ALGO")
#calcCandidates("hacer")