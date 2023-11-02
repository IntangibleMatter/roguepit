class_name Action
extends Node

@export var action_title : String = ""

## Runs the action. The bool indicates whether the action succeeded in running.
## Defaults to returning false, as an empty action doesn't run.
func run(params: Dictionary) -> bool:
	return false

## Defines the animations that should be used for the action. The animation used
## while the action plays should be under the key `"anim"`, and will continue playing
## unless an animation is defined under the key `"anim_end"`.
func get_animation() -> Dictionary:
	return {}
