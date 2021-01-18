TRAP_STATE = -1
RESULT_TRAP = "RESULT_TRAP"
RESULT_ACCEPTED = "RESULT_ACCEPTED"
RESULT_NOT_ACCEPTED = "RESULT_NOT_ACCEPTED"

def automata_Literal(input):
	state = 0
	final = 3

	def delta(state, caracter):
		if state == 0 and caracter == "'":
			return 1
		if state == 1 and caracter.isalpha():
			return 2
		if state == 2 and caracter.isalpha():
			return 2
		if state == 2 and caracter == "'":
			return 3
		return TRAP_STATE

	for caracter in input:
		next_state = delta(state, caracter)
		state = next_state

	if state == final:
		return RESULT_ACCEPTED
	if state == TRAP_STATE:
		return RESULT_TRAP
	return RESULT_NOT_ACCEPTED

assert automata_Literal("'") == RESULT_NOT_ACCEPTED
assert automata_Literal("'H") == RESULT_NOT_ACCEPTED
assert automata_Literal("'HolacOmOESTAS") == RESULT_NOT_ACCEPTED

assert automata_Literal("'HolacOmOESTAS'") == RESULT_ACCEPTED

assert automata_Literal("HOLAcOmOESTAS") == RESULT_TRAP
assert automata_Literal("HOLA'") == RESULT_TRAP
assert automata_Literal("'123'") == RESULT_TRAP