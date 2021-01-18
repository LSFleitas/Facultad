TRAP_STATE = -1
RESULT_TRAP = "RESULT_TRAP"
RESULT_ACCEPTED = "RESULT_ACCEPTED"
RESULT_NOT_ACCEPTED = "RESULT_NOT_ACCEPTED"

def automata_Numero(input):
	state = 0
	final1 = 1
	final2 = 3

	def delta(state, caracter):
		if state == 0 and caracter.isdigit() and float(caracter) in range(0,10):
			return 1
		if state == 1 and caracter.isdigit() and float(caracter) in range(0,10):
			return 1
		if state == 1 and caracter == ".":
			return 2
		if state == 2 and caracter.isdigit() and float(caracter) in range(0,10):
			return 3
		if state == 3 and caracter.isdigit() and float(caracter) in range(0,10):
			return 3
		return TRAP_STATE


	for caracter in input:
		next_state = delta(state, caracter)
		state = next_state

	if state == final1 or state == final2:
		return RESULT_ACCEPTED
	if state == TRAP_STATE:
		return RESULT_TRAP
	return RESULT_NOT_ACCEPTED

assert automata_Numero("9879123") == RESULT_ACCEPTED
assert automata_Numero("9879123.9879123") == RESULT_ACCEPTED

assert automata_Numero("9879123.") == RESULT_NOT_ACCEPTED

assert automata_Numero("9879123.9879123.9879123") == RESULT_TRAP
assert automata_Numero(".") == RESULT_TRAP


