extends Node2D

var parent
var weapon

var can_attack = true


@onready var cool_down_timer = $"../AttackCooldown"

func _ready():
	parent = $"../.."
	if parent.weapon != null:
		weapon = parent.weapon
		

func _input(event):
	if event.is_action_pressed("light_attack"):
		attack()
		
	

func attack():
	if can_attack:
		
		var new_attack = weapon.instantiate()
		cool_down_timer.wait_time = new_attack.cool_down
		can_attack = false
		cool_down_timer.start()
		new_attack.position = $"..".global_position
		new_attack.rotation = self.global_rotation
		
		self.get_parent().get_parent().get_parent().add_child(new_attack)



func _on_attack_cooldown_timeout():
	print("cooldown off")
	
	can_attack = true
	cool_down_timer.stop()
