class_name GameObjectVirtual
extends Sprite2D

enum ACTOR_TYPE {NONE, ITEM, ACTOR}

@export var type: GameObject.ACTOR_TYPE

var controller: GameObject

func animate(animation: String) -> void:
	pass

func move(target: Vector2i, params: Dictionary) -> void:
	pass
