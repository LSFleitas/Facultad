TRAP_STATE = -1
RESULT_TRAP = "RESULT_TRAP"
RESULT_ACCEPTED = "RESULT_ACCEPTED"
RESULT_NOT_ACCEPTED = "RESULT_NOT_ACCEPTED"

def automata_Sumop(input):
	state = 0
	final = 2

	
	def delta(state, caracter):
		if state == 0 and caracter == "o":
			return 1
		if state == 0 and ( caracter == "+" or caracter == "-" ):
			return 2
		if state == 1 and caracter == "r":
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


assert automata_Sumop("+") == RESULT_ACCEPTED
assert automata_Sumop("-") == RESULT_ACCEPTED
assert automata_Sumop("or") == RESULT_ACCEPTED

assert automata_Sumop("o") == RESULT_NOT_ACCEPTED

assert automata_Sumop("oo") == RESULT_TRAP
assert automata_Sumop("orr") == RESULT_TRAP
assert automata_Sumop("++") == RESULT_TRAP
assert automata_Sumop("--") == RESULT_TRAP
assert automata_Sumop("and") == RESULT_TRAP