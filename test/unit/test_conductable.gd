extends 'res://addons/gut/test.gd'

# |---------|
# | Imports |
# |---------|

# see test/Utilities.gd
var TestUtilities : Script = PressAccept_Conductor_Test_Utilities
# shorthand for our library class
var Conductable   : Script = PressAccept_Conductor_Conductable

var flags: Dictionary = {}

# |-------|
# | Tests |
# |-------|


func test_hookable() -> void:

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(null)

	var exception: PressAccept_Error_Exception = \
		PressAccept_Error_Exception.new()

	assert_true(Conductable.hookable(conductable))
	assert_true(Conductable.filterable(conductable))
	assert_false(Conductable.hookable(exception))
	assert_false(Conductable.filterable(exception))


func test_get_all_hook_constants() -> void:

	assert_eq_shallow(
		Conductable.get_all_hook_constants(
			'res://addons/PressAccept/Conductor/Conductable.gd'
		),
		{
			'STR_HOOK_BASE': Conductable.STR_HOOK_BASE,
			'STR_HOOK_SET_FILTERS': Conductable.STR_HOOK_SET_FILTERS,
			'STR_HOOK_GET_FILTERS': Conductable.STR_HOOK_GET_FILTERS,
			'STR_HOOK_SET_HOOKS': Conductable.STR_HOOK_SET_HOOKS,
			'STR_HOOK_GET_HOOKS': Conductable.STR_HOOK_GET_HOOKS,
			'STR_HOOK_SET_SUBS': Conductable.STR_HOOK_SET_SUBS,
			'STR_HOOK_GET_SUBS': Conductable.STR_HOOK_GET_SUBS,
			'STR_HOOK_PRE_ADD_HOOK': Conductable.STR_HOOK_PRE_ADD_HOOK,
			'STR_HOOK_POST_ADD_HOOK': Conductable.STR_HOOK_POST_ADD_HOOK,
			'STR_HOOK_PRE_REMOVE_HOOK': Conductable.STR_HOOK_PRE_REMOVE_HOOK,
			'STR_HOOK_POST_REMOVE_HOOK': Conductable.STR_HOOK_POST_REMOVE_HOOK,
			'STR_HOOK_PRE_ADD_FILTER': Conductable.STR_HOOK_PRE_ADD_FILTER,
			'STR_HOOK_POST_ADD_FILTER': Conductable.STR_HOOK_POST_ADD_FILTER,
			'STR_HOOK_PRE_REMOVE_FILTER': \
				Conductable.STR_HOOK_PRE_REMOVE_FILTER,
			'STR_HOOK_POST_REMOVE_FILTER': \
				Conductable.STR_HOOK_POST_REMOVE_FILTER,
			'STR_HOOK_PRE_ADD_SUB': Conductable.STR_HOOK_PRE_ADD_SUB,
			'STR_HOOK_POST_ADD_SUB': Conductable.STR_HOOK_POST_ADD_SUB,
			'STR_HOOK_PRE_REMOVE_SUB': Conductable.STR_HOOK_PRE_REMOVE_SUB,
			'STR_HOOK_POST_REMOVE_SUB': Conductable.STR_HOOK_POST_REMOVE_SUB,
			'STR_HOOK_PRE_HOOK': Conductable.STR_HOOK_PRE_HOOK,
			'STR_HOOK_POST_HOOK': Conductable.STR_HOOK_POST_HOOK,
			'STR_HOOK_PRE_FILTER': Conductable.STR_HOOK_PRE_FILTER,
			'STR_HOOK_POST_FILTER': Conductable.STR_HOOK_POST_FILTER,
			'STR_HOOK_PRE_SUB': Conductable.STR_HOOK_PRE_SUB,
			'STR_HOOK_POST_SUB': Conductable.STR_HOOK_POST_SUB
		}
	)


func test_get_all_filter_constants() -> void:

	assert_eq_shallow(
		Conductable.get_all_filter_constants(
			'res://addons/PressAccept/Conductor/Conductable.gd'
		),
		{
			'STR_FILTER_BASE': Conductable.STR_FILTER_BASE,
			'STR_FILTER_NEW_FILTERS': Conductable.STR_FILTER_NEW_FILTERS,
			'STR_FILTER_FILTERS': Conductable.STR_FILTER_FILTERS,
			'STR_FILTER_NEW_HOOKS': Conductable.STR_FILTER_NEW_HOOKS,
			'STR_FILTER_HOOKS': Conductable.STR_FILTER_HOOKS,
			'STR_FILTER_NEW_SUBS': Conductable.STR_FILTER_NEW_SUBS,
			'STR_FILTER_SUBS': Conductable.STR_FILTER_SUBS,
			'STR_FILTER_ADD_FILTER_IDENTIFIER': \
				Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
			'STR_FILTER_ADD_FILTER_VALUE': \
				Conductable.STR_FILTER_ADD_FILTER_VALUE,
			'STR_FILTER_REMOVE_FILTER_IDENTIFIER': \
				Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
			'STR_FILTER_REMOVE_FILTER_VALUE': \
				Conductable.STR_FILTER_REMOVE_FILTER_VALUE,
			'STR_FILTER_ADD_HOOK_IDENTIFIER': \
				Conductable.STR_FILTER_ADD_HOOK_IDENTIFIER,
			'STR_FILTER_ADD_HOOK_VALUE': Conductable.STR_FILTER_ADD_HOOK_VALUE,
			'STR_FILTER_REMOVE_HOOK_IDENTIFIER': \
				Conductable.STR_FILTER_REMOVE_HOOK_IDENTIFIER,
			'STR_FILTER_REMOVE_HOOK_VALUE': \
				Conductable.STR_FILTER_REMOVE_HOOK_VALUE,
			'STR_FILTER_ADD_SUB_IDENTIFIER': \
				Conductable.STR_FILTER_ADD_SUB_IDENTIFIER,
			'STR_FILTER_ADD_SUB_VALUE': Conductable.STR_FILTER_ADD_SUB_VALUE,
			'STR_FILTER_REMOVE_SUB_IDENTIFIER': \
				Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER,
			'STR_FILTER_REMOVE_SUB_VALUE': \
				Conductable.STR_FILTER_REMOVE_SUB_VALUE,
			'STR_FILTER_SUB_ACTION': Conductable.STR_FILTER_SUB_ACTION,
			'STR_FILTER_FILTER_IDENTIFIER': \
				Conductable.STR_FILTER_FILTER_IDENTIFIER,
			'STR_FILTER_FILTER_ARGS_ARR': \
				Conductable.STR_FILTER_FILTER_ARGS_ARR,
			'STR_FILTER_HOOK_IDENTIFIER': \
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
			'STR_FILTER_HOOK_ARGS_ARR': \
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
			'STR_FILTER_SUB_IDENTIFIER': \
				Conductable.STR_FILTER_SUB_IDENTIFIER,
			'STR_FILTER_SUB_ARGS_ARR': \
				Conductable.STR_FILTER_SUB_ARGS_ARR,
		}
	)


func reset_flags() -> void:

	flags = {}

# hooks

func pre_hook(
		hook_identifier,
		args_arr: Array,
		_self) -> void:

	if flags.has('pre_hook'):
		flags['pre_hook'] += [ [ hook_identifier, args_arr.duplicate(true) ] ]
	else:
		flags['pre_hook'] = [ [ hook_identifier, args_arr.duplicate(true) ] ]

	return


func post_hook(
		hook_identifier,
		args_arr: Array,
		_self) -> void:

	if flags.has('post_hook'):
		flags['post_hook'] += [ [ hook_identifier, args_arr.duplicate(true) ] ]
	else:
		flags['post_hook'] = [ [ hook_identifier, args_arr.duplicate(true) ] ]

	return


func pre_filter(
		filter_identifier,
		input,
		args_arr: Array,
		_self) -> void:

	if input is Dictionary or input is Array:
		input = input.duplicate(true)

	if flags.has('pre_filter'):
		flags['pre_filter'] += \
			[ [ filter_identifier, input, args_arr.duplicate(true) ] ]
	else:
		flags['pre_filter'] = \
			[ [ filter_identifier, input, args_arr.duplicate(true) ] ]

	return


func post_filter(
		filter_identifier,
		output,
		args_arr: Array,
		_self) -> void:

	if output is Dictionary or output is Array:
		output = output.duplicate(true)

	if flags.has('post_filter'):
		flags['post_filter'] += \
			[ [ filter_identifier, output, args_arr.duplicate(true) ] ]
	else:
		flags['post_filter'] = \
			[ [ filter_identifier, output, args_arr.duplicate(true) ] ]

	return


func set_filters(
		new_filters,
		_self) -> void:

	flags['set_filters'] = true

	return


func get_filters(
		the_filters,
		_self) -> void:

	flags['get_filters'] = true

	return


func set_hooks(
		new_hooks,
		_self) -> void:

	flags['set_hooks'] = true

	return


func get_hooks(
		the_hooks,
		_self) -> void:

	flags['get_hooks'] = true

	return


func set_subs(
		new_subs,
		_self) -> void:

	flags['set_subs'] = true

	return


func get_subs(
		the_subs,
		_self) -> void:

	flags['get_subs'] = true

	return


func pre_add_filter(
		filter_identifier,
		filter_value,
		_self) -> void:

	flags['pre_add_filter'] = true

	return


func post_add_filter(
		filter_identifier,
		filter_value,
		_self) -> void:

	flags['post_add_filter'] = true

	return


func pre_remove_filter(
		filter_identifier,
		filter_value,
		_self) -> void:

	flags['pre_remove_filter'] = true

	return


func post_remove_filter(
		filter_identifier,
		filter_value,
		_self) -> void:

	flags['post_remove_filter'] = true

	return


func pre_add_hook(
		hook_identifier,
		hook_value,
		_self) -> void:

	flags['pre_add_hook'] = true

	return


func post_add_hook(
		hook_identifier,
		hook_value,
		_self) -> void:

	flags['post_add_hook'] = true

	return


func pre_remove_hook(
		hook_identifier,
		hook_value,
		_self) -> void:

	flags['pre_remove_hook'] = true

	return


func post_remove_hook(
		hook_identifier,
		hook_value,
		_self) -> void:

	flags['post_remove_hook'] = true

	return


func remove_hook(
		hook_identifier,
		hook_value,
		_self):

	flags['remove_hook'] = true

	return


func pre_add_sub(
		sub_identifier,
		sub_value,
		_self) -> void:

	flags['pre_add_sub'] = true

	return


func post_add_sub(
		sub_identifier,
		sub_value,
		_self) -> void:

	flags['post_add_sub'] = true

	return


func pre_remove_sub(
		sub_identifier,
		sub_value,
		_self) -> void:

	flags['pre_remove_sub'] = true

	return


func post_remove_sub(
		sub_identifier,
		sub_value,
		_self) -> void:

	flags['post_remove_sub'] = true

	return


func pre_sub(
		sub_identifier,
		args_arr,
		_self) -> void:

	flags['pre_sub'] = true

	return


func post_sub(
		sub_identifier,
		args_arr,
		return_value,
		_self) -> void:

	flags['post_sub'] = true

	return


# filters


func filter_new_filters(
		new_filters,
		_self) -> Dictionary:

	flags['filter_new_filters'] = true

	return new_filters


func filter_filters(
		the_filters,
		_self) -> Dictionary:

	flags['filter_filters'] = true

	return the_filters


func filter_new_hooks(
		new_hooks,
		_self) -> Dictionary:

	flags['filter_new_hooks'] = true

	return new_hooks


func filter_hooks(
		the_hooks,
		_self) -> Dictionary:

	flags['filter_hooks'] = true

	return the_hooks


func filter_new_subs(
		new_subs,
		_self) -> Dictionary:

	flags['filter_new_subs'] = true

	return new_subs


func filter_subs(
		the_subs,
		_self) -> Dictionary:

	flags['filter_subs']= true

	return the_subs


func filter_add_filter_identifier(
		filter_identifier,
		filter_value,
		filters,
		_self):

	flags['filter_add_filter_identifier'] = true

	return filter_identifier


func filter_add_filter_value(
		filter_value,
		filter_identifier,
		filters,
		_self):

	flags['filter_add_filter_value'] = true

	return filter_value


func filter_remove_filter_identifier(
		filter_identifier,
		filter_value,
		filters,
		_self):

	flags['filter_remove_filter_identifier'] = true

	return filter_identifier


func filter_remove_filter_value(
		filter_value,
		filter_identifier,
		filters,
		_self):

	flags['filter_remove_filter_value'] = true

	return filter_value


func filter_add_hook_identifier(
		hook_identifier,
		hook_value,
		hooks,
		_self):

	flags['filter_add_hook_identifier'] = true

	return hook_identifier


func filter_add_hook_value(
		hook_value,
		hook_identifier,
		hooks,
		_self):

	flags['filter_add_hook_value'] = true

	return hook_value


func filter_remove_hook_identifier(
		hook_identifier,
		hook_value,
		hooks,
		_self):

	flags['filter_remove_hook_identifier'] = true

	return hook_identifier


