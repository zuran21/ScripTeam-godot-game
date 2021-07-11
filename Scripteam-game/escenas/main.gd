extends Area2D

export (int) var velocidad

var movimiento = Vector2()#posee los ejes x , y (como plano cartesiano)
var limite
signal golpe

func _ready():
	#hide()
	limite = get_viewport_rect().size#mantiene un valor de x , y


func _process(delta):
	movimiento = Vector2()#reiniciar el valor
	
	if Input.is_action_pressed("ui_right"):#derecha
		movimiento.x +=1
	if Input.is_action_pressed("ui_left"):#izuierda
		movimiento.x -=1
	if Input.is_action_pressed("ui_down"):#abajo
		movimiento.y +=1
	if Input.is_action_pressed("ui_up"):#arriba
		movimiento.y -=1
	
	if movimiento.length() > 0: #verificar si se mueve 
		movimiento = movimiento.normalized() * velocidad #normalizar velocidad
	
	position += movimiento * delta #delta asimila o trata de optimizar la velocidad segun la computadora cada segundo
	position.x = clamp(position.x, 0, limite.x)
	position.y = clamp(position.y, 0, limite.y)
	
	
	if movimiento.x !=0:#cambio de imagen  "!" significa la verificacion negativa del valor
		$dragon1.animation = "ladoizquierdo" # se ubica la animacion para su programacion posterior
		$dragon1.flip_h = movimiento.x > 0#inversion de la imagen del nodo
	#elif movimiento.y != 0:
	#	$Sprite.animation = "cuerpo2"
	#	$Sprite.flip_v = movimiento.y > 0
	#else:
	#	$Sprite.animation = "frente"


func _on_Area2D_body_entered(body):#con una colision en el cuerpo de player
	hide()#oculta el personaje
	emit_signal("golpe")
	$CollisionShape2D.disabled = true
	
func inicio(pos):
	position = pos
	show()#muestra el player
	$CollisionShape2D.disabled = false;
	
	
	
	
	
	
	
