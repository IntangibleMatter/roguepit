class_name GameObjectVirtual
extends Sprite2D

enum ACTOR_TYPE {NONE, ITEM, ACTOR}

@export var type: GameObject.ACTOR_TYPE

var animator : AnimationPlayer

func _ready() -> void:
	animator = AnimationPlayer.new()
	add_child(animator)
