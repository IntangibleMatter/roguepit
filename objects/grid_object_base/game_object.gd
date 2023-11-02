class_name GameObject
extends Node

@export var actor_resource : GameObjectResource

@export var type: GameObjectResource.ACTOR_TYPE = GameObjectResource.ACTOR_TYPE.NONE

## Position on the grid. Should always be synced with position in the grid's objects Dict.
var position : Vector2i

@export var actions : Dictionary # <String:Action>
var last_action : String

## The board which this entity belongs to.
var _grid : GameBoard

var virtual : GameObjectVirtual

## Indicates to the grid that it wants to move. The target is the relative position in tiles.
signal moved(target: Vector2i)


func _ready() -> void:
	# await stateman.ready
	for state in actions:
		var s := State.new()
		s.set_script(state)


func create(from: GameObjectResource, virt: GameObjectVirtual) -> void:
	actor_resource = from
	virtual = virt
	actions = create_actions(from.actions)


func create_actions(s: Array[GameObjectResource.ActionHolder]) -> Dictionary:
	var tempactions : Dictionary
	for script in s:
		tempactions[script.title] = create_action(script.scr)
	return tempactions


func create_action(scr: Script) -> Action:
	var s : Action
	if scr.can_instantiate():
		s = scr.new()
	else:
		push_error("ERROR: Script {} could not be instantiated.".format(scr))
		s = Action.new()
	return s


func update() -> void:
	pass


func checkmove(target: Vector2i) -> bool:
	if not type == GameObjectResource.ACTOR_TYPE.PROJECTILE:
		if _grid.check_tile(target) <= 0:
			return false
	return _grid.move_object(self, position, target)


func move(target: Vector2i) -> void:
	if not checkmove(target):
		print("Err: {0} trying to move to {1}, but can't.".format([self, target]))
		return
	virtual.move(target, actions[last_action].get_animation())


#func checkpos(target: Vector2i, check_floor : bool = true) -> bool:
#	if not _grid.updated_objects.has(position + target):
#		if check_floor:
#			return _grid.check_tile(position + target) > 0
#		return true
#	else:
#		return _grid.check_position(target, type) == null
