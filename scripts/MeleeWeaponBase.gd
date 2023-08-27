extends Node2D


@export var type: String = "weapon"

@export var damage: int  

@export var active: bool = false



func _process(delta):
	pass
	
func attack():
	$Hitbox.monitorable = true
	self.visible = true
	$Spriteanim.play("attack")
	active = true
	$DamageTimer.start()


func _on_damage_timer_timeout():
	$Hitbox.monitorable = false
	self.visible = false
	active = false
	$Spriteanim.play("idle")
	
