extends Node2D

var health
var max_health_node
var hitbox_node
var i_frame_timer


func _ready():
	max_health_node = $".."
	health = max_health_node.max_health
	
	hitbox_node = $"../Hitbox"
	i_frame_timer = $"IFrameTimer"

func take_damage(damage):
	i_frame_timer.start()
	health -= damage
	hitbox_node.monitorable = false
	hitbox_node.monitoring = false
	if health <= 0:
		die()

func _on_hitbox_area_entered(area):
	if area.get_parent().type == "enemy":
		take_damage(area.get_parent().damage)

func die():
	max_health_node.queue_free()

func _on_i_frame_timer_timeout():
	hitbox_node.monitorable = true
	hitbox_node.monitoring = true
