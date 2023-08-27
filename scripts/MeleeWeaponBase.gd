extends Node2D


@export var type: String = "weapon"

@export var damage: int  

@export var active: bool = false



func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func attack():
	self.visible = true
	$Spriteanim.play("attack")
	active = true
	$DamageTimer.start()


func _on_damage_timer_timeout():
	self.visible = false
	active = false
	$Spriteanim.play("idle")
	
