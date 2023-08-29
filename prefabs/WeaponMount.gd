extends Node2D

var parent
var weapon

var can_attack = true

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
		$"../AttackCooldown".wait_time = new_attack.cool_down
		can_attack = false
		$"../AttackCooldown".start()
		new_attack.position = $"..".global_position
		new_attack.rotation = self.global_rotation
		
		self.get_parent().get_parent().get_parent().add_child(new_attack)



func _on_attack_cooldown_timeout():
	print("cooldown off")
	
	can_attack = true
	$"../AttackCooldown".stop()
