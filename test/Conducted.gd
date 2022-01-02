tool
class_name PressAccept_Conductor_Conducted

static func __mixed_info() -> Array:

	return [
		'res://addons/PressAccept/Conductor/Conductable.gd'
	]


var a_property: String setget set_a_property, get_a_property


func __init(init_arg = 'default') -> void:

	self.a_property = init_arg


func set_a_property(
		new_property: String) -> void:

	if self.subs.has('set_a_property'):
		self.conductable.sub('set_a_property', [ new_property ])
		return

	new_property = self.conductable.filter('new_property', new_property, [ true ])

	self.conductable.hook('pre_set_a_property')

	a_property = new_property

	self.conductable.hook('post_set_a_property', [ a_property ])


func get_a_property() -> String:

	if self.subs and self.subs.has('get_a_property'):
		return self.conductable.sub('get_a_property')

	self.conductable.hook('get_a_property')

	return self.conductable.filter('get_a_property', a_property)

