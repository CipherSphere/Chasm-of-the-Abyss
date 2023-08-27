extends Node2D

var parent
var weapon

func _ready():
	parent = $".."
	if parent.weapon != null:
		weapon = parent.weapon
	

func _input(event):
	if event.is_action_pressed("light_attack"):
		attack()
		
	

func attack():
	var new_attack = weapon.instantiate()
	new_attack.position = self.global_position
	new_attack.rotation = self.global_rotation
	
	self.get_parent().get_parent().add_child(new_attack)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
