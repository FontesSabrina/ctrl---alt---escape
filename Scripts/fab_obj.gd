# classe FabObj que estende Node2D  
class_name FabObj extends Node2D  

var object_types = ["res://Prefabs/FabObj.tscn" ]  
func _spawn_object():  
	# Cria um objeto caindo  
	var object = preload("res://Prefabs/FabObj.tscn").instantiate()  
	position.x = randf_range(35, get_viewport().size.x-35)  
	position.y = 0
	add_child(object)  

#func _on_area_entered(area: Area2D) -> void:  
	#print("Área: ", area)  # Imprime a área que entrou em contato  
	#f area.name == "Jogador":
		#get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Área: ", area)  # Imprime a área que entrou em contato  
	if area.name == "Jogador":
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")


func _on_area_2d_3_area_entered(area: Area2D) -> void:
	print("Área: ", area)  # Imprime a área que entrou em contato  
	if area.name == "Jogador":
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	print("Área: ", area)  # Imprime a área que entrou em contato  
	if area.name == "Jogador":
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
