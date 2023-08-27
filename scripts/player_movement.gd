extends CharacterBody2D

@export var type: String = "player"

@export_category("stats")
@export var max_health: int

const SPEED = 300.0


var mouse_pos

@onready var weapon_mount = $WeaponMount

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
		
	
	
	if weapon_mount.get_child_count() > 0:
		if event.is_action_pressed("light_attack"):
			weapon_mount.look_at(mouse_pos)
			weapon_mount.get_children()[0].attack()
