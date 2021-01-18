TRAP_STATE = -1
RESULT_TRAP = "RESULT_TRAP"
RESULT_ACCEPTED = "RESULT_ACCEPTED"
RESULT_NOT_ACCEPTED = "RESULT_NOT_ACCEPTED"

def automata_Mostrar(input):
	state = 0
	final = 7

	def delta(state, caracter):
		if state == 0 and caracter == "m":
			return 1
		if state == 1 and caracter == "o":
			return 2
		if state == 2 and caracter == "s":
			return 3
		if state == 3 and caracter == "t":
			return 4
		if state == 4 and caracter == "r":
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

assert automata_Mostrar("m") == RESULT_NOT_ACCEPTED
assert automata_Mostrar("mo") == RESULT_NOT_ACCEPTED
assert automata_Mostrar("mos") == RESULT_NOT_ACCEPTED
assert automata_Mostrar("most") == RESULT_NOT_ACCEPTED
assert automata_Mostrar("mostr") == RESULT_NOT_ACCEPTED
assert automata_Mostrar("mostra") == RESULT_NOT_ACCEPTED

assert automata_Mostrar("mostrar") == RESULT_ACCEPTED

assert automata_Mostrar("Mostrar") == RESULT_TRAP
assert automata_Mostrar(" mostrar") == RESULT_TRAP