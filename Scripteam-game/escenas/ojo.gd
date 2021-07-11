extends RigidBody2D

export (int) var velo_min
export (int)var velo_max
var tipo_mob = ["ojitomonster", "ojito2"]#array

func _ready():
	$AnimatedSprite.animation = tipo_mob [randi() % tipo_mob.size()]#tomara valor aleatorio del array & devuelve 1 valor de los 2
	
	if $AnimatedSprite.animation == "ojito2":
		$CollisionShape2D.scale.x = 1
		$CollisionShape2D.scale.y = 1
		





func _on_visibilidad_screen_exited():
	queue_free()#elimina el mob
