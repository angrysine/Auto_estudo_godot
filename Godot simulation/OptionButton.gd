extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _add_itens(list):
	self.clear()
	for item in list:
		var x = str(item["x"])
		var y = str(item["y"])
		var z = str(item["z"])
		var r = str(item["r"])
		var id = str(item["id"])
		#var string_padrao = "minha string tem %s, %s"
		#var minha = string_padrao % []
		
		var response= "id: {id},x: {x},y: {y},z: {z},r: {r}".format([["id",id],["x",x],["y",y],["z",z],["r",r]])
		self.add_item(response)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