func filter_remove_hook_value(
		hook_value,
		hook_identifier,
		hooks,
		_self):

	flags['filter_remove_hook_value'] = true

	return hook_value


func filter_add_sub_identifier(
		sub_identifier,
		sub_value,
		subs,
		_self):

	flags['filter_add_sub_identifier'] = true

	return sub_identifier


func filter_add_sub_value(
		sub_value,
		sub_identifier,
		subs,
		_self):

	flags['filter_add_sub_value'] = true

	return sub_value


func filter_remove_sub_identifier(
		sub_identifier,
		sub_value,
		subs,
		_self):

	flags['filter_remove_sub_identifier'] = true

	return sub_identifier


func filter_remove_sub_identifier_change(
		sub_identifier,
		sub_value,
		subs,
		_self):

	flags['filter_remove_sub_identifier'] = true

	sub_identifier += '__filtered'

	return sub_identifier


func filter_remove_sub_value(
		sub_value,
		sub_identifier,
		subs,
		_self):

	flags['filter_remove_sub_value'] = true

	return sub_value


func filter_sub_action(
		action,
		sub_identifier,
		args_arr,
		_self):

	flags['filter_sub_action'] = true

	return action


func filter_filter_identifier(
		filter_identifier,
		filter_value,
		args_arr,
		_self):

	flags['filter_filter_identifier'] = true

	return filter_identifier


func filter_filter_args_arr(
		args_arr,
		filter_identifier,
		filter_value,
		_self):

	flags['filter_filter_args_arr'] = true

	return args_arr


func filter_hook_identifier(
		hook_identifier,
		args_arr,
		_self):

	flags['filter_hook_identifier'] = true

	return hook_identifier


func filter_hook_args_arr(
		args_arr,
		hook_identifier,
		_self):

	flags['filter_hook_args_arr'] = true

	return args_arr


func filter_sub_identifier(
		sub_identifier,
		args_arr,
		_self):

	flags['filter_sub_identifier'] = true

	return sub_identifier


func filter_sub_args_arr(
		args_arr,
		sub_identifier,
		_self):

	flags['filter_sub_args_arr'] = true

	return args_arr


# signals


func signal_hooked(
		hook_identifier,
		args_arr: Array,
		_self) -> void:

	if flags.has('hooked'):
		flags['hooked'] += \
			[ [ hook_identifier, args_arr.duplicate(true), _self ] ]
	else:
		flags['hooked'] = \
			[ [ hook_identifier, args_arr.duplicate(true), _self ] ]

	return


func signal_filtered(
		filter_identifier,
		input,
		output,
		args_arr: Array,
		_self) -> void:

	if input is Dictionary or input is Array:
		input = input.duplicate(true)

	if output is Dictionary or output is Array:
		output = output.duplicate(true)

	if flags.has('filtered'):
		flags['filtered'] += [
			[
				filter_identifier,
				input,
				output,
				args_arr.duplicate(true),
				_self
			]
		]
	else:
		flags['filtered'] = [
			[
				filter_identifier,
				input,
				output,
				args_arr.duplicate(true),
				_self
			]
		]

	return


func test__init() -> void:

	var node: Node = Node.new()

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(
		node
	)

	assert_eq_shallow(conductable.filters, {})
	assert_eq_shallow(conductable.hooks, {})
	assert_eq_shallow(conductable.subs, {})

	var filter_new_filters: FuncRef = funcref(self, 'filter_new_filters')
	var set_filters: FuncRef = funcref(self, 'set_filters')
	var add_filter: FuncRef = funcref(self, 'add_filter')

	conductable = Conductable.new(
		node,
		{
			Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
		},
		{
			Conductable.STR_HOOK_SET_FILTERS: set_filters
		},
		{
			'add_filter': add_filter
		}
	)

	assert_eq_shallow(
		conductable.filters,
		{
			Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
		}
	)

	assert_eq_shallow(
		conductable.hooks,
		{
			Conductable.STR_HOOK_SET_FILTERS: set_filters
		}
	)

	assert_eq_shallow(
		conductable.subs,
		{
			'add_filter': add_filter
		}
	)

	node.free()

func test___init() -> void:

	var conductable: PressAccept_Conductor_Conducted = \
		PressAccept_Mixer_Mixer.instantiate(
			'res://addons/PressAccept/Conductor/test/Conducted.gd',
			[],
			true
		)

	assert_eq(conductable.a_property, 'default')

	conductable = PressAccept_Mixer_Mixer.instantiate(
		'res://addons/PressAccept/Conductor/test/Conducted.gd',
		[ 'input'],
		true
	)

	assert_eq(conductable.a_property, 'input')


func test_set_filters() -> void:

	var node: Node = Node.new()

	# hook
	var pre_hook    : FuncRef = funcref(self, 'pre_hook')
	var post_hook   : FuncRef = funcref(self, 'post_hook')
	var pre_filter  : FuncRef = funcref(self, 'pre_filter')
	var post_filter : FuncRef = funcref(self, 'post_filter')
	var get_filters : FuncRef = funcref(self, 'get_filters')
	var set_filters : FuncRef = funcref(self, 'set_filters')

	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_GET_FILTERS: get_filters,
		Conductable.STR_HOOK_SET_FILTERS: set_filters
	}

	# filters
	var filter_filter_identifier     : FuncRef = \
		funcref(self, 'filter_filter_identifier')
	var filter_filter_args_arr       : FuncRef = \
		funcref(self, 'filter_filter_args_arr')
	var filter_hook_identifier       : FuncRef = \
		funcref(self, 'filter_hook_identifier')
	var filter_hook_args_arr         : FuncRef = \
		funcref(self, 'filter_hook_args_arr')
	var filter_new_filters           : FuncRef = \
		funcref(self, 'filter_new_filters')
	var filter_add_filter_identifier : FuncRef = \
		funcref(self, 'filter_add_filter_identifier')

	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
		Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
	}

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(
		node,
		filters,
		hooks
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	var new_filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
		Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
		Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
			filter_add_filter_identifier
	}

	reset_flags()

	conductable.filters = new_filters

	# hooks

	assert_has(flags, 'get_filters')
	assert_has(flags, 'set_filters')

	assert_eq_deep(
		flags['pre_hook'],
		[
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
				} ]
			],
			[
				Conductable.STR_HOOK_SET_FILTERS,
				[ { 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ]
			],
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ { 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ]
			]
		]
	)

	assert_eq_deep(
		flags['post_hook'],
		[
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
				} ]
			],
			[
				Conductable.STR_HOOK_SET_FILTERS,
				[ { 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ]
			],
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ { 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ]
			]
		]
	)

	assert_eq_deep(
		flags['hooked'],
		[
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
				} ],
				node
			],
			[
				Conductable.STR_HOOK_SET_FILTERS,
				[ { 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				node
			],
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ { 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				node
			]
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_new_filters')

	assert_eq_deep(
		flags['pre_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ { 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ { 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ]
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{ 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
				},
				[]
			],
			[
				Conductable.STR_FILTER_NEW_FILTERS,
				{ 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_SET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				[ Conductable.STR_HOOK_SET_FILTERS ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ]
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{ 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				},
				[]
			]
		]
	)

	assert_eq_deep(
		flags['post_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ { Conductable.STR_FILTER_FILTER_IDENTIFIER: \
					filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ]
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
				},
				[]
			],
			[
				Conductable.STR_FILTER_NEW_FILTERS,
				{ 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_SET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				[ Conductable.STR_HOOK_SET_FILTERS ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ]
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{ 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				},
				[]
			]
		]
	)

	assert_eq_deep(
		flags['filtered'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
				} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
				} ],
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ],
				node
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
				},
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
				},
				[],
				node
			],
			[
				Conductable.STR_FILTER_NEW_FILTERS,
				{ 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				},
				{ 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				},
				[],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_SET_FILTERS,
				Conductable.STR_HOOK_SET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				[ Conductable.STR_HOOK_SET_FILTERS ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ],
				node
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{ 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				},
				{ 
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				},
				[],
				node
			]
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_FILTERS_SET,
		[
			{ 
				Conductable.STR_FILTER_FILTER_IDENTIFIER: \
					filter_filter_identifier,
				Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
				Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
				Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
				Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
				Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
					filter_add_filter_identifier
			},
			{
				Conductable.STR_FILTER_FILTER_IDENTIFIER: \
					filter_filter_identifier,
				Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
				Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
				Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
				Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters },
			node
		]
	)

	# state

	assert_eq(conductable.filters, new_filters)

	node.free()


func test_get_filters() -> void:

	var node: Node = Node.new()

	# hooks
	var pre_hook    : FuncRef = funcref(self, 'pre_hook')
	var post_hook   : FuncRef = funcref(self, 'post_hook')
	var pre_filter  : FuncRef = funcref(self, 'pre_filter')
	var post_filter : FuncRef = funcref(self, 'post_filter')
	var get_filters : FuncRef = funcref(self, 'get_filters')

	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_GET_FILTERS: get_filters
	}
	
	# filters
	var filter_filter_identifier : FuncRef = \
		funcref(self, 'filter_filter_identifier')
	var filter_filter_args_arr   : FuncRef = \
		funcref(self, 'filter_filter_args_arr')
	var filter_hook_identifier   : FuncRef = \
		funcref(self, 'filter_hook_identifier')
	var filter_hook_args_arr     : FuncRef = \
		funcref(self, 'filter_hook_args_arr')
	var filter_filters           : FuncRef = funcref(self, 'filter_filters')

	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
		Conductable.STR_FILTER_FILTERS: filter_filters
	}

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(
		node,
		filters,
		hooks
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	var the_filters = conductable.filters

	# hooks

	assert_has(flags, 'get_filters')

	assert_eq_deep(
		flags['pre_hook'],
		[
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_FILTERS: filter_filters
				 } ]
			]
		]
	)

	assert_eq_deep(
		flags['post_hook'],
		[
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_FILTERS: filter_filters
				} ]
			]
		]
	)

	assert_eq_deep(
		flags['hooked'],
		[
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_FILTERS: filter_filters
				} ],
				node
			]
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_filters')

	assert_eq_deep(
		flags['pre_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_FILTERS: filter_filters
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_FILTERS: filter_filters
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ]
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_FILTERS: filter_filters
				},
				[]
			]
		]
	)

	assert_eq_deep(
		flags['post_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_FILTERS: filter_filters
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_FILTERS: filter_filters
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ]
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_FILTERS: filter_filters
				},
				[]
			]
		]
	)

	assert_eq_deep(
		flags['filtered'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_FILTERS: filter_filters
				} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_FILTERS: filter_filters
				} ],
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_FILTERS: filter_filters
				} ],
				[
					Conductable.STR_HOOK_GET_FILTERS
				],
				node
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_FILTERS: filter_filters
				},
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_FILTERS: filter_filters
				},
				[],
				node
			]
		]
	)

	node.free()


func test_set_hooks() -> void:

	var node: Node = Node.new()

	# hook
	var pre_hook    : FuncRef = funcref(self, 'pre_hook')
	var post_hook   : FuncRef = funcref(self, 'post_hook')
	var pre_filter  : FuncRef = funcref(self, 'pre_filter')
	var post_filter : FuncRef = funcref(self, 'post_filter')
	var get_hooks   : FuncRef = funcref(self, 'get_hooks')
	var set_hooks   : FuncRef = funcref(self, 'set_hooks')

	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_GET_HOOKS: get_hooks,
		Conductable.STR_HOOK_SET_HOOKS: set_hooks
	}

	# filters
	var filter_filter_identifier : FuncRef = \
		funcref(self, 'filter_filter_identifier')
	var filter_filter_args_arr   : FuncRef = \
		funcref(self, 'filter_filter_args_arr')
	var filter_hook_identifier   : FuncRef = \
		funcref(self, 'filter_hook_identifier')
	var filter_hook_args_arr     : FuncRef = \
		funcref(self, 'filter_hook_args_arr')
	var filter_new_hooks         : FuncRef = funcref(self, 'filter_new_hooks')

	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
		Conductable.STR_FILTER_NEW_HOOKS: filter_new_hooks
	}

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(
		node,
		filters,
		hooks
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	var pre_add_hook: FuncRef = funcref(self, 'add_hook')

	var new_hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_GET_HOOKS: get_hooks,
		Conductable.STR_HOOK_SET_HOOKS: set_hooks,
		Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
	}

	conductable.hooks = new_hooks

	# hooks

	assert_has(flags, 'get_hooks')
	assert_has(flags, 'set_hooks')

	assert_eq_deep(
		flags['pre_hook'],
		[
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks
				} ]
			],
			[
				Conductable.STR_HOOK_SET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ]
			],
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ]
			]
		]
	)

	assert_eq_deep(
		flags['post_hook'],
		[
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks
				} ]
			],
			[
				Conductable.STR_HOOK_SET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ]
			],
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ]
			]
		]
	)

	assert_eq_deep(
		flags['hooked'],
		[
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks
				} ],
				node
			],
			[
				Conductable.STR_HOOK_SET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				node
			],
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				node
			]
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_new_hooks')

	assert_eq_deep(
		flags['pre_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ]
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks
				},
				[]
			],
			[
				Conductable.STR_FILTER_NEW_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_SET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				[ Conductable.STR_HOOK_SET_HOOKS ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ]
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				},
				[]
			]
		]
	)

	assert_eq_deep(
		flags['post_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ]
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks
				},
				[]
			],
			[
				Conductable.STR_FILTER_NEW_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_SET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				[ Conductable.STR_HOOK_SET_HOOKS ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ]
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				},
				[]
			]
		]
	)

	assert_eq_deep(
		flags['filtered'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks
				} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks
				} ],
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ],
				node
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks
				},
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks
				},
				[],
				node
			],
			[
				Conductable.STR_FILTER_NEW_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				},
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				},
				[],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_SET_HOOKS,
				Conductable.STR_HOOK_SET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				[ Conductable.STR_HOOK_SET_HOOKS ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ],
				node
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				},
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_SET_HOOKS: set_hooks,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				},
				[],
				node
			]
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_HOOKS_SET,
		[
			{
				Conductable.STR_HOOK_PRE_HOOK: pre_hook,
				Conductable.STR_HOOK_POST_HOOK: post_hook,
				Conductable.STR_HOOK_PRE_FILTER: pre_filter,
				Conductable.STR_HOOK_POST_FILTER: post_filter,
				Conductable.STR_HOOK_GET_HOOKS: get_hooks,
				Conductable.STR_HOOK_SET_HOOKS: set_hooks,
				Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
			},
			{
				Conductable.STR_HOOK_PRE_HOOK: pre_hook,
				Conductable.STR_HOOK_POST_HOOK: post_hook,
				Conductable.STR_HOOK_PRE_FILTER: pre_filter,
				Conductable.STR_HOOK_POST_FILTER: post_filter,
				Conductable.STR_HOOK_GET_HOOKS: get_hooks,
				Conductable.STR_HOOK_SET_HOOKS: set_hooks
			},
			node
		],
		0
	)

	# state

	assert_eq(conductable.hooks, new_hooks)

	node.free()


