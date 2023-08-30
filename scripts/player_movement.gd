extends CharacterBody2D

@export var type: String = "player"

@export_category("stats")
@export var max_health: int
@export var level: int = 1
@export var xp: int = 0

@export_category("other")
@export var weapon: PackedScene

const SPEED = 300.0


var mouse_pos

@onready var weapon_mount = $WeaponMountHinge/WeaponMount




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
		
	if velocity != Vector2(0, 0):
		$SpriteAnim.animation = "walk"
	else:
		$SpriteAnim.animation = "idle"
	move_and_slide()
	
func _input(event):

	mouse_pos = get_global_mouse_position()
	$WeaponMountHinge.look_at(mouse_pos)
	
	
