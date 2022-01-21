tool
class_name PressAccept_Conductor_Conducted


static func __mixed_info() -> Array:

	return [
		'res://addons/PressAccept/Conductor/Conductable.gd'
	]


static func instantiate(
		init_arg = 'default',
		init_filters: Dictionary = {},
		init_hooks: Dictionary = {},
		init_subs: Dictionary = {}) -> PressAccept_Conductor_Conducted:

	return PressAccept_Mixer_Mixer.instantiate(
		'res://addons/PressAccept/Conductor/test/Conducted.gd',
		[
			init_arg,
			init_filters,
			init_hooks,
			init_subs
		],
		true
	)

var a_property: String setget set_a_property, get_a_property


func __init(
		init_arg = 'default',
		init_filters: Dictionary = {},
		init_hooks: Dictionary = {},
		init_subs: Dictionary = {}) -> void:

	self.a_property = init_arg

	# Conductable.gd
	if init_filters:
		self.filters = init_filters
	if init_hooks:
		self.hooks = init_hooks
	self.subs = init_subs


func __get_script():

	return 'res://addons/PressAccept/Conductor/test/Conducted.gd'


func set_a_property(
		new_property: String) -> void:

	if self.subs.has('set_a_property'):
		self.conductable.sub('set_a_property', [ new_property ])
		return

	new_property = self.conductable.filter('new_property', new_property, [ true ])

	self.conductable.hook('pre_set_a_property', [ new_property ])

	var old_a_property = self.a_property

	a_property = new_property

	self.conductable.hook('post_set_a_property', [ a_property, old_a_property ])


func get_a_property() -> String:

	if self.subs and self.subs.has('get_a_property'):
		return self.conductable.sub('get_a_property')

	self.conductable.hook('get_a_property')

	return self.conductable.filter('a_property', a_property)

