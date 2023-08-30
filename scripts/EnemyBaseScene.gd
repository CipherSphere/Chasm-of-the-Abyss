extends CharacterBody2D

@export var type: String = "enemy"

@export_category("Stats")

@export var max_health: int
@export var damage: int
@export var move_speed: float
@export var xp_granted: int




var direction = Vector2(0, 0)

var state = "idle"

var enemy = null

var player = null


func _physics_process(delta):
	
	if state == "pursue":
		
		direction = (player.position - self.position).normalized()
	
	if direction:
		velocity = direction * move_speed
		
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)
		velocity.y = move_toward(velocity.y, 0, move_speed)

	move_and_slide()


func _on_sense_area_area_entered(area):
	if area.get_parent().type == "player":
		state = "pursue"
		player = area.get_parent()


func _on_sense_area_area_exited(area):
	if area.get_parent().type == "player":
		state = "idle"
		direction = Vector2(0, 0)
