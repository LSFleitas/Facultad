TRAP_STATE = -1
RESULT_TRAP = "RESULT_TRAP"
RESULT_ACCEPTED = "RESULT_ACCEPTED"
RESULT_NOT_ACCEPTED = "RESULT_NOT_ACCEPTED"

def automata_Si(input):
	state = 0
	final = 2

	def delta(state, caracter):
		if state == 0 and caracter == "s":
			return 1
		if state == 1 and caracter == "i":
			return 2
		return TRAP_STATE

	for caracter in input:
		next_state = delta(state, caracter)
		state = next_state

	if state == final:
		return RESULT_ACCEPTED
	if state == TRAP_STATE:
		return RESULT_TRAP
	return RESULT_NOT_ACCEPTED

assert automata_Si("s") == RESULT_NOT_ACCEPTED

assert automata_Si("si") == RESULT_ACCEPTED

assert automata_Si("Si") == RESULT_TRAP
assert automata_Si(" si") == RESULT_TRAP