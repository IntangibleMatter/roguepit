class_name GameObjectResource
extends Resource

enum ACTOR_TYPE {ANY = -1, NONE, ITEM, ACTOR, PROJECTILE}

@export var scene : PackedScene

@export var type: ACTOR_TYPE

@export var actions : Array[ActionHolder]

class ActionHolder:
	extends Resource
	@export var title : String
	@export var scr : Script
