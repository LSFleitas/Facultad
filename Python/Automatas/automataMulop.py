TRAP_STATE = -1
RESULT_TRAP = "RESULT_TRAP"
RESULT_ACCEPTED = "RESULT_ACCEPTED"
RESULT_NOT_ACCEPTED = "RESULT_NOT_ACCEPTED"


def automata_Mulop(input):
	state = 0
	final = 4

	def delta(state, caracter):
		if state == 0 and caracter == "a":
			return 1
		if state == 0 and caracter == "m":
			return 2
		if state == 0 and ( caracter == "*" or caracter == "/" ):
			return 4
		if state == 1 and caracter == "n":
			return 3
		if state == 2 and caracter == "o":
			return 3
		if state == 3 and caracter == "d":
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


assert automata_Mulop("*") == RESULT_ACCEPTED
assert automata_Mulop("/") == RESULT_ACCEPTED
assert automata_Mulop("mod") == RESULT_ACCEPTED
assert automata_Mulop("and") == RESULT_ACCEPTED

assert automata_Mulop("a") == RESULT_NOT_ACCEPTED
assert automata_Mulop("an") == RESULT_NOT_ACCEPTED
assert automata_Mulop("m") == RESULT_NOT_ACCEPTED
assert automata_Mulop("mo") == RESULT_NOT_ACCEPTED

assert automata_Mulop("modd") == RESULT_TRAP
assert automata_Mulop("modand") == RESULT_TRAP
assert automata_Mulop("/*") == RESULT_TRAP