func test_get_hooks() -> void:

	var node: Node = Node.new()

	# hooks
	var pre_hook    : FuncRef = funcref(self, 'pre_hook')
	var post_hook   : FuncRef = funcref(self, 'post_hook')
	var pre_filter  : FuncRef = funcref(self, 'pre_filter')
	var post_filter : FuncRef = funcref(self, 'post_filter')
	var get_hooks   : FuncRef = funcref(self, 'get_hooks')
	
	# filters
	var filter_filter_identifier : FuncRef = \
		funcref(self, 'filter_filter_identifier')
	var filter_filter_args_arr   : FuncRef = \
		funcref(self, 'filter_filter_args_arr')
	var filter_hook_identifier   : FuncRef = \
		funcref(self, 'filter_hook_identifier')
	var filter_hook_args_arr     : FuncRef = \
		funcref(self, 'filter_hook_args_arr')
	var filter_hooks             : FuncRef = funcref(self, 'filter_hooks')

	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
		Conductable.STR_FILTER_HOOKS: filter_hooks
	}

	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_GET_HOOKS: get_hooks
	}

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(
		node,
		filters,
		hooks
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	var the_hooks = conductable.hooks

	# hooks

	assert_has(flags, 'get_hooks')

	assert_eq_deep(
		flags['pre_hook'],
		[
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks
				} ]
			]
		]
	)

	assert_eq_deep(
		flags['post_hook'],
		[
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks
				} ]
			]
		]
	)

	assert_eq_deep(
		flags['hooked'],
		[
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks
				} ],
				node
			]
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_hooks')

	assert_eq_deep(
		flags['pre_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ]
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks
				},
				[]
			]
		]
	)

	assert_eq_deep(
		flags['post_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ]
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks
				},
				[]
			]
		]
	)

	assert_eq_deep(
		flags['filtered'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks
				} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks
				} ],
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ],
				node
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks
				},
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks
				},
				[],
				node
			]
		]
	)

	node.free()


func test_set_subs() -> void:

	var node: Node = Node.new()

	# hook
	var pre_hook    : FuncRef = funcref(self, 'pre_hook')
	var post_hook   : FuncRef = funcref(self, 'post_hook')
	var pre_filter  : FuncRef = funcref(self, 'pre_filter')
	var post_filter : FuncRef = funcref(self, 'post_filter')
	var get_subs    : FuncRef = funcref(self, 'get_subs')
	var set_subs    : FuncRef = funcref(self, 'set_subs')

	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_GET_SUBS: get_subs,
		Conductable.STR_HOOK_SET_SUBS: set_subs
	}

	# filters
	var filter_filter_identifier     : FuncRef = \
		funcref(self, 'filter_filter_identifier')
	var filter_filter_args_arr       : FuncRef = \
		funcref(self, 'filter_filter_args_arr')
	var filter_hook_identifier       : FuncRef = \
		funcref(self, 'filter_hook_identifier')
	var filter_hook_args_arr         : FuncRef = \
		funcref(self, 'filter_hook_args_arr')
	var filter_new_subs              : FuncRef = \
		funcref(self, 'filter_new_subs')

	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
		Conductable.STR_FILTER_NEW_SUBS: filter_new_subs
	}

	# subs
	var subs = {}

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(
		node,
		filters,
		hooks,
		subs
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	var remove_hook: FuncRef = funcref(self, 'remove_hook')

	var new_subs: Dictionary = {
		'remove_hook': remove_hook
	}

	conductable.subs = new_subs

	# hooks

	assert_has(flags, 'get_subs')
	assert_has(flags, 'set_subs')

	assert_eq_deep(
		flags['pre_hook'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ]
			],
			[
				Conductable.STR_HOOK_SET_SUBS,
				[ { 'remove_hook': remove_hook } ]
			],
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ { 'remove_hook': remove_hook } ]
			]
		]
	)

	assert_eq_deep(
		flags['post_hook'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ]
			],
			[
				Conductable.STR_HOOK_SET_SUBS,
				[ { 'remove_hook': remove_hook } ]
			],
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ { 'remove_hook': remove_hook } ]
			]
		]
	)

	assert_eq_deep(
		flags['hooked'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ],
				node
			],
			[
				Conductable.STR_HOOK_SET_SUBS,
				[ { 'remove_hook': remove_hook } ],
				node
			],
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ { 'remove_hook': remove_hook } ],
				node
			]
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_new_subs')

	assert_eq_deep(
		flags['pre_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ],
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				[]
			],
			[
				Conductable.STR_FILTER_NEW_SUBS,
				{ 'remove_hook': remove_hook },
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_SET_SUBS,
				[ [ { 'remove_hook': remove_hook } ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ { 'remove_hook': remove_hook } ],
				[ Conductable.STR_HOOK_SET_SUBS ],
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ { 'remove_hook': remove_hook } ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ { 'remove_hook': remove_hook } ],
				[ Conductable.STR_HOOK_GET_SUBS ],
			],
			[
				Conductable.STR_FILTER_SUBS,
				{ 'remove_hook': remove_hook },
				[]
			]
		]
	)

	assert_eq_deep(
		flags['post_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ],
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				[]
			],
			[
				Conductable.STR_FILTER_NEW_SUBS,
				{ 'remove_hook': remove_hook },
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_SET_SUBS,
				[ [ { 'remove_hook': remove_hook } ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ { 'remove_hook': remove_hook } ],
				[ Conductable.STR_HOOK_SET_SUBS ],
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ { 'remove_hook': remove_hook } ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ { 'remove_hook': remove_hook } ],
				[ Conductable.STR_HOOK_GET_SUBS ],
			],
			[
				Conductable.STR_FILTER_SUBS,
				{ 'remove_hook': remove_hook },
				[]
			]
		]
	)

	assert_eq_deep(
		flags['filtered'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ],
				node
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				{},
				[],
				node
			],
			[
				Conductable.STR_FILTER_NEW_SUBS,
				{ 'remove_hook': remove_hook },
				{ 'remove_hook': remove_hook },
				[],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_SET_SUBS,
				Conductable.STR_HOOK_SET_SUBS,
				[ [ { 'remove_hook': remove_hook } ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ { 'remove_hook': remove_hook } ],
				[ { 'remove_hook': remove_hook } ],
				[ Conductable.STR_HOOK_SET_SUBS ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ { 'remove_hook': remove_hook } ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ { 'remove_hook': remove_hook } ],
				[ { 'remove_hook': remove_hook } ],
				[ Conductable.STR_HOOK_GET_SUBS ],
				node
			],
			[
				Conductable.STR_FILTER_SUBS,
				{ 'remove_hook': remove_hook },
				{ 'remove_hook': remove_hook },
				[],
				node
			]
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_SUBS_SET,
		[
			{ 'remove_hook': remove_hook },
			{},
			node
		],
		0
	)

	# state

	assert_eq(conductable.subs, new_subs)

	node.free()


func test_get_subs() -> void:

	var node: Node = Node.new()

	# hooks
	var pre_hook    : FuncRef = funcref(self, 'pre_hook')
	var post_hook   : FuncRef = funcref(self, 'post_hook')
	var pre_filter  : FuncRef = funcref(self, 'pre_filter')
	var post_filter : FuncRef = funcref(self, 'post_filter')
	var get_subs    : FuncRef = funcref(self, 'get_subs')

	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_GET_SUBS: get_subs
	}

	# filters
	var filter_filter_identifier : FuncRef = \
		funcref(self, 'filter_filter_identifier')
	var filter_filter_args_arr   : FuncRef = \
		funcref(self, 'filter_filter_args_arr')
	var filter_hook_identifier   : FuncRef = \
		funcref(self, 'filter_hook_identifier')
	var filter_hook_args_arr     : FuncRef = \
		funcref(self, 'filter_hook_args_arr')
	var filter_subs              : FuncRef = funcref(self, 'filter_subs')

	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
		Conductable.STR_FILTER_SUBS: filter_subs
	}

	# subs
	var subs = {}

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(
		node,
		filters,
		hooks,
		subs
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	var the_subs = conductable.subs

	# hooks

	assert_has(flags, 'get_subs')

	assert_eq_deep(
		flags['pre_hook'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ]
			]
		]
	)

	assert_eq_deep(
		flags['post_hook'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ]
			]
		]
	)

	assert_eq_deep(
		flags['hooked'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ],
				node
			]
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_subs')

	assert_eq_deep(
		flags['pre_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				[]
			]
		]
	)

	assert_eq_deep(
		flags['post_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				[]
			]
		]
	)

	assert_eq_deep(
		flags['filtered'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ],
				node
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				{},
				[],
				node
			]
		]
	)

	node.free()


