class_name GameObject
extends Node

enum ACTOR_TYPE {NONE, ITEM, ACTOR}

@export var type: ACTOR_TYPE

## Position on the grid.
var position : Vector2i
## Offset of the sprite's position in tiles. Generally a decimal or zero.
var visible_offset : Vector2 = Vector2.ZERO
## The texture used for the sprite in rendering. Generally sliced up.
@export var spr : Texture
## Used to set [code]h_frames[/code] and [code]v_frames[/code] in the sprite spawned.
@export var frames : Vector2i
## The animations that will be used with the sprite. Should reference
## [code].[/code], a sprite, as the target of its animations.
@export var animations : AnimationLibrary

@export var states : Array[Script]

# String : State relationship
@onready var stateman := StateMachine.new()

## The board which this entity belongs to.
var _grid : GameBoard

## Indicates to the grid that it wants to move. The target is the relative position in tiles.
signal move(target: Vector2i)


func _ready() -> void:
	# await stateman.ready
	for state in states:
		var s := State.new()
		s.set_script(state)
		stateman.add_child(s)


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
		
