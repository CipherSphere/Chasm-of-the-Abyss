extends Node2D


@export var entity: PackedScene
@export var spawn_rate: float

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = spawn_rate

func _on_timer_timeout():
	var new_spawn = entity.instantiate()
	new_spawn.position = Vector2(randi_range(-200, 200), randi_range(-200, 200))
	
	get_parent().add_child(new_spawn)
