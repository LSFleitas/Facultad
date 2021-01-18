TRAP_STATE = -1
RESULT_TRAP = "RESULT_TRAP"
RESULT_ACCEPTED = "RESULT_ACCEPTED"
RESULT_NOT_ACCEPTED = "RESULT_NOT_ACCEPTED"

def automata_Identificador(input):
	state = 0
	final = 1

	def delta(state, caracter):
		if state == 0 and caracter.isalpha():
			return 1
		if state == 1 and ( caracter.isalpha() or (caracter.isdigit() and float(caracter) in range(0,10)) ):
			return 1
		return TRAP_STATE

	for caracter in input:
		next_state = delta(state, caracter)
		state = next_state


	if state == final:
		return RESULT_ACCEPTED
	if state == TRAP_STATE:
		return RESULT_TRAP
	return RESULT_NOT_ACCEPTED

assert automata_Identificador("edad") == RESULT_ACCEPTED
assert automata_Identificador("Hola") == RESULT_ACCEPTED
assert automata_Identificador("Como") == RESULT_ACCEPTED
assert automata_Identificador("Estas123") == RESULT_ACCEPTED

assert automata_Identificador("") == RESULT_NOT_ACCEPTED

assert automata_Identificador("1edad") == RESULT_TRAP
assert automata_Identificador("+ocho") == RESULT_TRAP
assert automata_Identificador("3menos4") == RESULT_TRAP
assert automata_Identificador("4lgun0") == RESULT_TRAP