TRAP_STATE = -1
RESULT_TRAP = "RESULT_TRAP"
RESULT_ACCEPTED = "RESULT_ACCEPTED"
RESULT_NOT_ACCEPTED = "RESULT_NOT_ACCEPTED"

def automata_Sino(input):
	state = 0
	final = 4

	def delta(state, caracter):
		if state == 0 and caracter == "s":
			return 1
		if state == 1 and caracter == "i":
			return 2
		if state == 2 and caracter == "n":
			return 3
		if state == 3 and caracter == "o":
			return 4
		return TRAP_STATE

	for caracter in input:
		next_state = delta(state, caracter)
		state = next_state

	if state == final:
		return RESULT_ACCEPTED
	if state == TRAP_STATE:
		return RESULT_TRAP
	return RESULT_NOT_ACCEPTED

assert automata_Sino("s") == RESULT_NOT_ACCEPTED
assert automata_Sino("si") == RESULT_NOT_ACCEPTED
assert automata_Sino("sin") == RESULT_NOT_ACCEPTED

assert automata_Sino("sino") == RESULT_ACCEPTED

assert automata_Sino("Sino") == RESULT_TRAP
assert automata_Sino(" sino") == RESULT_TRAP