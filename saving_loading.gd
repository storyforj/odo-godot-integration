extends Node2D

var random_data_variable
var data

func _ready():
	save_data()
	load_data()

func load_data():
	var random_number = int(rand_range(1000000, 9999999))
	random_data_variable = 'getData{random_number}'.format({ "random_number": random_number })
	var script = """
	  window.odo.data.get('test').then(function(data) {
		window.{data_var_name} = JSON.stringify(data);
	  });
	"""
	JavaScript.eval(script.format({ "data_var_name": random_data_variable }), true)

func save_data():
	var script = """
	  (function() {
		const data = JSON.stringify({
			my_data_1: {var_one},
			my_data_2: {var_two},
		});
		window.odo.data.save('test', data).then(function(response) {
		  console.log('saved', response);
		  // optionally do something after you save
		});
	  }());
	"""
	var result = JavaScript.eval(script.format({ "var_one": 1, "var_two": 2 }), true)

func detect_loaded_data():
	if not random_data_variable:
		return
	
	var data_string = JavaScript.eval("window.{data_var_name}".format({ "data_var_name": random_data_variable }), true)
	print(data_string)
	if data_string:
		data = JSON.parse(data_string).result
		# keys will tell you what data is returned, namely: isODO, event, key and data
		print(data.keys())
		# get('data') is the data object you saved using the odo.data.save
		# NOTE: this will need to be JSON.parsed as well
		print(data.get('data'))
		JavaScript.eval("delete window.{data_var_name};".format({ "data_var_name": random_data_variable }), true)
		random_data_variable = null
	
func _process(_delta):
	detect_loaded_data()