func test_add_filter() -> void:

	var node: Node = Node.new()

	# hooks
	var pre_hook        : FuncRef = funcref(self, 'pre_hook')
	var post_hook       : FuncRef = funcref(self, 'post_hook')
	var pre_filter      : FuncRef = funcref(self, 'pre_filter')
	var post_filter     : FuncRef = funcref(self, 'post_filter')
	var get_subs        : FuncRef = funcref(self, 'get_subs')
	var pre_add_filter  : FuncRef = funcref(self, 'pre_add_filter')
	var get_filters     : FuncRef = funcref(self, 'get_filters')
	var post_add_filter : FuncRef = funcref(self, 'post_add_filter')

	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_GET_SUBS: get_subs,
		Conductable.STR_HOOK_PRE_ADD_FILTER: pre_add_filter,
		Conductable.STR_HOOK_GET_FILTERS: get_filters,
		Conductable.STR_HOOK_POST_ADD_FILTER: post_add_filter
	}

	# filters
	var filter_filter_identifier     : FuncRef = \
		funcref(self, 'filter_filter_identifier')
	var filter_filter_args_arr       : FuncRef = \
		funcref(self, 'filter_filter_args_arr')
	var filter_hook_identifier       : FuncRef = \
		funcref(self, 'filter_hook_identifier')
	var filter_hook_args_arr         : FuncRef = \
		funcref(self, 'filter_hook_args_arr')
	var filter_subs                  : FuncRef = funcref(self, 'filter_subs')
	var filter_add_filter_identifier : FuncRef = \
		funcref(self, 'filter_add_filter_identifier')
	var filter_filters               : FuncRef = \
		funcref(self, 'filter_filters')
	var filter_add_filter_value      : FuncRef = \
		funcref(self, 'filter_add_filter_value')

	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
		Conductable.STR_FILTER_SUBS: filter_subs,
		Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
			filter_add_filter_identifier,
		Conductable.STR_FILTER_FILTERS: filter_filters,
		Conductable.STR_FILTER_ADD_FILTER_VALUE: filter_add_filter_value
	}

	# subs
	var subs: Dictionary = {}

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(
		node,
		filters,
		hooks,
		subs
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	var added_filter = funcref(self, 'filter_remove_filter_identifier')

	conductable.add_filter(
		Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
		added_filter
	)

	# hooks

	assert_has(flags, 'get_subs')
	assert_has(flags, 'pre_add_filter')
	assert_has(flags, 'get_filters')
	assert_has(flags, 'post_add_filter')

	assert_eq_deep(
		flags['pre_hook'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ]
			],
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ]
			],
			[
				Conductable.STR_HOOK_PRE_ADD_FILTER,
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				]
			],
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ]
			],
			[
				Conductable.STR_HOOK_POST_ADD_FILTER,
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				]
			]
		]
	)

	assert_eq_deep(
		flags['post_hook'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ subs ]
			],
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ]
			],
			[
				Conductable.STR_HOOK_PRE_ADD_FILTER,
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				]
			],
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ]
			],
			[
				Conductable.STR_HOOK_POST_ADD_FILTER,
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				]
			]
		]
	)

	assert_eq_deep(
		flags['hooked'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ],
				node
			],
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ],
				node
			],
			[
				Conductable.STR_HOOK_PRE_ADD_FILTER,
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				],
				node
			],
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ],
				node
			],
			[
				Conductable.STR_HOOK_POST_ADD_FILTER,
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				],
				node
			]
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_subs')
	assert_has(flags, 'filter_add_filter_identifier')
	assert_has(flags, 'filter_add_filter_value')
	assert_has(flags, 'filter_filters')

	assert_eq_deep(
		flags['pre_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ]
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				},
				[]
			],
			[
				Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
				Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
				[
					added_filter,
					{
						Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
						Conductable.STR_FILTER_SUBS: filter_subs,
						Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
							filter_add_filter_identifier,
						Conductable.STR_FILTER_FILTERS: filter_filters,
						Conductable.STR_FILTER_ADD_FILTER_VALUE: \
							filter_add_filter_value
					}
				]
			],
			[
				Conductable.STR_FILTER_ADD_FILTER_VALUE,
				added_filter,
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					{
						Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
						Conductable.STR_FILTER_FILTER_ARGS_ARR: \
							filter_filter_args_arr,
						Conductable.STR_FILTER_HOOK_IDENTIFIER: \
							filter_hook_identifier,
						Conductable.STR_FILTER_HOOK_ARGS_ARR: \
							filter_hook_args_arr,
						Conductable.STR_FILTER_SUBS: filter_subs,
						Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
							filter_add_filter_identifier,
						Conductable.STR_FILTER_FILTERS: filter_filters,
						Conductable.STR_FILTER_ADD_FILTER_VALUE: \
							filter_add_filter_value
					}
				]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_ADD_FILTER,
				[ [
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				],
				[ Conductable.STR_HOOK_PRE_ADD_FILTER ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ]
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_ADD_FILTER,
				[ [
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				],
				[ Conductable.STR_HOOK_POST_ADD_FILTER ]
			]
		]
	)

	assert_eq_deep(
		flags['post_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ]
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				},
				[]
			],
			[
				Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
				Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
				[
					added_filter,
					{
						Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
						Conductable.STR_FILTER_SUBS: filter_subs,
						Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
							filter_add_filter_identifier,
						Conductable.STR_FILTER_FILTERS: filter_filters,
						Conductable.STR_FILTER_ADD_FILTER_VALUE: \
							filter_add_filter_value
					}
				]
			],
			[
				Conductable.STR_FILTER_ADD_FILTER_VALUE,
				added_filter,
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					{
						Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
						Conductable.STR_FILTER_FILTER_ARGS_ARR: \
							filter_filter_args_arr,
						Conductable.STR_FILTER_HOOK_IDENTIFIER: \
							filter_hook_identifier,
						Conductable.STR_FILTER_HOOK_ARGS_ARR: \
							filter_hook_args_arr,
						Conductable.STR_FILTER_SUBS: filter_subs,
						Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
							filter_add_filter_identifier,
						Conductable.STR_FILTER_FILTERS: filter_filters,
						Conductable.STR_FILTER_ADD_FILTER_VALUE: \
							filter_add_filter_value
					}
				]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_ADD_FILTER,
				[ [
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				],
				[ Conductable.STR_HOOK_PRE_ADD_FILTER ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ]
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_ADD_FILTER,
				[ [
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				],
				[ Conductable.STR_HOOK_POST_ADD_FILTER ]
			]
		]
	)
	
	assert_eq_deep(
		flags['filtered'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ],
				node
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				{},
				[],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ],
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ],
				node
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				},
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE: \
						filter_add_filter_value
				},
				[],
				node
			],
			[
				Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
				Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
				Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
				[
					added_filter,
					{
						Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
						Conductable.STR_FILTER_FILTER_ARGS_ARR: \
							filter_filter_args_arr,
						Conductable.STR_FILTER_HOOK_IDENTIFIER: \
							filter_hook_identifier,
						Conductable.STR_FILTER_HOOK_ARGS_ARR: \
							filter_hook_args_arr,
						Conductable.STR_FILTER_SUBS: filter_subs,
						Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
							filter_add_filter_identifier,
						Conductable.STR_FILTER_FILTERS: filter_filters,
						Conductable.STR_FILTER_ADD_FILTER_VALUE: \
							filter_add_filter_value
					}
				],
				node
			],
			[
				Conductable.STR_FILTER_ADD_FILTER_VALUE,
				added_filter,
				added_filter,
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					{
						Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
						Conductable.STR_FILTER_FILTER_ARGS_ARR: \
							filter_filter_args_arr,
						Conductable.STR_FILTER_HOOK_IDENTIFIER: \
							filter_hook_identifier,
						Conductable.STR_FILTER_HOOK_ARGS_ARR: \
							filter_hook_args_arr,
						Conductable.STR_FILTER_SUBS: filter_subs,
						Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
							filter_add_filter_identifier,
						Conductable.STR_FILTER_FILTERS: filter_filters,
						Conductable.STR_FILTER_ADD_FILTER_VALUE: \
							filter_add_filter_value
					}
				],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_ADD_FILTER,
				Conductable.STR_HOOK_PRE_ADD_FILTER,
				[ [
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				],
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				],
				[ Conductable.STR_HOOK_PRE_ADD_FILTER ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER:
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE:
						filter_add_filter_value
				} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER:
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE:
						filter_add_filter_value
				} ],
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER:
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE:
						filter_add_filter_value
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ],
				node
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER:
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE:
						filter_add_filter_value
				},
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER:
						filter_add_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_ADD_FILTER_VALUE:
						filter_add_filter_value
				},
				[],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_ADD_FILTER,
				Conductable.STR_HOOK_POST_ADD_FILTER,
				[ [
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				],
				[
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
					added_filter
				],
				[ Conductable.STR_HOOK_POST_ADD_FILTER ],
				node
			]
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_FILTER_ADDED,
		[
			Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
			added_filter,
			node
		]
	)

	# state

	assert_has(
		conductable.filters,
		Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER
	)

	node.free()


