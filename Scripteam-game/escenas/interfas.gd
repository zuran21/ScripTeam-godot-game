extends CanvasLayer

signal iniciar_juego

func mostrar_msm(texto):
	$Mensajelabel.text = texto
	$Mensajelabel.show()
	$MensajeTimer.start()
	
	
func game_over():
	mostrar_msm("Fin del Juego :El dragon murio:")
	yield($MensajeTimer, "timeout")	
	$Button.show()
	$Mensajelabel.text = ("Arburia")
	$Mensajelabel.show()

func update_score(puntos):
	$Scorelabel.text = str (puntos)




func _on_MensajeTimer_timeout():
	$Mensajelabel.hide()
	


func _on_Button_pressed():
	$Button.hide()
	emit_signal("iniciar_juego")
