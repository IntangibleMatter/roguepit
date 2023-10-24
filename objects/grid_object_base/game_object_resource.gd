class_name GameObjectResource
extends Resource

enum ACTOR_TYPE {NONE, ITEM, ACTOR}

@export var scene_override : PackedScene

@export var type: ACTOR_TYPE

@export var spr : Texture
## Used to set [code]h_frames[/code] and [code]v_frames[/code] in the sprite spawned.
@export var frames : Vector2i
## The animations that will be used with the sprite. Should reference
## [code].[/code], a sprite, as the target of its animations.
@export var animations : AnimationLibrary

@export var states : Array[Script]

