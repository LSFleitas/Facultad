TRAP_STATE = -1
RESULT_TRAP = "RESULT_TRAP"
RESULT_ACCEPTED = "RESULT_ACCEPTED"
RESULT_NOT_ACCEPTED = "RESULT_NOT_ACCEPTED"

def automata_PuntoYComa(input):
	state = 0
	final = 1

	def delta(state, caracter):
		if state == 0 and caracter == ";":
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

assert automata_PuntoYComa("") == RESULT_NOT_ACCEPTED

assert automata_PuntoYComa(";") ==RESULT_ACCEPTED

assert automata_PuntoYComa(";;") == RESULT_TRAP