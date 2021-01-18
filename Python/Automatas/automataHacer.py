TRAP_STATE = -1
RESULT_TRAP = "RESULT_TRAP"
RESULT_ACCEPTED = "RESULT_ACCEPTED"
RESULT_NOT_ACCEPTED = "RESULT_NOT_ACCEPTED"

def automata_Hacer(input):
	state = 0
	final = 5

	def delta(state, caracter):
		if state == 0 and caracter == "h":
			return 1
		if state == 1 and caracter == "a":
			return 2
		if state == 2 and caracter == "c":
			return 3
		if state == 3 and caracter == "e":
			return 4
		if state == 4 and caracter == "r":
			return 5
		return TRAP_STATE

	for caracter in input:
		next_state = delta(state, caracter)
		state = next_state

	if state == final:
		return RESULT_ACCEPTED
	if state == TRAP_STATE:
		return RESULT_TRAP
	return RESULT_NOT_ACCEPTED

assert automata_Hacer("h") == RESULT_NOT_ACCEPTED
assert automata_Hacer("ha") == RESULT_NOT_ACCEPTED
assert automata_Hacer("hac") == RESULT_NOT_ACCEPTED
assert automata_Hacer("hace") == RESULT_NOT_ACCEPTED

assert automata_Hacer("hacer") == RESULT_ACCEPTED

assert automata_Hacer("Hacer") == RESULT_TRAP
assert automata_Hacer("hacerr") == RESULT_TRAP
assert automata_Hacer(" hacer") == RESULT_TRAP
