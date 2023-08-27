extends CharacterBody2D

@export var type: String = "player"

const SPEED = 300.0


var mouse_pos

func _physics_process(delta):
	
	var direction_hori = Input.get_axis("left", "right")
	var direction_verti = Input.get_axis("up", "down")
	
	if direction_hori:
		velocity.x = direction_hori * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	
	if direction_verti:
		velocity.y = direction_verti * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	
func _input(event):
	
	if event is InputEventMouseMotion:
		mouse_pos = event.position
		
	
	
	if $WeaponMount.get_child_count() > 0:
		if event.is_action_pressed("light_attack"):
			$WeaponMount.look_at(mouse_pos)
			$WeaponMount.get_children()[0].attack()
