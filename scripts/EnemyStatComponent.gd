extends Node2D

var health

# Called when the node enters the scene tree for the first time.

@onready var parent = $".."

func _ready():
	health = parent.max_health

func take_damage(damage):

	$"../SpriteAnim".self_modulate = Color(10, 1, 1, 1)
	$RedHitTime.start()
	health -= damage

	
	if health <= 0:
		die()
	
	


func _on_hitbox_area_entered(area):
	if area.get_parent().type == "weapon":
		take_damage(area.get_parent().damage)


func die():
	parent.queue_free()


func _on_red_hit_time_timeout():
	$"../SpriteAnim".self_modulate = Color(1, 1, 1, 1)
