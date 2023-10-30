class_name GameObjectResource
extends Resource

enum ACTOR_TYPE {NONE, ITEM, ACTOR}

@export var scene : PackedScene

@export var type: ACTOR_TYPE

@export var actions : Array[Script]
