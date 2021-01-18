TRAP_STATE = -1
RESULT_TRAP = "RESULT_TRAP"
RESULT_ACCEPTED = "RESULT_ACCEPTED"
RESULT_NOT_ACCEPTED = "RESULT_NOT_ACCEPTED"

def automata_Mientras(input):
	state = 0
	final = 8

	def delta(state, caracter):
		if state == 0 and caracter == "m":
			return 1
		if state == 1 and caracter == "i":
			return 2
		if state == 2 and caracter == "e":
			return 3
		if state == 3 and caracter == "n":
			return 4
		if state == 4 and caracter == "t":
			return 5
		if state == 5 and caracter == "r":
			return 6
		if state == 6 and caracter == "a":
			return 7
		if state == 7 and caracter == "s":
			return 8
		return TRAP_STATE

	for caracter in input:
		next_state = delta(state, caracter)
		state = next_state

	if state == final:
		return RESULT_ACCEPTED
	if state == TRAP_STATE:
		return RESULT_TRAP
	return RESULT_NOT_ACCEPTED

assert automata_Mientras("m") == RESULT_NOT_ACCEPTED
assert automata_Mientras("mi") == RESULT_NOT_ACCEPTED
assert automata_Mientras("mie") == RESULT_NOT_ACCEPTED
assert automata_Mientras("mien") == RESULT_NOT_ACCEPTED
assert automata_Mientras("mient") == RESULT_NOT_ACCEPTED
assert automata_Mientras("mientr") == RESULT_NOT_ACCEPTED
assert automata_Mientras("mientra") == RESULT_NOT_ACCEPTED

assert automata_Mientras("mientras") == RESULT_ACCEPTED

assert automata_Mientras("Mientras") == RESULT_TRAP
assert automata_Mientras(" mientras") == RESULT_TRAP