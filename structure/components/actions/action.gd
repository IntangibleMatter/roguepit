class_name Action
extends Node

@export var action_title : String = ""

## Runs the action. The bool indicates whether the action succeeded in running.
## Defaults to returning false, as an empty action doesn't run.
func run(params: Dictionary) -> bool:
	return false