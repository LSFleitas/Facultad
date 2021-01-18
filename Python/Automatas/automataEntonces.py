TRAP_STATE = -1
RESULT_TRAP = "RESULT_TRAP"
RESULT_ACCEPTED = "RESULT_ACCEPTED"
RESULT_NOT_ACCEPTED = "RESULT_NOT_ACCEPTED"

def automata_Entonces(input):
	state = 0
	final = 8

	def delta(state, caracter):
		if state == 0 and caracter == "e":
			return 1
		if state == 1 and caracter == "n":
			return 2
		if state == 2 and caracter == "t":
			return 3
		if state == 3 and caracter == "o":
			return 4
		if state == 4 and caracter == "n":
			return 5
		if state == 5 and caracter == "c":
			return 6
		if state == 6 and caracter == "e":
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

assert automata_Entonces("e") == RESULT_NOT_ACCEPTED
assert automata_Entonces("en") == RESULT_NOT_ACCEPTED
assert automata_Entonces("ent") == RESULT_NOT_ACCEPTED
assert automata_Entonces("ento") == RESULT_NOT_ACCEPTED
assert automata_Entonces("enton") == RESULT_NOT_ACCEPTED
assert automata_Entonces("entonc") == RESULT_NOT_ACCEPTED
assert automata_Entonces("entonce") == RESULT_NOT_ACCEPTED

assert automata_Entonces("entonces") == RESULT_ACCEPTED

assert automata_Entonces("enntonces") == RESULT_TRAP
assert automata_Entonces("Entonces") == RESULT_TRAP