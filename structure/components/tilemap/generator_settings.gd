class_name GeneratorSettings
extends Resource

@export var enemies : Array[ObjectSpawnRelation]
@export var pickups : Array[ObjectSpawnRelation]
@export var bosses : Array[ObjectSpawnRelation]
@export var maps : Array[PackedScene]

# All of these classes *should* be structs/typed dicts, but we don't have those yet :/
class ObjectSpawnRelation:
	extends Resource
	## The object that will be spawned.
	@export var object : PackedScene
	## The probability that this object will be spawned.
	@export var probability: float
	## The maximum amount of objects of this type in a level.
	@export var max_count : int
