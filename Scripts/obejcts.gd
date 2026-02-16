class_name Objects extends Area2D  

# Velocidade de queda do objeto
var speed: float = 100
@onready var pasta_de_trabalho: Sprite2D = $PastaDeTrabalho
@onready var pasta_de_trabalho_2: Sprite2D = $PastaDeTrabalho2
var spawn_area_max: Vector2  # Ponto máximo para o spawn  
var margin: int = 30  # Margem para evitar que o café apareça muito próximo das bordas  
var objects_size: Vector2 = Vector2(30, 30)  # Ajuste de acordo com o tamanho real do café  


var scree_size: Vector2 = Vector2.ZERO

# Chamado para iniciar a queda aleatória  
func _ready() -> void:  
	# Define uma posição aleatória para o objeto na largura da tela  
	position.x = randf_range(35, get_viewport().size.x-35)  
	position.y = 0  # Começa do topo da tela 
	spawn_area_max = get_viewport().size  # Define o ponto máximo para o spawn   

func _physics_process(delta: float) -> void:  
	scree_size = get_viewport().size
	var velocity = speed * Vector2.DOWN * delta
	#Mantem as funções ao rodar o jogo em tela expandida
	var rect:Rect2 = get_viewport_rect()
	spawn_area_max = rect.size
	print(spawn_area_max)
	
	pasta_de_trabalho.position += velocity
	pasta_de_trabalho_2.position += velocity
	
	if pasta_de_trabalho.position.y > scree_size.y:
		pasta_de_trabalho.position.y = pasta_de_trabalho_2.position.y - scree_size.y
		

	if pasta_de_trabalho_2.position.y > scree_size.y:
		pasta_de_trabalho_2.position.y = pasta_de_trabalho.position.y - scree_size.y

func spawn_new_objects():  
	var new_objects = preload("res://Prefabs/Obejcts.tscn").instantiate()  # Caminho para a cena do café  

	# Define a área segura para aparecer o café  
	var safe_spawn_area_min = Vector2(margin, margin)  
	var safe_spawn_area_max = spawn_area_max - Vector2(objects_size.x + margin, objects_size.y + margin)  
	
	# Gera a posição aleatória dentro da área segura  
	new_objects.position = Vector2(  
		randf_range(safe_spawn_area_min.x, safe_spawn_area_max.x),   
		randf_range(safe_spawn_area_min.y, safe_spawn_area_max.y)  
	)

	get_parent().add_child(new_objects)  # Adiciona o novo café à cena  


#func _on_visible_on_screen_notifier_2d_screen_exited() -> void:  
	# Remove o objeto da cena quando sai da tela  
	#queue_free()


func _on_area_entered(area: Area2D) -> void:
	#Se o jogador colidir com o objeto, vai para a cena de game over
	if area.name == "Jogador": 
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