func test_remove_filter() -> void:

	var node: Node = Node.new()

	# hooks
	var pre_hook           : FuncRef = funcref(self, 'pre_hook')
	var post_hook          : FuncRef = funcref(self, 'post_hook')
	var pre_filter         : FuncRef = funcref(self, 'pre_filter')
	var post_filter        : FuncRef = funcref(self, 'post_filter')
	var get_subs           : FuncRef = funcref(self, 'get_subs')
	var pre_remove_filter  : FuncRef = funcref(self, 'pre_remove_filter')
	var get_filters        : FuncRef = funcref(self, 'get_filters')
	var post_remove_filter : FuncRef = funcref(self, 'post_remove_filter')

	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_GET_SUBS: get_subs,
		Conductable.STR_HOOK_PRE_REMOVE_FILTER: pre_remove_filter,
		Conductable.STR_HOOK_GET_FILTERS: get_filters,
		Conductable.STR_HOOK_POST_REMOVE_FILTER: post_remove_filter
	}

	# filters
	var filter_filter_identifier        : FuncRef = \
		funcref(self, 'filter_filter_identifier')
	var filter_filter_args_arr          : FuncRef = \
		funcref(self, 'filter_filter_args_arr')
	var filter_hook_identifier          : FuncRef = \
		funcref(self, 'filter_hook_identifier')
	var filter_hook_args_arr            : FuncRef = \
		funcref(self, 'filter_hook_args_arr')
	var filter_subs                     : FuncRef = \
		funcref(self, 'filter_subs')
	var filter_remove_filter_identifier : FuncRef = \
		funcref(self, 'filter_remove_filter_identifier')
	var filter_filters                  : FuncRef = \
		funcref(self, 'filter_filters')
	var filter_remove_filter_value      : FuncRef = \
		funcref(self, 'filter_remove_filter_value')
	var filter_add_filter_identifier    : FuncRef = \
		funcref(self, 'filter_add_filter_identifier')

	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
		Conductable.STR_FILTER_SUBS: filter_subs,
		Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
			filter_remove_filter_identifier,
		Conductable.STR_FILTER_FILTERS: filter_filters,
		Conductable.STR_FILTER_REMOVE_FILTER_VALUE: filter_remove_filter_value,
		Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
			filter_add_filter_identifier
	}

	# subs
	var subs: Dictionary = {}

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(
		node,
		filters,
		hooks,
		subs
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	conductable.remove_filter(
		Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
		filter_add_filter_identifier
	)

	# hooks

	assert_has(flags, 'get_subs')
	assert_has(flags, 'pre_remove_filter')
	assert_has(flags, 'get_filters')
	assert_has(flags, 'post_remove_filter')

	assert_eq_deep(
		flags['pre_hook'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ]
			],
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ]
			],
			[
				Conductable.STR_HOOK_PRE_REMOVE_FILTER,
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				]
			],
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ]
			],
			[
				Conductable.STR_HOOK_POST_REMOVE_FILTER,
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				]
			]
		]
	)

	assert_eq_deep(
		flags['post_hook'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ subs ]
			],
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ]
			],
			[
				Conductable.STR_HOOK_PRE_REMOVE_FILTER,
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				]
			],
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ]
			],
			[
				Conductable.STR_HOOK_POST_REMOVE_FILTER,
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				]
			]
		]
	)

	assert_eq_deep(
		flags['hooked'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ],
				node
			],
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				node
			],
			[
				Conductable.STR_HOOK_PRE_REMOVE_FILTER,
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				],
				node
			],
			[
				Conductable.STR_HOOK_GET_FILTERS,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				node
			],
			[
				Conductable.STR_HOOK_POST_REMOVE_FILTER,
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				],
				node
			]
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_subs')
	assert_has(flags, 'filter_remove_filter_identifier')
	assert_has(flags, 'filter_remove_filter_value')
	assert_has(flags, 'filter_filters')

	assert_eq_deep(
		flags['pre_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				subs,
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ]
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				},
				[]
			],
			[
				Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
				Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
				[
					filter_add_filter_identifier,
					{
						Conductable.STR_FILTER_FILTER_IDENTIFIER: \
							filter_filter_identifier,
						Conductable.STR_FILTER_FILTER_ARGS_ARR: \
							filter_filter_args_arr,
						Conductable.STR_FILTER_HOOK_IDENTIFIER: \
							filter_hook_identifier,
						Conductable.STR_FILTER_HOOK_ARGS_ARR: \
							filter_hook_args_arr,
						Conductable.STR_FILTER_SUBS: filter_subs,
						Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
							filter_remove_filter_identifier,
						Conductable.STR_FILTER_FILTERS: filter_filters,
						Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
							filter_remove_filter_value,
						Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
							filter_add_filter_identifier
					}
				]
			],
			[
				Conductable.STR_FILTER_REMOVE_FILTER_VALUE,
				filter_add_filter_identifier,
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					{
						Conductable.STR_FILTER_FILTER_IDENTIFIER: \
							filter_filter_identifier,
						Conductable.STR_FILTER_FILTER_ARGS_ARR: \
							filter_filter_args_arr,
						Conductable.STR_FILTER_HOOK_IDENTIFIER: \
							filter_hook_identifier,
						Conductable.STR_FILTER_HOOK_ARGS_ARR: \
							filter_hook_args_arr,
						Conductable.STR_FILTER_SUBS: filter_subs,
						Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
							filter_remove_filter_identifier,
						Conductable.STR_FILTER_FILTERS: filter_filters,
						Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
							filter_remove_filter_value,
						Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
							filter_add_filter_identifier
					}
				]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_REMOVE_FILTER,
				[ [
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				],
				[ Conductable.STR_HOOK_PRE_REMOVE_FILTER ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ]
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_REMOVE_FILTER,
				[ [
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				],
				[ Conductable.STR_HOOK_POST_REMOVE_FILTER ]
			]
		]
	)

	assert_eq_deep(
		flags['post_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				subs,
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ]
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				},
				[]
			],
			[
				Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
				Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
				[
					filter_add_filter_identifier,
					{
						Conductable.STR_FILTER_FILTER_IDENTIFIER: \
							filter_filter_identifier,
						Conductable.STR_FILTER_FILTER_ARGS_ARR: \
							filter_filter_args_arr,
						Conductable.STR_FILTER_HOOK_IDENTIFIER: \
							filter_hook_identifier,
						Conductable.STR_FILTER_HOOK_ARGS_ARR: \
							filter_hook_args_arr,
						Conductable.STR_FILTER_SUBS: filter_subs,
						Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
							filter_remove_filter_identifier,
						Conductable.STR_FILTER_FILTERS: filter_filters,
						Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
							filter_remove_filter_value,
						Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
							filter_add_filter_identifier
					}
				]
			],
			[
				Conductable.STR_FILTER_REMOVE_FILTER_VALUE,
				filter_add_filter_identifier,
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					{
						Conductable.STR_FILTER_FILTER_IDENTIFIER: \
							filter_filter_identifier,
						Conductable.STR_FILTER_FILTER_ARGS_ARR: \
							filter_filter_args_arr,
						Conductable.STR_FILTER_HOOK_IDENTIFIER: \
							filter_hook_identifier,
						Conductable.STR_FILTER_HOOK_ARGS_ARR: \
							filter_hook_args_arr,
						Conductable.STR_FILTER_SUBS: filter_subs,
						Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
							filter_remove_filter_identifier,
						Conductable.STR_FILTER_FILTERS: filter_filters,
						Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
							filter_remove_filter_value,
						Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
							filter_add_filter_identifier
					}
				]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_REMOVE_FILTER,
				[ [
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				],
				[ Conductable.STR_HOOK_PRE_REMOVE_FILTER ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ]
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_REMOVE_FILTER,
				[ [
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				],
				[ Conductable.STR_HOOK_POST_REMOVE_FILTER ]
			]
		]
	)

	assert_eq_deep(
		flags['filtered'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ],
				node
			],
			[
				Conductable.STR_FILTER_SUBS,
				subs,
				subs,
				[],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ],
				node
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				},
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				},
				[],
				node
			],
			[
				Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
				Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
				Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
				[
					filter_add_filter_identifier,
					{
						Conductable.STR_FILTER_FILTER_IDENTIFIER: \
							filter_filter_identifier,
						Conductable.STR_FILTER_FILTER_ARGS_ARR: \
							filter_filter_args_arr,
						Conductable.STR_FILTER_HOOK_IDENTIFIER: \
							filter_hook_identifier,
						Conductable.STR_FILTER_HOOK_ARGS_ARR: \
							filter_hook_args_arr,
						Conductable.STR_FILTER_SUBS: filter_subs,
						Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
							filter_remove_filter_identifier,
						Conductable.STR_FILTER_FILTERS: filter_filters,
						Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
							filter_remove_filter_value,
						Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
							filter_add_filter_identifier
					},
				],
				node
			],
			[
				Conductable.STR_FILTER_REMOVE_FILTER_VALUE,
				filter_add_filter_identifier,
				filter_add_filter_identifier,
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					{
						Conductable.STR_FILTER_FILTER_IDENTIFIER: \
							filter_filter_identifier,
						Conductable.STR_FILTER_FILTER_ARGS_ARR: \
							filter_filter_args_arr,
						Conductable.STR_FILTER_HOOK_IDENTIFIER: \
							filter_hook_identifier,
						Conductable.STR_FILTER_HOOK_ARGS_ARR: \
							filter_hook_args_arr,
						Conductable.STR_FILTER_SUBS: filter_subs,
						Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
							filter_remove_filter_identifier,
						Conductable.STR_FILTER_FILTERS: filter_filters,
						Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
							filter_remove_filter_value,
						Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
							filter_add_filter_identifier
					}
				],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_REMOVE_FILTER,
				Conductable.STR_HOOK_PRE_REMOVE_FILTER,
				[ [
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				],
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				],
				[ Conductable.STR_HOOK_PRE_REMOVE_FILTER ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_FILTERS,
				Conductable.STR_HOOK_GET_FILTERS,
				[ [ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: 
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				[ {
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				} ],
				[ Conductable.STR_HOOK_GET_FILTERS ],
				node
			],
			[
				Conductable.STR_FILTER_FILTERS,
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				},
				{
					Conductable.STR_FILTER_FILTER_IDENTIFIER: \
						filter_filter_identifier,
					Conductable.STR_FILTER_FILTER_ARGS_ARR: \
						filter_filter_args_arr,
					Conductable.STR_FILTER_HOOK_IDENTIFIER: \
						filter_hook_identifier,
					Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
					Conductable.STR_FILTER_SUBS: filter_subs,
					Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
						filter_remove_filter_identifier,
					Conductable.STR_FILTER_FILTERS: filter_filters,
					Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
						filter_remove_filter_value,
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
						filter_add_filter_identifier
				},
				[],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_REMOVE_FILTER,
				Conductable.STR_HOOK_POST_REMOVE_FILTER,
				[ [
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				],
				[
					Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
					filter_add_filter_identifier
				],
				[ Conductable.STR_HOOK_POST_REMOVE_FILTER ],
				node
			]
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_FILTER_REMOVED,
		[
			Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
			filter_add_filter_identifier,
			node
		]
	)

	node.free()


func test_add_hook() -> void:

	var node: Node = Node.new()

	# hooks
	var pre_hook      : FuncRef = funcref(self, 'pre_hook')
	var post_hook     : FuncRef = funcref(self, 'post_hook')
	var pre_filter    : FuncRef = funcref(self, 'pre_filter')
	var post_filter   : FuncRef = funcref(self, 'post_filter')
	var get_subs      : FuncRef = funcref(self, 'get_subs')
	var pre_add_hook  : FuncRef = funcref(self, 'pre_add_hook')
	var get_hooks     : FuncRef = funcref(self, 'get_hooks')
	var post_add_hook : FuncRef = funcref(self, 'post_add_hook')

	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_GET_SUBS: get_subs,
		Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
		Conductable.STR_HOOK_GET_HOOKS: get_hooks,
		Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
	}

	# filters
	var filter_filter_identifier   : FuncRef = \
		funcref(self, 'filter_filter_identifier')
	var filter_filter_args_arr     : FuncRef = \
		funcref(self, 'filter_filter_args_arr')
	var filter_hook_identifier     : FuncRef = \
		funcref(self, 'filter_hook_identifier')
	var filter_hook_args_arr       : FuncRef = \
		funcref(self, 'filter_hook_args_arr')
	var filter_subs: FuncRef = funcref(self, 'filter_subs')
	var filter_add_hook_identifier : FuncRef = \
		funcref(self, 'filter_add_hook_identifier')
	var filter_hooks               : FuncRef = funcref(self, 'filter_hooks')
	var filter_add_hook_value      : FuncRef = \
		funcref(self, 'filter_add_hook_value')

	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
		Conductable.STR_FILTER_SUBS: filter_subs,
		Conductable.STR_FILTER_ADD_HOOK_IDENTIFIER: filter_add_hook_identifier,
		Conductable.STR_FILTER_HOOKS: filter_hooks,
		Conductable.STR_FILTER_ADD_HOOK_VALUE: filter_add_hook_value
	}

	# subs
	var subs: Dictionary = {}

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(
		node,
		filters,
		hooks,
		subs
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	var added_hook = funcref(self, 'pre_remove_hook')

	conductable.add_hook(
		Conductable.STR_HOOK_PRE_REMOVE_HOOK,
		added_hook
	)

	# hooks

	assert_has(flags, 'get_subs')
	assert_has(flags, 'pre_add_hook')
	assert_has(flags, 'get_hooks')
	assert_has(flags, 'post_add_hook')

	assert_eq_deep(
		flags['pre_hook'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ]
			],
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ]
			],
			[
				Conductable.STR_HOOK_PRE_ADD_HOOK,
				[
					Conductable.STR_HOOK_PRE_REMOVE_HOOK,
					added_hook
				]
			],
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ]
			],
			[
				Conductable.STR_HOOK_POST_ADD_HOOK,
				[
					Conductable.STR_HOOK_PRE_REMOVE_HOOK,
					added_hook
				]
			]
		]
	)

	assert_eq_deep(
		flags['post_hook'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ]
			],
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ]
			],
			[
				Conductable.STR_HOOK_PRE_ADD_HOOK,
				[
					Conductable.STR_HOOK_PRE_REMOVE_HOOK,
					added_hook
				]
			],
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ]
			],
			[
				Conductable.STR_HOOK_POST_ADD_HOOK,
				[
					Conductable.STR_HOOK_PRE_REMOVE_HOOK,
					added_hook
				]
			]
		]
	)

	assert_eq_deep(
		flags['hooked'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ],
				node
			],
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ],
				node
			],
			[
				Conductable.STR_HOOK_PRE_ADD_HOOK,
				[ Conductable.STR_HOOK_PRE_REMOVE_HOOK, added_hook ],
				node
			],
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ],
				node
			],
			[
				Conductable.STR_HOOK_POST_ADD_HOOK,
				[ Conductable.STR_HOOK_PRE_REMOVE_HOOK, added_hook ],
				node
			]
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_subs')
	assert_has(flags, 'filter_add_hook_identifier')
	assert_has(flags, 'filter_add_hook_value')
	assert_has(flags, 'filter_hooks')

	assert_eq_deep(
		flags['pre_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ]
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				},
				[]
			],
			[
				Conductable.STR_FILTER_ADD_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				[
					added_hook,
					{
						Conductable.STR_HOOK_PRE_HOOK: pre_hook,
						Conductable.STR_HOOK_POST_HOOK: post_hook,
						Conductable.STR_HOOK_PRE_FILTER: pre_filter,
						Conductable.STR_HOOK_POST_FILTER: post_filter,
						Conductable.STR_HOOK_GET_SUBS: get_subs,
						Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
						Conductable.STR_HOOK_GET_HOOKS: get_hooks,
						Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
					}
				]
			],
			[
				Conductable.STR_FILTER_ADD_HOOK_VALUE,
				added_hook,
				[
					Conductable.STR_HOOK_PRE_REMOVE_HOOK,
					{
						Conductable.STR_HOOK_PRE_HOOK: pre_hook,
						Conductable.STR_HOOK_POST_HOOK: post_hook,
						Conductable.STR_HOOK_PRE_FILTER: pre_filter,
						Conductable.STR_HOOK_POST_FILTER: post_filter,
						Conductable.STR_HOOK_GET_SUBS: get_subs,
						Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
						Conductable.STR_HOOK_GET_HOOKS: get_hooks,
						Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
					}
				]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_ADD_HOOK,
				[ [ Conductable.STR_HOOK_PRE_REMOVE_HOOK, added_hook ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ Conductable.STR_HOOK_PRE_REMOVE_HOOK, added_hook ],
				[ Conductable.STR_HOOK_PRE_ADD_HOOK ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ]
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_ADD_HOOK,
				[ [ Conductable.STR_HOOK_PRE_REMOVE_HOOK, added_hook ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ Conductable.STR_HOOK_PRE_REMOVE_HOOK, added_hook ],
				[ Conductable.STR_HOOK_POST_ADD_HOOK ]
			],
		]
	)

	assert_eq_deep(
		flags['post_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ]
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				},
				[]
			],
			[
				Conductable.STR_FILTER_ADD_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				[
					added_hook,
					{
						Conductable.STR_HOOK_PRE_HOOK: pre_hook,
						Conductable.STR_HOOK_POST_HOOK: post_hook,
						Conductable.STR_HOOK_PRE_FILTER: pre_filter,
						Conductable.STR_HOOK_POST_FILTER: post_filter,
						Conductable.STR_HOOK_GET_SUBS: get_subs,
						Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
						Conductable.STR_HOOK_GET_HOOKS: get_hooks,
						Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
					}
				]
			],
			[
				Conductable.STR_FILTER_ADD_HOOK_VALUE,
				added_hook,
				[
					Conductable.STR_HOOK_PRE_REMOVE_HOOK,
					{
						Conductable.STR_HOOK_PRE_HOOK: pre_hook,
						Conductable.STR_HOOK_POST_HOOK: post_hook,
						Conductable.STR_HOOK_PRE_FILTER: pre_filter,
						Conductable.STR_HOOK_POST_FILTER: post_filter,
						Conductable.STR_HOOK_GET_SUBS: get_subs,
						Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
						Conductable.STR_HOOK_GET_HOOKS: get_hooks,
						Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
					}
				]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_ADD_HOOK,
				[ [ Conductable.STR_HOOK_PRE_REMOVE_HOOK, added_hook ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ Conductable.STR_HOOK_PRE_REMOVE_HOOK, added_hook ],
				[ Conductable.STR_HOOK_PRE_ADD_HOOK ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ]
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_ADD_HOOK,
				[ [ Conductable.STR_HOOK_PRE_REMOVE_HOOK, added_hook ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ Conductable.STR_HOOK_PRE_REMOVE_HOOK, added_hook ],
				[ Conductable.STR_HOOK_POST_ADD_HOOK ]
			],
		]
	)

	assert_eq_deep(
		flags['filtered'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ],
				node
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				{},
				[],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ],
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ],
				node
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				},
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				},
				[],
				node
			],
			[
				Conductable.STR_FILTER_ADD_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				[
					added_hook,
					{
						Conductable.STR_HOOK_PRE_HOOK: pre_hook,
						Conductable.STR_HOOK_POST_HOOK: post_hook,
						Conductable.STR_HOOK_PRE_FILTER: pre_filter,
						Conductable.STR_HOOK_POST_FILTER: post_filter,
						Conductable.STR_HOOK_GET_SUBS: get_subs,
						Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
						Conductable.STR_HOOK_GET_HOOKS: get_hooks,
						Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
					}
				],
				node
			],
			[
				Conductable.STR_FILTER_ADD_HOOK_VALUE,
				added_hook,
				added_hook,
				[
					Conductable.STR_HOOK_PRE_REMOVE_HOOK,
					{
						Conductable.STR_HOOK_PRE_HOOK: pre_hook,
						Conductable.STR_HOOK_POST_HOOK: post_hook,
						Conductable.STR_HOOK_PRE_FILTER: pre_filter,
						Conductable.STR_HOOK_POST_FILTER: post_filter,
						Conductable.STR_HOOK_GET_SUBS: get_subs,
						Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
						Conductable.STR_HOOK_GET_HOOKS: get_hooks,
						Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
					}
				],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_ADD_HOOK,
				Conductable.STR_HOOK_PRE_ADD_HOOK,
				[ [ Conductable.STR_HOOK_PRE_REMOVE_HOOK, added_hook ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ Conductable.STR_HOOK_PRE_REMOVE_HOOK, added_hook ],
				[ Conductable.STR_HOOK_PRE_REMOVE_HOOK, added_hook ],
				[ Conductable.STR_HOOK_PRE_ADD_HOOK ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ],
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ],
				node
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				},
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_ADD_HOOK: post_add_hook
				},
				[],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_ADD_HOOK,
				Conductable.STR_HOOK_POST_ADD_HOOK,
				[ [ Conductable.STR_HOOK_PRE_REMOVE_HOOK, added_hook ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ Conductable.STR_HOOK_PRE_REMOVE_HOOK, added_hook ],
				[ Conductable.STR_HOOK_PRE_REMOVE_HOOK, added_hook ],
				[ Conductable.STR_HOOK_POST_ADD_HOOK ],
				node
			]
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_HOOK_ADDED,
		[
			Conductable.STR_HOOK_PRE_REMOVE_HOOK,
			added_hook,
			node
		]
	)

	# state

	assert_has(conductable.hooks, Conductable.STR_HOOK_PRE_REMOVE_HOOK)

	node.free()


