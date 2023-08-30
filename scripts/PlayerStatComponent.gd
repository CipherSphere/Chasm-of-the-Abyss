extends Node2D

var health
var max_health_node
var hitbox_node
var i_frame_timer
var visual

func _ready():
	max_health_node = $".."
	health = max_health_node.max_health
	
	hitbox_node = $"../Hitbox"
	i_frame_timer = $"IFrameTimer"
	visual = $"../SpriteAnim"

func take_damage(damage):
	visual.self_modulate = Color(1, 1, 1, 0.5)
	
	i_frame_timer.start()
	health -= damage
	$"../ProgressBar".value = health
	
	hitbox_node.set_deferred("monitorable", false)
	hitbox_node.set_deferred("monitoring", false)
	
	
	if health <= 0:
		die()



func _on_hitbox_area_entered(area):
	if area.get_parent().type == "enemy":
		take_damage(area.get_parent().damage)

func die():
	max_health_node.queue_free()

func _on_i_frame_timer_timeout():
	hitbox_node.set_deferred("monitorable", true)
	hitbox_node.set_deferred("monitoring", true)
	visual.self_modulate = Color(1, 1, 1, 1)


func _on_player_add_xp(amount):
	
	$"..".xp += amount
	$"../XPbar".value = $"..".xp
