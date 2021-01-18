TRAP_STATE = -1
RESULT_TRAP = "RESULT_TRAP"
RESULT_ACCEPTED = "RESULT_ACCEPTED"
RESULT_NOT_ACCEPTED = "RESULT_NOT_ACCEPTED"

def automata_Aceptar(input):
	state = 0
	final = 7

	def delta(state, caracter):
		if state == 0 and caracter == "a":
			return 1
		if state == 1 and caracter == "c":
			return 2
		if state == 2 and caracter == "e":
			return 3
		if state == 3 and caracter == "p":
			return 4
		if state == 4 and caracter == "t":
			return 5
		if state == 5 and caracter == "a":
			return 6
		if state == 6 and caracter == "r":
			return 7
		return TRAP_STATE

	for caracter in input:
		next_state = delta(state, caracter)
		state = next_state

	if state == final:
		return RESULT_ACCEPTED
	if state == TRAP_STATE:
		return RESULT_TRAP
	return RESULT_NOT_ACCEPTED

assert automata_Aceptar("a") == RESULT_NOT_ACCEPTED
assert automata_Aceptar("ac") == RESULT_NOT_ACCEPTED
assert automata_Aceptar("ace") == RESULT_NOT_ACCEPTED
assert automata_Aceptar("acep") == RESULT_NOT_ACCEPTED
assert automata_Aceptar("acept") == RESULT_NOT_ACCEPTED
assert automata_Aceptar("acepta") == RESULT_NOT_ACCEPTED

assert automata_Aceptar("aceptar") == RESULT_ACCEPTED

assert automata_Aceptar("acetar") == RESULT_TRAP
assert automata_Aceptar("acetar ") == RESULT_TRAP
assert automata_Aceptar("acceptar") == RESULT_TRAP

