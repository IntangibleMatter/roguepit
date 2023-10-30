class_name GameObject
extends Node

enum ACTOR_TYPE {NONE, ITEM, ACTOR}

@export var actor_resource : GameObjectResource

@export var type: ACTOR_TYPE

## Position on the grid.
var position : Vector2i

@export var actions : Dictionary # <String:Action>

## The board which this entity belongs to.
var _grid : GameBoard

var virtual : GameObjectVirtual

## Indicates to the grid that it wants to move. The target is the relative position in tiles.
signal move(target: Vector2i)


func _ready() -> void:
	# await stateman.ready
	for state in actions:
		var s := State.new()
		s.set_script(state)

func create(from: GameObjectResource, virt: GameObjectVirtual) -> void:
	actor_resource = from
	virtual = virt
	create_actions(from.actions)

func create_actions(s: Array[Script]) -> Array[State]:
	var tempstates : Array[State]
	for script in s:
		tempstates.append(add_action(script))
	return tempstates



func add_action(state: Script) -> State:
	var s := State.new()
	s.script = state
	return s



func update() -> void:
	stateman.update()


func trymove(target: Vector2i) -> void:
	emit_signal("move", target)


func checkpos(target: Vector2i, check_floor : bool = true) -> bool:
	if not _grid.objects.has(position + target):
		if check_floor:
			return _grid.check_tile(position + target) > 0
		return true
	else:
		return _grid.objects[position + target].type == type
