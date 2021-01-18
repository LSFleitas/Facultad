TRAP_STATE = -1
RESULT_TRAP = "RESULT_TRAP"
RESULT_ACCEPTED = "RESULT_ACCEPTED"
RESULT_NOT_ACCEPTED = "RESULT_NOT_ACCEPTED"

def delta(state,caracter):
	if state == 0 and ( caracter == ">" or caracter == "<" ):
		return 1
	if state == 0 and ( caracter == "=" or caracter == "!" ):
		return 2
	if state == 1 and caracter == "=":
		return 3
	if state == 2 and caracter == "=":
		return 3
	return TRAP_STATE


def automata_Relop(input):
	state = 0
	final1 = 1
	final2 = 3

	for caracter in input:
		next_state = delta(state, caracter)
		state = next_state

	if state == final1 or state == final2:
		return RESULT_ACCEPTED
	if state == TRAP_STATE:
		return RESULT_TRAP
	return RESULT_NOT_ACCEPTED

assert automata_Relop("==") == RESULT_ACCEPTED
assert automata_Relop(">") == RESULT_ACCEPTED
assert automata_Relop("<") == RESULT_ACCEPTED
assert automata_Relop(">=") == RESULT_ACCEPTED
assert automata_Relop("<=") == RESULT_ACCEPTED
assert automata_Relop("!=") == RESULT_ACCEPTED

assert automata_Relop("=") == RESULT_NOT_ACCEPTED

assert automata_Relop(">-") == RESULT_TRAP
assert automata_Relop("</") == RESULT_TRAP
assert automata_Relop(">!=") == RESULT_TRAP
assert automata_Relop("<==") == RESULT_TRAP
assert automata_Relop("!==") == RESULT_TRAP
