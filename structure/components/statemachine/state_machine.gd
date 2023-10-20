class_name StateMachine
extends Node


signal transitioned(state_name: String)

@export var initial_state : NodePath

@onready var state : State = get_node(initial_state)

func _ready() -> void:
	await owner.ready
	
	# owner.add_to_group("has_statemachine")
	
	for child in get_children():
		child.state_machine = self
	
	state.enter()


func update() -> void:
	state.update()


func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)


func _process(delta: float) -> void:
	state.d_update(delta)


func _physics_process(delta: float) -> void:
	state.physics_update(delta)


func transition_to(target_state : String, msg: Dictionary = {}) -> void:
	# Just gotta check that the state exists lol
	if not has_node(target_state):
		return
	print(target_state)
	prints("msg", msg)
	state.exit()
	state = get_node(target_state)
	state.enter(msg)

	emit_signal("transitioned", state.name)

