extends Node

const ID = "_id"
const SPELL = "spell"

const BERSERK = 0
const FIREBALL = 1
const COUNTER = 2
const SPLIT = 3

func get_defaults(spell: int = -1) -> Dictionary:
	if spell == -1:
		return {
			ID: null,
			SPELL: null,
		}
	else:
		return {
			ID: null,
			SPELL: spell,
		}