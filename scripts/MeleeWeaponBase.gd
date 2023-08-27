extends Node2D

@export var type: String = "weapon"
@export var damage: int  
@export var active: bool = false

var velocity: Vector2

var direction

func _ready():
	direction = (get_global_mouse_position() - self.position).normalized()
	

func _process(delta):

	velocity = direction * 600
	
	self.position += velocity * delta




func _on_damage_timer_timeout():
	queue_free()
