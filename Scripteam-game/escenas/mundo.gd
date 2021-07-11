extends Node
export (PackedScene) var mob
var score 

func _ready():
	randomize()
	
func nuevo_juego():
	score = 0
	$dragon2.inicio($Position2D.position)#posicion de inicio dragon
	$InicioTimer.start()
	$interfas.mostrar_msm("Ready?!!!")
	$interfas.update_score(score)
	$soundbg.play()


func game_over():
	$ScoreTimer.stop()
	$mobtimer.stop()
	$interfas.game_over()
	$audiomuerte.play()
	$soundbg.stop()


func _on_InicioTimer_timeout():
	$mobtimer.start()
	$ScoreTimer.start()
	


func _on_ScoreTimer_timeout():
	score +=10
	$interfas.update_score(score)

func _on_mobtimer_timeout():
	#selecciona un lugar aleatorio en el camino
	$Camino/mobpossicion.set_offset(randi())
	
	var M = mob.instance()
	add_child(M)
	
	#selecciona una direccion
	var d = $Camino/mobpossicion.rotation +PI /2
	
	M.position = $Camino/mobpossicion.position
	
	d += rand_range(-PI /4, PI /4)
	
	M.rotation = d
	M.set_linear_velocity(Vector2(rand_range(M.velo_min, M.velo_max),0).rotated(d))
	
