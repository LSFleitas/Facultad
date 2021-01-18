import lexer

#Declaracion de los terminales, no terminales y producciones de la gramática dada

#"x := 3"

# Prog -> Sent -> ID := Expresion Sentencia* -> ID := numero Expresion* Sentencia* -> ID := numero Sentencia* -> ID := numero 
producciones = {
    'Programa': [
                ['Declaracion',';','Sentencia'],
                ['Sentencia']
    ],
    'Declaracion': [
                   ['Sentencia','Declaracion*']
    ],
    'Declaracion*': [
                    [';','Declaracion','Declaracion*'],
                    []
    ],
    'Sentencia': [
                 ['ID',':=','Expresion','Sentencia*'],
                 ['si','Expresion','entonces','Sentencia','sino','Sentencia','Sentencia*'],
                 ['si','Expresion','entonces','Sentencia','Sentencia*'],
                 ['mientras','Expresion','hacer','Sentencia','Sentencia*']
    ],
    'Sentencia*': [
                  [';','Sentencia','Sentencia*'],
                  []
    ],
    'Expresion': [
                 ['string','Expresion*'],
                 ['numero','Expresion*'],
                 ['ID','Expresion*'],
                 ['aceptar','string','ID','Expresion*'],
                 ['mostrar','string','ID','Expresion*']
    ],
    'Expresion*': [
                  ['OP','Expresion','Expresion*'],
                  ['[','Expresion',']','Expresion*'],
                  ['(','Expresion',')','Expresion*'],
                  []
    ],
    'ListaIdentificadores': [
                            ['ID'],
                            ['ID',',','ListaIdentificadores']
    ]
}

no_terminales = [
                 'Programa',
                 'Declaracion',
                 'Declaracion*',
                 'Sentencia',
                 'Sentencia*',
                 'Expresion',
                 'Expresion*',
                 'ListaIdentificadores'
]

terminales = [
            ';',
            ':=',
            'OP',
            'si',
            'entonces',
            'sino',
            'mientras',
            'hacer',
            '[',
            ']',
            '(',
            ')',
            'aceptar',
            'mostrar',
            ',',
            'string',
            'numero',
            'ID'
]

#Funcion Parser

def Parser(inputString):
    self = {
        'tokens':lexer.lexer(inputString),
        'index':0,
        'error':False
    }

    def tipoTokenActual():
        token_actual = self['tokens'][self['index']]
        return token_actual[0]

    print(self['tokens'])
    print(self['index'])
    print(self['error'])

    def identar():
        x = '---'
        for i in range(self['index']):
            x += '---'
        x += str(self['index']) + '---'
        return x




    def pni(noTerminal):
        for parteDerecha in producciones[noTerminal]:

            print('')
            print(identar(), 'ERROR ANTES DE PROCESAR: ', self['error'])

            self['error'] = False
            print(identar(), 'SETEO ERROR EN FALSO')
            backtrack_pivot = self['index']

            print(identar(), noTerminal, '-->',parteDerecha)

            procesar(parteDerecha)

            print(identar(), 'ERROR DESPUES DE PROCESAR: ', self['error'])

            if self['error']:
                print(identar(), 'BACKTRACKING')
                self['index'] = backtrack_pivot
            else:
                break


    def procesar(derecha):
        for symbol in derecha:
            print(identar(),'PROCESANDO ', symbol, ' DE ', derecha, 'PARA EL TIPO ',tipoTokenActual())
            if symbol in terminales:
                if symbol == tipoTokenActual():
                    self['index'] += 1
                else:
                    self['error'] = True
                    break
            if symbol in no_terminales:
                pni(symbol)
                if self['error']:
                    break
    def parse():
        pni('Programa')



        if self['error'] == False and tipoTokenActual() == 'EOF':
            return True
        else:
            return False
    return parse()

#assert(Parser("x := 3"))
#assert(Parser("largo := 10; ancho := 20"))
#assert(Parser("x := largo >= ancho"))
#assert(Parser("x := largo >= ancho"))
#assert(Parser("x := largo >= funcionSobre(ancho)"))
#assert(Parser("x := largo == arrayDeDatos[6521]"))
#assert(Parser("mientras x == 3 hacer var := funcionSobre(ancho) + funcionSobre(largo)"))
#assert(Parser("si x != 3 entonces y := x + 1 sino y := x mod 3"))

print(Parser("x := 'y' ; z := 'w'"))