func test_remove_hook() -> void:

	var node: Node = Node.new()

	# hooks
	var pre_hook         : FuncRef = funcref(self, 'pre_hook')
	var post_hook        : FuncRef = funcref(self, 'post_hook')
	var pre_filter       : FuncRef = funcref(self, 'pre_filter')
	var post_filter      : FuncRef = funcref(self, 'post_filter')
	var get_subs         : FuncRef = funcref(self, 'get_subs')
	var pre_remove_hook  : FuncRef = funcref(self, 'pre_remove_hook')
	var get_hooks        : FuncRef = funcref(self, 'get_hooks')
	var post_remove_hook : FuncRef = funcref(self, 'post_remove_hook')
	var pre_add_hook     : FuncRef = funcref(self, 'pre_add_hook')

	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_GET_SUBS: get_subs,
		Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
		Conductable.STR_HOOK_GET_HOOKS: get_hooks,
		Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
		Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
	}

	# filters
	var filter_filter_identifier      : FuncRef = \
		funcref(self, 'filter_filter_identifier')
	var filter_filter_args_arr        : FuncRef = \
		funcref(self, 'filter_filter_args_arr')
	var filter_hook_identifier        : FuncRef = \
		funcref(self, 'filter_hook_identifier')
	var filter_hook_args_arr          : FuncRef = \
		funcref(self, 'filter_hook_args_arr')
	var filter_subs                   : FuncRef = funcref(self, 'filter_subs')
	var filter_remove_hook_identifier : FuncRef = \
		funcref(self, 'filter_remove_hook_identifier')
	var filter_hooks                  : FuncRef = funcref(self, 'filter_hooks')
	var filter_remove_hook_value      : FuncRef = \
		funcref(self, 'filter_remove_hook_value')

	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
		Conductable.STR_FILTER_SUBS: filter_subs,
		Conductable.STR_FILTER_REMOVE_HOOK_IDENTIFIER: \
			filter_remove_hook_identifier,
		Conductable.STR_FILTER_HOOKS: filter_hooks,
		Conductable.STR_FILTER_REMOVE_HOOK_VALUE: filter_remove_hook_value
	}

	# subs
	var subs: Dictionary = {}

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(
		node,
		filters,
		hooks,
		subs
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	conductable.remove_hook(
		Conductable.STR_HOOK_PRE_ADD_HOOK,
		pre_add_hook
	)

	# hooks

	assert_has(flags, 'get_subs')
	assert_has(flags, 'pre_remove_hook')
	assert_has(flags, 'get_hooks')
	assert_has(flags, 'post_remove_hook')

	assert_eq_deep(
		flags['pre_hook'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ]
			],
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ]
			],
			[
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				[
					Conductable.STR_HOOK_PRE_ADD_HOOK,
					pre_add_hook
				]
			],
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ]
			],
			[
				Conductable.STR_HOOK_POST_REMOVE_HOOK,
				[
					Conductable.STR_HOOK_PRE_ADD_HOOK,
					pre_add_hook
				]
			]
		]
	)

	assert_eq_deep(
		flags['post_hook'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ]
			],
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ]
			],
			[
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				[
					Conductable.STR_HOOK_PRE_ADD_HOOK,
					pre_add_hook
				]
			],
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ]
			],
			[
				Conductable.STR_HOOK_POST_REMOVE_HOOK,
				[
					Conductable.STR_HOOK_PRE_ADD_HOOK,
					pre_add_hook
				]
			]
		]
	)

	assert_eq_deep(
		flags['hooked'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ],
				node
			],
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				node
			],
			[
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				[ Conductable.STR_HOOK_PRE_ADD_HOOK, pre_add_hook ],
				node
			],
			[
				Conductable.STR_HOOK_GET_HOOKS,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				node
			],
			[
				Conductable.STR_HOOK_POST_REMOVE_HOOK,
				[ Conductable.STR_HOOK_PRE_ADD_HOOK, pre_add_hook ],
				node
			]
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_subs')
	assert_has(flags, 'filter_remove_hook_identifier')
	assert_has(flags, 'filter_remove_hook_value')
	assert_has(flags, 'filter_hooks')

	assert_eq_deep(
		flags['pre_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ]
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				},
				[]
			],
			[
				Conductable.STR_FILTER_REMOVE_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_ADD_HOOK,
				[
					pre_add_hook,
					{
						Conductable.STR_HOOK_PRE_HOOK: pre_hook,
						Conductable.STR_HOOK_POST_HOOK: post_hook,
						Conductable.STR_HOOK_PRE_FILTER: pre_filter,
						Conductable.STR_HOOK_POST_FILTER: post_filter,
						Conductable.STR_HOOK_GET_SUBS: get_subs,
						Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
						Conductable.STR_HOOK_GET_HOOKS: get_hooks,
						Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
						Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
					}
				]
			],
			[
				Conductable.STR_FILTER_REMOVE_HOOK_VALUE,
				pre_add_hook,
				[
					Conductable.STR_HOOK_PRE_ADD_HOOK,
					{
						Conductable.STR_HOOK_PRE_HOOK: pre_hook,
						Conductable.STR_HOOK_POST_HOOK: post_hook,
						Conductable.STR_HOOK_PRE_FILTER: pre_filter,
						Conductable.STR_HOOK_POST_FILTER: post_filter,
						Conductable.STR_HOOK_GET_SUBS: get_subs,
						Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
						Conductable.STR_HOOK_GET_HOOKS: get_hooks,
						Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
						Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
					}
				]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				[ [ Conductable.STR_HOOK_PRE_ADD_HOOK, pre_add_hook ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ Conductable.STR_HOOK_PRE_ADD_HOOK, pre_add_hook ],
				[ Conductable.STR_HOOK_PRE_REMOVE_HOOK ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ]
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_REMOVE_HOOK,
				[ [ Conductable.STR_HOOK_PRE_ADD_HOOK, pre_add_hook ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ Conductable.STR_HOOK_PRE_ADD_HOOK, pre_add_hook ],
				[ Conductable.STR_HOOK_POST_REMOVE_HOOK ]
			],
		]
	)

	assert_eq_deep(
		flags['post_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ]
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				},
				[]
			],
			[
				Conductable.STR_FILTER_REMOVE_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_ADD_HOOK,
				[
					pre_add_hook,
					{
						Conductable.STR_HOOK_PRE_HOOK: pre_hook,
						Conductable.STR_HOOK_POST_HOOK: post_hook,
						Conductable.STR_HOOK_PRE_FILTER: pre_filter,
						Conductable.STR_HOOK_POST_FILTER: post_filter,
						Conductable.STR_HOOK_GET_SUBS: get_subs,
						Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
						Conductable.STR_HOOK_GET_HOOKS: get_hooks,
						Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
						Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
					}
				]
			],
			[
				Conductable.STR_FILTER_REMOVE_HOOK_VALUE,
				pre_add_hook,
				[
					Conductable.STR_HOOK_PRE_ADD_HOOK,
					{
						Conductable.STR_HOOK_PRE_HOOK: pre_hook,
						Conductable.STR_HOOK_POST_HOOK: post_hook,
						Conductable.STR_HOOK_PRE_FILTER: pre_filter,
						Conductable.STR_HOOK_POST_FILTER: post_filter,
						Conductable.STR_HOOK_GET_SUBS: get_subs,
						Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
						Conductable.STR_HOOK_GET_HOOKS: get_hooks,
						Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
						Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
					}
				]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				[ [ Conductable.STR_HOOK_PRE_ADD_HOOK, pre_add_hook ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ Conductable.STR_HOOK_PRE_ADD_HOOK, pre_add_hook ],
				[ Conductable.STR_HOOK_PRE_REMOVE_HOOK ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ]
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_REMOVE_HOOK,
				[ [ Conductable.STR_HOOK_PRE_ADD_HOOK, pre_add_hook ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ Conductable.STR_HOOK_PRE_ADD_HOOK, pre_add_hook ],
				[ Conductable.STR_HOOK_POST_REMOVE_HOOK ]
			],
		]
	)

	assert_eq_deep(
		flags['filtered'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ],
				node
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				{},
				[],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ],
				node
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				},
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				},
				[],
				node
			],
			[
				Conductable.STR_FILTER_REMOVE_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_ADD_HOOK,
				Conductable.STR_HOOK_PRE_ADD_HOOK,
				[
					pre_add_hook,
					{
						Conductable.STR_HOOK_PRE_HOOK: pre_hook,
						Conductable.STR_HOOK_POST_HOOK: post_hook,
						Conductable.STR_HOOK_PRE_FILTER: pre_filter,
						Conductable.STR_HOOK_POST_FILTER: post_filter,
						Conductable.STR_HOOK_GET_SUBS: get_subs,
						Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
						Conductable.STR_HOOK_GET_HOOKS: get_hooks,
						Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
						Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
					}
				],
				node
			],
			[
				Conductable.STR_FILTER_REMOVE_HOOK_VALUE,
				pre_add_hook,
				pre_add_hook,
				[
					Conductable.STR_HOOK_PRE_ADD_HOOK,
					{
						Conductable.STR_HOOK_PRE_HOOK: pre_hook,
						Conductable.STR_HOOK_POST_HOOK: post_hook,
						Conductable.STR_HOOK_PRE_FILTER: pre_filter,
						Conductable.STR_HOOK_POST_FILTER: post_filter,
						Conductable.STR_HOOK_GET_SUBS: get_subs,
						Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
						Conductable.STR_HOOK_GET_HOOKS: get_hooks,
						Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
						Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
					}
				],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				[ [ Conductable.STR_HOOK_PRE_ADD_HOOK, pre_add_hook ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ Conductable.STR_HOOK_PRE_ADD_HOOK, pre_add_hook ],
				[ Conductable.STR_HOOK_PRE_ADD_HOOK, pre_add_hook ],
				[ Conductable.STR_HOOK_PRE_REMOVE_HOOK ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_HOOKS,
				Conductable.STR_HOOK_GET_HOOKS,
				[ [ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				[ {
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				} ],
				[ Conductable.STR_HOOK_GET_HOOKS ],
				node
			],
			[
				Conductable.STR_FILTER_HOOKS,
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				},
				{
					Conductable.STR_HOOK_PRE_HOOK: pre_hook,
					Conductable.STR_HOOK_POST_HOOK: post_hook,
					Conductable.STR_HOOK_PRE_FILTER: pre_filter,
					Conductable.STR_HOOK_POST_FILTER: post_filter,
					Conductable.STR_HOOK_GET_SUBS: get_subs,
					Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook,
					Conductable.STR_HOOK_GET_HOOKS: get_hooks,
					Conductable.STR_HOOK_POST_REMOVE_HOOK: post_remove_hook,
					Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
				},
				[],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_REMOVE_HOOK,
				Conductable.STR_HOOK_POST_REMOVE_HOOK,
				[ [ Conductable.STR_HOOK_PRE_ADD_HOOK, pre_add_hook ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ Conductable.STR_HOOK_PRE_ADD_HOOK, pre_add_hook ],
				[ Conductable.STR_HOOK_PRE_ADD_HOOK, pre_add_hook ],
				[ Conductable.STR_HOOK_POST_REMOVE_HOOK ],
				node
			],
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_HOOK_REMOVED,
		[
			Conductable.STR_HOOK_PRE_ADD_HOOK,
			pre_add_hook,
			node
		]
	)

	node.free()


func test_add_sub() -> void:

	var node: Node = Node.new()

	# hooks
	var pre_hook     : FuncRef = funcref(self, 'pre_hook')
	var post_hook    : FuncRef = funcref(self, 'post_hook')
	var pre_filter   : FuncRef = funcref(self, 'pre_filter')
	var post_filter  : FuncRef = funcref(self, 'post_filter')
	var get_subs     : FuncRef = funcref(self, 'get_subs')
	var pre_add_sub  : FuncRef = funcref(self, 'pre_add_sub')
	var post_add_sub : FuncRef = funcref(self, 'post_add_sub')

	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_GET_SUBS: get_subs,
		Conductable.STR_HOOK_PRE_ADD_SUB: pre_add_sub,
		Conductable.STR_HOOK_POST_ADD_SUB: post_add_sub
	}

	# filters
	var filter_filter_identifier  : FuncRef = \
		funcref(self, 'filter_filter_identifier')
	var filter_filter_args_arr    : FuncRef = \
		funcref(self, 'filter_filter_args_arr')
	var filter_hook_identifier    : FuncRef = \
		funcref(self, 'filter_hook_identifier')
	var filter_hook_args_arr      : FuncRef = \
		funcref(self, 'filter_hook_args_arr')
	var filter_subs               : FuncRef = funcref(self, 'filter_subs')
	var filter_add_sub_identifier : FuncRef = \
		funcref(self, 'filter_add_sub_identifier')
	var filter_add_sub_value      : FuncRef = \
		funcref(self, 'filter_add_sub_value')

	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
		Conductable.STR_FILTER_SUBS: filter_subs,
		Conductable.STR_FILTER_ADD_SUB_IDENTIFIER: filter_add_sub_identifier,
		Conductable.STR_FILTER_ADD_SUB_VALUE: filter_add_sub_value
	}

	# subs
	var subs: Dictionary = {}

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(
		node,
		filters,
		hooks,
		subs
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	var added_sub = funcref(self, 'remove_hook')

	conductable.add_sub(
		'remove_hook',
		added_sub
	)

	# hooks

	assert_has(flags, 'get_subs')
	assert_has(flags, 'pre_add_sub')
	assert_has(flags, 'post_add_sub')

	assert_eq_deep(
		flags['pre_hook'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ]
			],
			[
				Conductable.STR_HOOK_PRE_ADD_SUB,
				[
					'remove_hook',
					added_sub
				]
			],
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ]
			],
			[
				Conductable.STR_HOOK_POST_ADD_SUB,
				[
					'remove_hook',
					added_sub
				]
			]
		]
	)

	assert_eq_deep(
		flags['post_hook'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ]
			],
			[
				Conductable.STR_HOOK_PRE_ADD_SUB,
				[
					'remove_hook',
					added_sub
				]
			],
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ]
			],
			[
				Conductable.STR_HOOK_POST_ADD_SUB,
				[
					'remove_hook',
					added_sub
				]
			]
		]
	)

	assert_eq_deep(
		flags['hooked'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ],
				node
			],
			[
				Conductable.STR_HOOK_PRE_ADD_SUB,
				[ 'remove_hook', added_sub ],
				node
			],
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ {} ],
				node
			],
			[
				Conductable.STR_HOOK_POST_ADD_SUB,
				[ 'remove_hook', added_sub ],
				node
			]
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_subs')
	assert_has(flags, 'filter_add_sub_identifier')
	assert_has(flags, 'filter_add_sub_value')

	assert_eq_deep(
		flags['pre_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				[]
			],
			[
				Conductable.STR_FILTER_ADD_SUB_IDENTIFIER,
				'remove_hook',
				[ added_sub, {} ]
			],
			[
				Conductable.STR_FILTER_ADD_SUB_VALUE,
				added_sub,
				[ 'remove_hook', {} ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_ADD_SUB,
				[ [ 'remove_hook', added_sub ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', added_sub ],
				[ Conductable.STR_HOOK_PRE_ADD_SUB ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_ADD_SUB,
				[ [ 'remove_hook', added_sub ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', added_sub ],
				[ Conductable.STR_HOOK_POST_ADD_SUB ]
			]
		]
	)

	assert_eq_deep(
		flags['post_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				[]
			],
			[
				Conductable.STR_FILTER_ADD_SUB_IDENTIFIER,
				'remove_hook',
				[ added_sub, {} ]
			],
			[
				Conductable.STR_FILTER_ADD_SUB_VALUE,
				added_sub,
				[ 'remove_hook', {} ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_ADD_SUB,
				[ [ 'remove_hook', added_sub ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', added_sub ],
				[ Conductable.STR_HOOK_PRE_ADD_SUB ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_ADD_SUB,
				[ [ 'remove_hook', added_sub ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', added_sub ],
				[ Conductable.STR_HOOK_POST_ADD_SUB ]
			]
		]
	)

	assert_eq_deep(
		flags['filtered'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ],
				node
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				{},
				[],
				node
			],
			[
				Conductable.STR_FILTER_ADD_SUB_IDENTIFIER,
				'remove_hook',
				'remove_hook',
				[ added_sub, {} ],
				node
			],
			[
				Conductable.STR_FILTER_ADD_SUB_VALUE,
				added_sub,
				added_sub,
				[ 'remove_hook', {} ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_ADD_SUB,
				Conductable.STR_HOOK_PRE_ADD_SUB,
				[ [ 'remove_hook', added_sub ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', added_sub ],
				[ 'remove_hook', added_sub ],
				[ Conductable.STR_HOOK_PRE_ADD_SUB ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ {} ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ {} ],
				[ {} ],
				[ Conductable.STR_HOOK_GET_SUBS ],
				node
			],
			[
				Conductable.STR_FILTER_SUBS,
				{},
				{},
				[],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_ADD_SUB,
				Conductable.STR_HOOK_POST_ADD_SUB,
				[ [ 'remove_hook', added_sub ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', added_sub ],
				[ 'remove_hook', added_sub ],
				[ Conductable.STR_HOOK_POST_ADD_SUB ],
				node
			]
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_SUB_ADDED,
		[
			'remove_hook',
			added_sub,
			node
		]
	)

	# state

	assert_has(conductable.subs, 'remove_hook')

	node.free()


func test_remove_sub() -> void:

	var node: Node = Node.new()

	# hooks
	var pre_hook        : FuncRef = funcref(self, 'pre_hook')
	var post_hook       : FuncRef = funcref(self, 'post_hook')
	var pre_filter      : FuncRef = funcref(self, 'pre_filter')
	var post_filter     : FuncRef = funcref(self, 'post_filter')
	var get_subs        : FuncRef = funcref(self, 'get_subs')
	var pre_remove_sub  : FuncRef = funcref(self, 'pre_remove_sub')
	var post_remove_sub : FuncRef = funcref(self, 'post_remove_sub')

	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_GET_SUBS: get_subs,
		Conductable.STR_HOOK_PRE_REMOVE_SUB: pre_remove_sub,
		Conductable.STR_HOOK_POST_REMOVE_SUB: post_remove_sub
	}

	# filters
	var filter_filter_identifier     : FuncRef = \
		funcref(self, 'filter_filter_identifier')
	var filter_filter_args_arr       : FuncRef = \
		funcref(self, 'filter_filter_args_arr')
	var filter_hook_identifier       : FuncRef = \
		funcref(self, 'filter_hook_identifier')
	var filter_hook_args_arr         : FuncRef = \
		funcref(self, 'filter_hook_args_arr')
	var filter_subs                  : FuncRef = funcref(self, 'filter_subs')
	var filter_remove_sub_identifier : FuncRef = \
		funcref(self, 'filter_remove_sub_identifier')
	var filter_remove_sub_value      : FuncRef = \
		funcref(self, 'filter_remove_sub_value')

	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
		Conductable.STR_FILTER_SUBS: filter_subs,
		Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER: \
			filter_remove_sub_identifier,
		Conductable.STR_FILTER_REMOVE_SUB_VALUE: filter_remove_sub_value
	}

	# subs
	var remove_hook: FuncRef = funcref(self, 'remove_hook')

	var subs: Dictionary = { 'remove_hook': remove_hook }

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(
		node,
		filters,
		hooks,
		subs
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	conductable.remove_sub('remove_hook')

	# hooks

	assert_has(flags, 'get_subs')
	assert_has(flags, 'pre_remove_sub')
	assert_has(flags, 'post_remove_sub')

	assert_eq_deep(
		flags['pre_hook'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ { 'remove_hook': remove_hook } ]
			],
			[
				Conductable.STR_HOOK_PRE_REMOVE_SUB,
				[ 'remove_hook', remove_hook ]
			],
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ { 'remove_hook': remove_hook } ]
			],
			[
				Conductable.STR_HOOK_POST_REMOVE_SUB,
				[ 'remove_hook', remove_hook ]
			]
		]
	)

	assert_eq_deep(
		flags['post_hook'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ { 'remove_hook': remove_hook } ]
			],
			[
				Conductable.STR_HOOK_PRE_REMOVE_SUB,
				[ 'remove_hook', remove_hook ]
			],
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ { 'remove_hook': remove_hook } ]
			],
			[
				Conductable.STR_HOOK_POST_REMOVE_SUB,
				[ 'remove_hook', remove_hook ]
			]
		]
	)

	assert_eq_deep(
		flags['hooked'],
		[
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ { 'remove_hook': remove_hook } ],
				node
			],
			[
				Conductable.STR_HOOK_PRE_REMOVE_SUB,
				[ 'remove_hook', remove_hook ],
				node
			],
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ { 'remove_hook': remove_hook } ],
				node
			],
			[
				Conductable.STR_HOOK_POST_REMOVE_SUB,
				[ 'remove_hook', remove_hook ],
				node
			]
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_subs')
	assert_has(flags, 'filter_remove_sub_identifier')
	assert_has(flags, 'filter_remove_sub_value')

	assert_eq_deep(
		flags['pre_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ { 'remove_hook': remove_hook } ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ { 'remove_hook': remove_hook } ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{ 'remove_hook': remove_hook },
				[]
			],
			[
				Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER,
				'remove_hook',
				[ remove_hook, { 'remove_hook': remove_hook } ]
			],
			[
				Conductable.STR_FILTER_REMOVE_SUB_VALUE,
				remove_hook,
				[ 'remove_hook', { 'remove_hook': remove_hook } ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_REMOVE_SUB,
				[ [ 'remove_hook', remove_hook ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', remove_hook ],
				[ Conductable.STR_HOOK_PRE_REMOVE_SUB ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ { 'remove_hook': remove_hook } ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ { 'remove_hook': remove_hook } ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{ 'remove_hook': remove_hook },
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_REMOVE_SUB,
				[ [ 'remove_hook', remove_hook ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', remove_hook ],
				[ Conductable.STR_HOOK_POST_REMOVE_SUB ]
			]
		]
	)

	assert_eq_deep(
		flags['post_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ { 'remove_hook': remove_hook } ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ { 'remove_hook': remove_hook } ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{ 'remove_hook': remove_hook },
				[]
			],
			[
				Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER,
				'remove_hook',
				[ remove_hook, { 'remove_hook': remove_hook } ]
			],
			[
				Conductable.STR_FILTER_REMOVE_SUB_VALUE,
				remove_hook,
				[ 'remove_hook', { 'remove_hook': remove_hook } ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_REMOVE_SUB,
				[ [ 'remove_hook', remove_hook ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', remove_hook ],
				[ Conductable.STR_HOOK_PRE_REMOVE_SUB ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ { 'remove_hook': remove_hook } ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ { 'remove_hook': remove_hook } ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{ 'remove_hook': remove_hook },
				[]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_REMOVE_SUB,
				[ [ 'remove_hook', remove_hook ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', remove_hook ],
				[ Conductable.STR_HOOK_POST_REMOVE_SUB ]
			]
		]
	)

	assert_eq_deep(
		flags['filtered'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ { 'remove_hook': remove_hook } ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ { 'remove_hook': remove_hook } ],
				[ { 'remove_hook': remove_hook } ],
				[ Conductable.STR_HOOK_GET_SUBS ],
				node
			],
			[
				Conductable.STR_FILTER_SUBS,
				{ 'remove_hook': remove_hook },
				{ 'remove_hook': remove_hook },
				[],
				node
			],
			[
				Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER,
				'remove_hook',
				'remove_hook',
				[ remove_hook, { 'remove_hook': remove_hook } ],
				node
			],
			[
				Conductable.STR_FILTER_REMOVE_SUB_VALUE,
				remove_hook,
				remove_hook,
				[ 'remove_hook', { 'remove_hook': remove_hook } ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_REMOVE_SUB,
				Conductable.STR_HOOK_PRE_REMOVE_SUB,
				[ [ 'remove_hook', remove_hook ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', remove_hook ],
				[ 'remove_hook', remove_hook ],
				[ Conductable.STR_HOOK_PRE_REMOVE_SUB ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ { 'remove_hook': remove_hook } ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ { 'remove_hook': remove_hook } ],
				[ { 'remove_hook': remove_hook } ],
				[ Conductable.STR_HOOK_GET_SUBS ],
				node
			],
			[
				Conductable.STR_FILTER_SUBS,
				{ 'remove_hook': remove_hook },
				{ 'remove_hook': remove_hook },
				[],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_REMOVE_SUB,
				Conductable.STR_HOOK_POST_REMOVE_SUB,
				[ [ 'remove_hook', remove_hook ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', remove_hook ],
				[ 'remove_hook', remove_hook ],
				[ Conductable.STR_HOOK_POST_REMOVE_SUB ],
				node
			]
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_SUB_REMOVED,
		[
			'remove_hook',
			remove_hook,
			node
		]
	)

	node.free()


func test_filter() -> void:

	var node: Node = Node.new()

	# hooks
	var pre_filter  : FuncRef = funcref(self, 'pre_filter')
	var post_filter : FuncRef = funcref(self, 'post_filter')

	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter
	}

	# filters
	var filter_filter_identifier            : FuncRef = \
		funcref(self, 'filter_filter_identifier')
	var filter_filter_args_arr              : FuncRef = \
		funcref(self, 'filter_filter_args_arr')
	var filter_remove_sub_identifier_change : FuncRef = \
		funcref(self, 'filter_remove_sub_identifier_change')

	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER: \
			filter_remove_sub_identifier_change,
	}

	# subs
	var subs: Dictionary = {}

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(
		node,
		filters,
		hooks,
		subs
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	var sub_identifier = conductable.filter(
		Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER,
		'sub_identifier',
		[ filter_remove_sub_identifier_change, {} ]
	)

	# hooks

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_remove_sub_identifier')

	assert_eq_deep(
		flags['pre_filter'],
		[
			[
				Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER,
				'sub_identifier',
				[ filter_remove_sub_identifier_change, {} ]
			]
		]
	)

	assert_eq_deep(
		flags['post_filter'],
		[
			[
				Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER,
				'sub_identifier__filtered',
				[ filter_remove_sub_identifier_change, {} ]
			]
		]
	)

	assert_eq_deep(
		flags['filtered'],
		[
			[
				Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER,
				'sub_identifier',
				'sub_identifier__filtered',
				[ filter_remove_sub_identifier_change, {} ],
				node
			]
		]
	)

	node.free()


func test_hook() -> void:

	var node: Node = Node.new()

	# hooks
	var pre_filter      : FuncRef = funcref(self, 'pre_filter')
	var post_filter     : FuncRef = funcref(self, 'post_filter')
	var pre_hook        : FuncRef = funcref(self, 'pre_hook')
	var post_hook       : FuncRef = funcref(self, 'post_hook')
	var pre_remove_hook : FuncRef = funcref(self, 'pre_remove_hook')

	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_PRE_REMOVE_HOOK: pre_remove_hook
	}

	# filters
	var filter_filter_identifier : FuncRef = \
		funcref(self, 'filter_filter_identifier')
	var filter_filter_args_arr   : FuncRef = \
		funcref(self, 'filter_filter_args_arr')
	var filter_hook_identifier   : FuncRef = \
		funcref(self, 'filter_hook_identifier')
	var filter_hook_args_arr     : FuncRef = \
		funcref(self, 'filter_hook_args_arr')

	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr
	}

	# subs
	var subs: Dictionary = {}

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(
		node,
		filters,
		hooks,
		subs
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	var funcr: FuncRef = funcref(self, 'pre_remove_hook')

	conductable.hook(
		Conductable.STR_HOOK_PRE_REMOVE_HOOK,
		[ 'hook_identifier', funcr ]
	)

	# hooks

	assert_has(flags, 'pre_hook')
	assert_has(flags, 'post_hook')
	assert_has(flags, 'pre_remove_hook')

	assert_eq_deep(
		flags['pre_hook'],
		[
			[
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				[ 'hook_identifier', funcr ]
			]
		]
	)

	assert_eq_deep(
		flags['post_hook'],
		[
			[
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				[ 'hook_identifier', funcr ]
			]
		]
	)

	assert_eq_deep(
		flags['hooked'],
		[
			[
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				[ 'hook_identifier', funcr ],
				node
			]
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')

	assert_eq_deep(
		flags['pre_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				[ [ 'hook_identifier', funcr ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'hook_identifier', funcr ],
				[ Conductable.STR_HOOK_PRE_REMOVE_HOOK ]
			]
		]
	)

	assert_eq_deep(
		flags['post_filter'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				[ [ 'hook_identifier', funcr ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'hook_identifier', funcr ],
				[ Conductable.STR_HOOK_PRE_REMOVE_HOOK ]
			]
		]
	)

	assert_eq_deep(
		flags['filtered'],
		[
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				Conductable.STR_HOOK_PRE_REMOVE_HOOK,
				[ [ 'hook_identifier', funcr ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'hook_identifier', funcr ],
				[ 'hook_identifier', funcr ],
				[ Conductable.STR_HOOK_PRE_REMOVE_HOOK ],
				node
			]
		]
	)

	node.free()


func test_sub() -> void:

	var node: Node = Node.new()

	# hooks
	var pre_filter  : FuncRef = funcref(self, 'pre_filter')
	var post_filter : FuncRef = funcref(self, 'post_filter')
	var pre_hook    : FuncRef = funcref(self, 'pre_hook')
	var post_hook   : FuncRef = funcref(self, 'post_hook')
	var pre_sub     : FuncRef = funcref(self, 'pre_sub')
	var post_sub    : FuncRef = funcref(self, 'post_sub')

	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_PRE_SUB: pre_sub,
		Conductable.STR_HOOK_POST_SUB: post_sub
	}

	# filters
	var filter_filter_identifier : FuncRef = \
		funcref(self, 'filter_filter_identifier')
	var filter_filter_args_arr   : FuncRef = \
		funcref(self, 'filter_filter_args_arr')
	var filter_hook_identifier   : FuncRef = \
		funcref(self, 'filter_hook_identifier')
	var filter_hook_args_arr     : FuncRef = \
		funcref(self, 'filter_hook_args_arr')
	var filter_sub_identifier    : FuncRef = \
		funcref(self, 'filter_sub_identifier')
	var filter_sub_args_arr      : FuncRef = \
		funcref(self, 'filter_sub_args_arr')
	var filter_sub_action        : FuncRef = \
		funcref(self, 'filter_sub_action')

	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
		Conductable.STR_FILTER_SUB_IDENTIFIER: filter_sub_identifier,
		Conductable.STR_FILTER_SUB_ARGS_ARR: filter_sub_args_arr,
		Conductable.STR_FILTER_SUB_ACTION: filter_sub_action
	}

	# subs
	var remove_hook: FuncRef = funcref(self, 'remove_hook')

	var subs: Dictionary = {
		'remove_hook': remove_hook
	}

	var conductable: PressAccept_Conductor_Conductable = Conductable.new(
		node,
		filters,
		hooks,
		subs
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	var funcr: FuncRef = funcref(self, 'remove_hook')

	var return_value = conductable.sub(
		'remove_hook',
		[ 'hook_identifier', funcr ]
	)

	# hooks

	assert_has(flags, 'pre_sub')
	assert_has(flags, 'post_sub')
	assert_has(flags, 'remove_hook')

	assert_eq_deep(
		flags['pre_hook'],
		[
			[
				Conductable.STR_HOOK_PRE_SUB,
				[ 'remove_hook', [ 'hook_identifier', funcr ] ],
			],
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ { 'remove_hook': remove_hook } ]
			],
			[
				Conductable.STR_HOOK_POST_SUB,
				[ 'remove_hook', [ 'hook_identifier', funcr ], null ]
			]
		]
	)

	assert_eq_deep(
		flags['post_hook'],
		[
			[
				Conductable.STR_HOOK_PRE_SUB,
				[ 'remove_hook', [ 'hook_identifier', funcr ] ],
			],
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ { 'remove_hook': remove_hook } ]
			],
			[
				Conductable.STR_HOOK_POST_SUB,
				[ 'remove_hook', [ 'hook_identifier', funcr ], null ]
			]
		]
	)

	assert_eq_deep(
		flags['hooked'],
		[
			[
				Conductable.STR_HOOK_PRE_SUB,
				[ 'remove_hook', [ 'hook_identifier', funcr ] ],
				node
			],
			[
				Conductable.STR_HOOK_GET_SUBS,
				[ { 'remove_hook': remove_hook } ],
				node
			],
			[
				Conductable.STR_HOOK_POST_SUB,
				[ 'remove_hook', [ 'hook_identifier', funcr ], null ],
				node
			]
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_sub_identifier')
	assert_has(flags, 'filter_sub_args_arr')

	assert_eq_deep(
		flags['pre_filter'],
		[
			[
				Conductable.STR_FILTER_SUB_IDENTIFIER,
				'remove_hook',
				[ [ 'hook_identifier', funcr ] ]
			],
			[
				Conductable.STR_FILTER_SUB_ARGS_ARR,
				[ 'hook_identifier', funcr ],
				[ 'remove_hook' ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_SUB,
				[ [ 'remove_hook', [ 'hook_identifier', funcr ] ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', [ 'hook_identifier', funcr ] ],
				[ Conductable.STR_HOOK_PRE_SUB ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ { 'remove_hook': remove_hook } ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ { 'remove_hook': remove_hook } ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{ 'remove_hook': remove_hook },
				[]
			],
			[
				Conductable.STR_FILTER_SUB_ACTION,
				remove_hook,
				[ 'remove_hook', [ 'hook_identifier', funcr ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_SUB,
				[ [ 'remove_hook', [ 'hook_identifier', funcr ], null ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', [ 'hook_identifier', funcr ], null ],
				[ Conductable.STR_HOOK_POST_SUB ]
			]
		]
	)

	assert_eq_deep(
		flags['post_filter'],
		[
			[
				Conductable.STR_FILTER_SUB_IDENTIFIER,
				'remove_hook',
				[ [ 'hook_identifier', funcr ] ]
			],
			[
				Conductable.STR_FILTER_SUB_ARGS_ARR,
				[ 'hook_identifier', funcr ],
				[ 'remove_hook' ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_SUB,
				[ [ 'remove_hook', [ 'hook_identifier', funcr ] ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', [ 'hook_identifier', funcr ] ],
				[ Conductable.STR_HOOK_PRE_SUB ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ { 'remove_hook': remove_hook } ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ { 'remove_hook': remove_hook } ],
				[ Conductable.STR_HOOK_GET_SUBS ]
			],
			[
				Conductable.STR_FILTER_SUBS,
				{ 'remove_hook': remove_hook },
				[]
			],
			[
				Conductable.STR_FILTER_SUB_ACTION,
				remove_hook,
				[ 'remove_hook', [ 'hook_identifier', funcr ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_SUB,
				[ [ 'remove_hook', [ 'hook_identifier', funcr ], null ] ]
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', [ 'hook_identifier', funcr ], null ],
				[ Conductable.STR_HOOK_POST_SUB ]
			]
		]
	)

	assert_eq_deep(
		flags['filtered'],
		[
			[
				Conductable.STR_FILTER_SUB_IDENTIFIER,
				'remove_hook',
				'remove_hook',
				[ [ 'hook_identifier', funcr ] ],
				node
			],
			[
				Conductable.STR_FILTER_SUB_ARGS_ARR,
				[ 'hook_identifier', funcr ],
				[ 'hook_identifier', funcr ],
				[ 'remove_hook' ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_PRE_SUB,
				Conductable.STR_HOOK_PRE_SUB,
				[ [ 'remove_hook', [ 'hook_identifier', funcr ] ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', [ 'hook_identifier', funcr ] ],
				[ 'remove_hook', [ 'hook_identifier', funcr ] ],
				[ Conductable.STR_HOOK_PRE_SUB ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_GET_SUBS,
				Conductable.STR_HOOK_GET_SUBS,
				[ [ { 'remove_hook': remove_hook } ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ { 'remove_hook': remove_hook } ],
				[ { 'remove_hook': remove_hook } ],
				[ Conductable.STR_HOOK_GET_SUBS ],
				node
			],
			[
				Conductable.STR_FILTER_SUBS,
				{ 'remove_hook': remove_hook },
				{ 'remove_hook': remove_hook },
				[],
				node
			],
			[
				Conductable.STR_FILTER_SUB_ACTION,
				remove_hook,
				remove_hook,
				[ 'remove_hook', [ 'hook_identifier', funcr ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_IDENTIFIER,
				Conductable.STR_HOOK_POST_SUB,
				Conductable.STR_HOOK_POST_SUB,
				[ [ 'remove_hook', [ 'hook_identifier', funcr ], null ] ],
				node
			],
			[
				Conductable.STR_FILTER_HOOK_ARGS_ARR,
				[ 'remove_hook', [ 'hook_identifier', funcr ], null ],
				[ 'remove_hook', [ 'hook_identifier', funcr ], null ],
				[ Conductable.STR_HOOK_POST_SUB ],
				node
			]
		]
	)

	node.free()

