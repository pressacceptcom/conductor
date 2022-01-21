extends 'res://addons/gut/test.gd'

# note: replace line 86 - 88 of strutils:
#
# 		if thing.get_script().resource_path:	<---
#			var dict = inst2dict(thing)
#			filename = _get_filename(dict['@path'])
#			if(dict['@subpath'] != ''):
#				filename += str('/', dict['@subpath'])
#

# |---------|
# | Imports |
# |---------|

# see test/Utilities.gd
var TestUtilities : Script = PressAccept_Conductor_Test_Utilities
# shorthand for our library class
var Conductable   : Script = PressAccept_Conductor_Conductable
# concerete container for our library class
var Conducted     : Script = PressAccept_Conductor_Conducted

var flags: Dictionary = {}

# |-------|
# | Tests |
# |-------|


func test_hookable() -> void:

	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate()

	var exception: PressAccept_Error_Exception = \
		PressAccept_Error_Exception.new()

	assert_true(Conductable.hookable(conductable))
	assert_false(Conductable.hookable(exception))


func test_filterable() -> void:

	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate()

	var exception: PressAccept_Error_Exception = \
		PressAccept_Error_Exception.new()

	assert_true(Conductable.filterable(conductable))
	assert_false(Conductable.filterable(exception))


func test_get_all_hook_constants() -> void:

	assert_eq_shallow(
		Conductable.get_all_hook_constants(
			'res://addons/PressAccept/Conductor/Conductable.gd'
		),
		{
			'STR_HOOK_BASE': Conductable.STR_HOOK_BASE,
			'STR_HOOK_OUTPUT': Conductable.STR_HOOK_OUTPUT,
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
			'STR_FILTER_OUTPUT': Conductable.STR_FILTER_OUTPUT,
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

func set_filters(
		new_filters: Dictionary,
		old_filters: Dictionary,
		_self) -> void:

	flags['set_filters'] = [
		new_filters,
		old_filters
	]


func get_filters(
		the_filters: Dictionary,
		_self) -> void:

	if not 'get_filters' in flags:
		flags['get_filters'] = []
	
	flags['get_filters'].append(the_filters)


func set_hooks(
		new_hooks: Dictionary,
		old_hooks: Dictionary,
		_self) -> void:

	flags['set_hooks'] = [
		new_hooks,
		old_hooks
	]


func get_hooks(
		the_hooks: Dictionary,
		_self) -> void:

	if not 'get_hooks' in flags:
		flags['get_hooks'] = []

	flags['get_hooks'].append(the_hooks)


func set_subs(
		new_subs: Dictionary,
		old_subs: Dictionary,
		_self) -> void:

	flags['set_subs'] = [
		new_subs,
		old_subs
	]


func get_subs(
		the_subs: Dictionary,
		_self) -> void:

	if not 'get_subs' in flags:
		flags['get_subs'] = []

	flags['get_subs'].append(the_subs)


func pre_add_filter(
		filter_identifier : String,
		filter_value,
		priority_int      : int,
		_self) -> void:

	flags['pre_add_filter'] = true


func post_add_filter(
		filter_identifier : String,
		filter_value,
		priority_int      : int,
		_self) -> void:

	flags['post_add_filter'] = true


func pre_remove_filter(
		filter_identifier : String,
		filter_value,
		priority_int      : int,
		_self) -> void:

	flags['pre_remove_filter'] = true


func post_remove_filter(
		filter_identifier : String,
		filter_value,
		priority_int      : int,
		_self) -> void:

	flags['post_remove_filter'] = true


func pre_add_hook(
		hook_identifier : String,
		hook_value,
		priority_int    : int,
		_self) -> void:

	flags['pre_add_hook'] = true


func post_add_hook(
		hook_identifier : String,
		hook_value,
		priority_int    : int,
		_self) -> void:

	flags['post_add_hook'] = true


func pre_remove_hook(
		hook_identifier : String,
		hook_value,
		priority_int    : int,
		_self) -> void:

	flags['pre_remove_hook'] = true


func post_remove_hook(
		hook_identifier : String,
		hook_value,
		priority_int    : int,
		_self) -> void:

	flags['post_remove_hook'] = true


func pre_add_sub(
		sub_identifier: String,
		sub_value,
		_self) -> void:

	flags['pre_add_sub'] = true


func post_add_sub(
		sub_identifier: String,
		sub_value,
		_self) -> void:

	flags['post_add_sub'] = true


func pre_remove_sub(
		sub_identifier: String,
		sub_value,
		_self) -> void:

	flags['pre_remove_sub'] = true


func post_remove_sub(
		sub_identifier: String,
		sub_value,
		_self) -> void:

	flags['post_remove_sub'] = true


func pre_sub(
		sub_identifier : String,
		args_arr       : Array,
		action,
		_self) -> void:

	flags['pre_sub'] = true


func post_sub(
		sub_identifier : String,
		args_arr       : Array,
		action,
		return_value,
		_self) -> void:

	flags['post_sub'] = true


func pre_hook(
		hook_identifier : String,
		args_arr        : Array,
		_self) -> void:

	if not 'pre_hook' in flags:
		flags['pre_hook'] = []

	if not ('/pre_filter' in hook_identifier \
			or '/post_filter' in hook_identifier):
		flags['pre_hook'].append(hook_identifier)


func post_hook(
		hook_identifier : String,
		args_arr        : Array,
		_self) -> void:

	if not 'post_hook' in flags:
		flags['post_hook'] = []

	if not ('/pre_filter' in hook_identifier \
			or '/post_filter' in hook_identifier):
		flags['post_hook'].append(hook_identifier)


func _pre_hook(
		hook_identifier : String,
		args_arr        : Array,
		_self) -> void:

	if not 'pre_hook' in flags:
		flags['pre_hook'] = []

	flags['pre_hook'].append(hook_identifier)


func _post_hook(
		hook_identifier : String,
		args_arr        : Array,
		_self) -> void:

	if not 'post_hook' in flags:
		flags['post_hook'] = []

	flags['post_hook'].append(hook_identifier)


func pre_filter(
		filter_identifier : String,
		input,
		args_arr          : Array,
		_self) -> void:

	if not 'pre_filter' in flags:
		flags['pre_filter'] = []

	flags['pre_filter'].append(filter_identifier)


func post_filter(
		filter_identifier : String,
		input,
		output,
		args_arr          : Array,
		_self) -> void:

	if not 'post_filter' in flags:
		flags['post_filter'] = []

	flags['post_filter'].append(filter_identifier)


# filters


func filter_new_filters(
		new_filters: Dictionary,
		_self) -> Dictionary:

	flags['filter_new_filters'] = new_filters

	return new_filters


func filter_filters(
		the_filters: Dictionary,
		_self) -> Dictionary:

	flags['filter_filters'] = true

	return the_filters


func filter_new_hooks(
		new_hooks: Dictionary,
		_self) -> Dictionary:

	flags['filter_new_hooks'] = true

	return new_hooks


func filter_hooks(
		the_hooks: Dictionary,
		_self) -> Dictionary:

	flags['filter_hooks'] = true

	return the_hooks


func filter_new_subs(
		new_subs: Dictionary,
		_self) -> Dictionary:

	flags['filter_new_subs'] = true

	return new_subs


func filter_subs(
		the_subs: Dictionary,
		_self) -> Dictionary:

	flags['filter_subs']= true

	return the_subs


func filter_add_filter_identifier(
		filter_identifier : String,
		filter_value,
		priority_int      : int,
		filters           : Dictionary,
		_self):

	flags['filter_add_filter_identifier'] = true

	return filter_identifier


func filter_add_filter_value(
		filter_value,
		filter_identifier : String,
		priority_int      : int,
		filters           : Dictionary,
		_self):

	flags['filter_add_filter_value'] = true

	return filter_value


func filter_remove_filter_identifier(
		filter_identifier : String,
		filter_value,
		priority_int      : int,
		filters           : Dictionary,
		_self):

	flags['filter_remove_filter_identifier'] = true

	return filter_identifier


func filter_remove_filter_value(
		filter_value,
		filter_identifier : String,
		priority_int      : int,
		filters           : Dictionary,
		_self):

	flags['filter_remove_filter_value'] = true

	return filter_value


func filter_add_hook_identifier(
		hook_identifier : String,
		hook_value,
		priority_int    : int,
		hooks           : Dictionary,
		_self):

	flags['filter_add_hook_identifier'] = true

	return hook_identifier


func filter_add_hook_value(
		hook_value,
		hook_identifier : String,
		priority_int    : int,
		hooks           : Dictionary,
		_self):

	flags['filter_add_hook_value'] = true

	return hook_value


func filter_remove_hook_identifier(
		hook_identifier : String,
		hook_value,
		priority_int    : int,
		hooks           : Dictionary,
		_self):

	flags['filter_remove_hook_identifier'] = true

	return hook_identifier


func filter_remove_hook_value(
		hook_value,
		hook_identifier : String,
		priority_int    : int,
		hooks           : Dictionary,
		_self):

	flags['filter_remove_hook_value'] = true

	return hook_value


func filter_add_sub_identifier(
		sub_identifier : String,
		sub_value,
		subs           : Dictionary,
		_self):

	flags['filter_add_sub_identifier'] = true

	return sub_identifier


func filter_add_sub_value(
		sub_value,
		sub_identifier : String,
		subs           : Dictionary,
		_self):

	flags['filter_add_sub_value'] = true

	return sub_value


func filter_remove_sub_identifier(
		sub_identifier : String,
		sub_value,
		subs           : Dictionary,
		_self):

	flags['filter_remove_sub_identifier'] = true

	return sub_identifier


func filter_remove_sub_identifier_change(
		sub_identifier : String,
		sub_value,
		subs           : Dictionary,
		_self):

	return sub_identifier + '__filtered'


func filter_remove_sub_value(
		sub_value,
		sub_identifier : String,
		subs           : Dictionary,
		_self):

	flags['filter_remove_sub_value'] = true

	return sub_value


func filter_sub_identifier(
		sub_identifier : String,
		args_arr       : Array,
		sub_value,
		_self):

	flags['filter_sub_identifier'] = true

	return sub_identifier


func filter_sub_args_arr(
		args_arr       : Array,
		sub_identifier : String,
		sub_value,
		_self):

	flags['filter_sub_args_arr'] = true

	return args_arr


func filter_sub_action(
		action,
		sub_identifier : String,
		args_arr       : Array,
		_self):

	flags['filter_sub_action'] = true

	return action


func filter_filter_identifier(
		filter_identifier : String,
		filter_value,
		args_arr          : Array,
		filter,
		_self):

	flags['filter_filter_identifier'] = true

	return filter_identifier


func filter_filter_args_arr(
		args_arr          : Array,
		filter_identifier : String,
		filter_value,
		filter,
		_self):

	flags['filter_filter_args_arr'] = true

	return args_arr


func filter_hook_identifier(
		hook_identifier : String,
		args_arr        : Array,
		hook,
		_self):

	flags['filter_hook_identifier'] = true

	return hook_identifier


func filter_hook_args_arr(
		args_arr        : Array,
		hook_identifier : String,
		hook,
		_self):

	flags['filter_hook_args_arr'] = true

	return args_arr


# signals


func signal_hooked(
		hook_identifier,
		args_arr: Array,
		_self) -> void:

	if not 'hooked' in flags:
		flags['hooked'] = []

	if not ('/pre_filter' in hook_identifier \
			or '/post_filter' in hook_identifier \
			or '/pre_hook' in hook_identifier \
			or '/post_hook' in hook_identifier):
		flags['hooked'].append(hook_identifier)


func _signal_hooked(
		hook_identifier,
		args_arr: Array,
		_self) -> void:

	if not 'hooked' in flags:
		flags['hooked'] = []

	if not ('/pre_hook' in hook_identifier \
			or '/post_hook' in hook_identifier):
		flags['hooked'].append(hook_identifier)


func signal_filtered(
		filter_identifier,
		input,
		output,
		args_arr: Array,
		_self) -> void:

	if not 'filtered' in flags:
		flags['filtered'] = []

	if not ('/filter_identifier' in filter_identifier \
			or '/filter_args_arr' in filter_identifier \
			or '/hook_identifier' in filter_identifier \
			or '/hook_args_arr' in filter_identifier):
		flags['filtered'].append(filter_identifier)


func _signal_filtered(
		filter_identifier,
		input,
		output,
		args_arr: Array,
		_self) -> void:

	if not 'filtered' in flags:
		flags['filtered'] = []

	flags['filtered'].append(filter_identifier)


func test__init() -> void:

	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate()

	assert_eq_shallow(conductable.filters, {})
	assert_eq_shallow(conductable.hooks, {})
	assert_eq_shallow(conductable.subs, {})

	var filter_new_filters: FuncRef = funcref(self, 'filter_new_filters')
	var set_filters: FuncRef = funcref(self, 'set_filters')
	var add_filter: FuncRef = funcref(self, 'add_filter')

	conductable = Conducted.instantiate(
		'default',
		{
			Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters
		},
		{
			Conductable.STR_HOOK_SET_FILTERS: set_filters
		},
		{
			Conductable.STR_FUNC_ADD_FILTER: add_filter
		}
	)

	assert_eq_shallow(
		conductable.filters,
		{
			Conductable.STR_FILTER_NEW_FILTERS: \
				[ [ filter_new_filters, Conductable.INT_DEFAULT_PRIORITY ] ]
		}
	)

	assert_eq_shallow(
		conductable.hooks,
		{
			Conductable.STR_HOOK_SET_FILTERS: \
				[ [ set_filters, Conductable.INT_DEFAULT_PRIORITY ] ]
		}
	)

	assert_eq_shallow(
		conductable.subs,
		{
			'add_filter': add_filter
		}
	)


func test_set_filters() -> void:

	# hook
	var hooks: Dictionary = {
		Conductable.STR_HOOK_GET_FILTERS: funcref(self, 'get_filters'),
		Conductable.STR_HOOK_PRE_FILTER: funcref(self, 'pre_filter'),
		Conductable.STR_HOOK_POST_FILTER: funcref(self, 'post_filter'),
		Conductable.STR_HOOK_PRE_HOOK: funcref(self, 'pre_hook'),
		Conductable.STR_HOOK_POST_HOOK: funcref(self, 'post_hook'),
		Conductable.STR_HOOK_SET_FILTERS: funcref(self, 'set_filters')
	}

	# filters
	var filter_hook_identifier   : FuncRef = \
		funcref(self, 'filter_hook_identifier')
	var filter_filter_identifier : FuncRef = \
		funcref(self, 'filter_filter_identifier')
	var filter_filter_args_arr   : FuncRef = \
		funcref(self, 'filter_filter_args_arr')
	var filter_hook_args_arr     : FuncRef = \
		funcref(self, 'filter_hook_args_arr')
	var filter_filters           : FuncRef = \
		funcref(self, 'filter_filters')
	var filter_new_filters       : FuncRef = \
		funcref(self, 'filter_new_filters')

	var filters: Dictionary = {
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
		Conductable.STR_FILTER_FILTERS: filter_filters,
		Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
	}

	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
		filters,
		hooks
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	var filter_add_filter_identifier : FuncRef = \
		funcref(self, 'filter_add_filter_identifier')


	var new_filters: Dictionary = {
		Conductable.STR_FILTER_HOOK_IDENTIFIER: filter_hook_identifier,
		Conductable.STR_FILTER_FILTER_IDENTIFIER: filter_filter_identifier,
		Conductable.STR_FILTER_FILTER_ARGS_ARR: filter_filter_args_arr,
		Conductable.STR_FILTER_HOOK_ARGS_ARR: filter_hook_args_arr,
		Conductable.STR_FILTER_FILTERS: filter_filters,
		Conductable.STR_FILTER_NEW_FILTERS: filter_new_filters,
		Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
			filter_add_filter_identifier
	}

	reset_flags()

	conductable.filters = new_filters

	# hooks

	assert_has(flags, 'get_filters')
	assert_eq(flags['get_filters'], [ filters, new_filters ])

	assert_has(flags, 'set_filters')
	assert_eq(flags['set_filters'], [ new_filters, filters ])

	assert_eq(
		flags['pre_hook'],
		[
			Conductable.STR_HOOK_GET_FILTERS,
			Conductable.STR_HOOK_SET_FILTERS,
			Conductable.STR_HOOK_GET_FILTERS
		]
	)

	assert_eq(
		flags['post_hook'],
		[
			Conductable.STR_HOOK_GET_FILTERS,
			Conductable.STR_HOOK_SET_FILTERS,
			Conductable.STR_HOOK_GET_FILTERS
		]
	)

	assert_eq(
		flags['hooked'],
		[
			Conductable.STR_HOOK_GET_FILTERS,
			Conductable.STR_HOOK_SET_FILTERS,
			Conductable.STR_HOOK_GET_FILTERS
		]
	) 


	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_new_filters')

	assert_eq(flags['filter_new_filters'], new_filters)

	assert_eq(
		flags['pre_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_FILTERS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_NEW_FILTERS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_FILTERS
		]
	)

	assert_eq(
		flags['post_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_FILTERS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_NEW_FILTERS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_FILTERS
		]
	)

	assert_eq(
		flags['filtered'],
		[
			Conductable.STR_FILTER_FILTERS,
			Conductable.STR_FILTER_NEW_FILTERS,
			Conductable.STR_FILTER_FILTERS
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_FILTERS_SET,
		[ new_filters, filters, conductable ]
	)

	# state

	assert_eq(conductable.filters, new_filters)


func test_get_filters() -> void:

#	hook/get_filters
#	hook/pre_filter
#	hook/post_filter
#	hook/pre_hook
#	hook/post_hook

#	filter/hook_identifier
#	filter/filter_identifier
#	filter/filter_args_arr
#	filter/hook_args_arr
#	filter/filters

	# hooks
	var hooks: Dictionary = {
		Conductable.STR_HOOK_GET_FILTERS: funcref(self, 'get_filters'),
		Conductable.STR_HOOK_PRE_FILTER: funcref(self, 'pre_filter'),
		Conductable.STR_HOOK_POST_FILTER: funcref(self, 'post_filter'),
		Conductable.STR_HOOK_PRE_HOOK: funcref(self, 'pre_hook'),
		Conductable.STR_HOOK_POST_HOOK: funcref(self, 'post_hook')
	}
	
	# filters
	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: \
			funcref(self, 'filter_filter_identifier'),
		Conductable.STR_FILTER_FILTER_ARGS_ARR: \
			funcref(self, 'filter_filter_args_arr'),
		Conductable.STR_FILTER_HOOK_IDENTIFIER: \
			funcref(self, 'filter_hook_identifier'),
		Conductable.STR_FILTER_HOOK_ARGS_ARR: \
			funcref(self, 'filter_hook_args_arr'),
		Conductable.STR_FILTER_FILTERS: funcref(self, 'filter_filters')
	}

	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
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
	assert_eq(flags['get_filters'], [ filters ])

	assert_eq(
		flags['pre_hook'],
		[
			Conductable.STR_HOOK_GET_FILTERS
		]
	)

	assert_eq(
		flags['post_hook'],
		[
			Conductable.STR_HOOK_GET_FILTERS
		]
	)

	assert_eq(
		flags['hooked'],
		[
			Conductable.STR_HOOK_GET_FILTERS
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_filters')

	assert_eq(
		flags['pre_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_FILTERS
		]
	)

	assert_eq(
		flags['post_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_FILTERS
		]
	)

	assert_eq(
		flags['filtered'],
		[
			Conductable.STR_FILTER_FILTERS
		]
	)


func test_set_hooks() -> void:

	# hook
	var get_hooks   : FuncRef = funcref(self, 'get_hooks')
	var pre_filter  : FuncRef = funcref(self, 'pre_filter')
	var post_filter : FuncRef = funcref(self, 'post_filter')
	var pre_hook    : FuncRef = funcref(self, 'pre_hook')
	var post_hook   : FuncRef = funcref(self, 'post_hook')
	var set_hooks   : FuncRef = funcref(self, 'set_hooks')

	var hooks: Dictionary = {
		Conductable.STR_HOOK_GET_HOOKS: get_hooks,
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_SET_HOOKS: set_hooks
	}

	# filters
	var filters: Dictionary = {
		Conductable.STR_FILTER_HOOK_IDENTIFIER: \
			funcref(self, 'filter_hook_identifier'),
		Conductable.STR_FILTER_FILTER_IDENTIFIER: \
			funcref(self, 'filter_filter_identifier'),
		Conductable.STR_FILTER_FILTER_ARGS_ARR: \
			funcref(self, 'filter_filter_args_arr'),
		Conductable.STR_FILTER_HOOK_ARGS_ARR: \
			funcref(self, 'filter_hook_args_arr'),
		Conductable.STR_FILTER_HOOKS: funcref(self, 'filter_hooks'),
		Conductable.STR_FILTER_NEW_HOOKS: funcref(self, 'filter_new_hooks'),
	}

	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
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
		Conductable.STR_HOOK_GET_HOOKS: get_hooks,
		Conductable.STR_HOOK_PRE_FILTER: pre_filter,
		Conductable.STR_HOOK_POST_FILTER: post_filter,
		Conductable.STR_HOOK_PRE_HOOK: pre_hook,
		Conductable.STR_HOOK_POST_HOOK: post_hook,
		Conductable.STR_HOOK_SET_HOOKS: set_hooks,
		Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
	}

	conductable.hooks = new_hooks

	# hooks

	assert_has(flags, 'get_hooks')
	assert_eq(flags['get_hooks'], [ hooks, new_hooks ])

	assert_has(flags, 'set_hooks')
	assert_eq(flags['set_hooks'], [ new_hooks, hooks ])

	assert_eq(
		flags['pre_hook'],
		[
			Conductable.STR_HOOK_GET_HOOKS,
			Conductable.STR_HOOK_SET_HOOKS,
			Conductable.STR_HOOK_GET_HOOKS
		]
	)

	assert_eq(
		flags['post_hook'],
		[
			Conductable.STR_HOOK_GET_HOOKS,
			Conductable.STR_HOOK_SET_HOOKS,
			Conductable.STR_HOOK_GET_HOOKS
		]
	)

	assert_eq(
		flags['hooked'],
		[
			Conductable.STR_HOOK_GET_HOOKS,
			Conductable.STR_HOOK_SET_HOOKS,
			Conductable.STR_HOOK_GET_HOOKS
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_new_hooks')

	assert_eq(
		flags['pre_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOKS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_NEW_HOOKS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOKS
		]
	)

	assert_eq(
		flags['post_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOKS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_NEW_HOOKS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOKS
		]
	)

	assert_eq(
		flags['filtered'],
		[
			Conductable.STR_FILTER_HOOKS,
			Conductable.STR_FILTER_NEW_HOOKS,
			Conductable.STR_FILTER_HOOKS
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_HOOKS_SET,
		[ new_hooks, hooks, conductable ]
	)

	# state

	assert_eq(conductable.hooks, new_hooks)


func test_get_hooks() -> void:

	# hooks
	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: funcref(self, 'pre_hook'),
		Conductable.STR_HOOK_POST_HOOK: funcref(self, 'post_hook'),
		Conductable.STR_HOOK_PRE_FILTER: funcref(self, 'pre_filter'),
		Conductable.STR_HOOK_POST_FILTER: funcref(self, 'post_filter'),
		Conductable.STR_HOOK_GET_HOOKS: funcref(self, 'get_hooks')
	}
	
	# filters
	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: \
			funcref(self, 'filter_filter_identifier'),
		Conductable.STR_FILTER_FILTER_ARGS_ARR: \
			funcref(self, 'filter_filter_args_arr'),
		Conductable.STR_FILTER_HOOK_IDENTIFIER: \
			funcref(self, 'filter_hook_identifier'),
		Conductable.STR_FILTER_HOOK_ARGS_ARR: \
			funcref(self, 'filter_hook_args_arr'),
		Conductable.STR_FILTER_HOOKS: funcref(self, 'filter_hooks')
	}

	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
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
	assert_eq(flags['get_hooks'], [ hooks ])

	assert_eq(
		flags['pre_hook'],
		[
			Conductable.STR_HOOK_GET_HOOKS
		]
	)

	assert_eq(
		flags['post_hook'],
		[
			Conductable.STR_HOOK_GET_HOOKS
		]
	)

	assert_eq(
		flags['hooked'],
		[
			Conductable.STR_HOOK_GET_HOOKS
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_hooks')

	assert_eq(
		flags['pre_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOKS
		]
	)

	assert_eq(
		flags['post_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOKS
		]
	)

	assert_eq(
		flags['filtered'],
		[
			Conductable.STR_FILTER_HOOKS
		]
	)


func test_set_subs() -> void:

	# hook
	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: funcref(self, 'pre_hook'),
		Conductable.STR_HOOK_POST_HOOK: funcref(self, 'post_hook'),
		Conductable.STR_HOOK_PRE_FILTER: funcref(self, 'pre_filter'),
		Conductable.STR_HOOK_POST_FILTER: funcref(self, 'post_filter'),
		Conductable.STR_HOOK_GET_SUBS: funcref(self, 'get_subs'),
		Conductable.STR_HOOK_SET_SUBS: funcref(self, 'set_subs')
	}

	# filters
	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: \
			funcref(self, 'filter_filter_identifier'),
		Conductable.STR_FILTER_FILTER_ARGS_ARR: \
			funcref(self, 'filter_filter_args_arr'),
		Conductable.STR_FILTER_HOOK_IDENTIFIER: \
			funcref(self, 'filter_hook_identifier'),
		Conductable.STR_FILTER_HOOK_ARGS_ARR: \
			funcref(self, 'filter_hook_args_arr'),
		Conductable.STR_FILTER_NEW_SUBS: funcref(self, 'filter_new_subs'),
		Conductable.STR_FILTER_SUBS: funcref(self, 'filter_subs')
	}

	# subs
	var subs = {}

	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
		filters,
		hooks,
		subs
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	var new_subs: Dictionary = {
		Conductable.STR_FUNC_REMOVE_HOOK: funcref(self, '')
	}

	conductable.subs = new_subs

	# hooks

	assert_has(flags, 'get_subs')
	assert_eq(flags['get_subs'], [ subs, new_subs ])

	assert_has(flags, 'set_subs')
	assert_eq(flags['set_subs'], [ new_subs, subs ])

	assert_eq(
		flags['pre_hook'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_SET_SUBS,
			Conductable.STR_HOOK_GET_SUBS
		]
	)

	assert_eq(
		flags['post_hook'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_SET_SUBS,
			Conductable.STR_HOOK_GET_SUBS
		]
	)

	assert_eq(
		flags['hooked'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_SET_SUBS,
			Conductable.STR_HOOK_GET_SUBS
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_new_subs')
	assert_has(flags, 'filter_subs')

	assert_eq(
		flags['pre_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_NEW_SUBS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS
		]
	)

	assert_eq(
		flags['post_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_NEW_SUBS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS
		]
	)

	assert_eq(
		flags['filtered'],
		[
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_NEW_SUBS,
			Conductable.STR_FILTER_SUBS
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_SUBS_SET,
		[
			new_subs,
			subs,
			conductable
		]
	)

	# state

	assert_eq(conductable.subs, new_subs)


func test_get_subs() -> void:

	# hooks
	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: funcref(self, 'pre_hook'),
		Conductable.STR_HOOK_POST_HOOK: funcref(self, 'post_hook'),
		Conductable.STR_HOOK_PRE_FILTER: funcref(self, 'pre_filter'),
		Conductable.STR_HOOK_POST_FILTER: funcref(self, 'post_filter'),
		Conductable.STR_HOOK_GET_SUBS: funcref(self, 'get_subs')
	}

	# filters
	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: \
			funcref(self, 'filter_filter_identifier'),
		Conductable.STR_FILTER_FILTER_ARGS_ARR: \
			funcref(self, 'filter_filter_args_arr'),
		Conductable.STR_FILTER_HOOK_IDENTIFIER: \
			funcref(self, 'filter_hook_identifier'),
		Conductable.STR_FILTER_HOOK_ARGS_ARR: \
			funcref(self, 'filter_hook_args_arr'),
		Conductable.STR_FILTER_SUBS: funcref(self, 'filter_subs')
	}

	# subs
	var subs = {}

	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
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
	assert_eq(flags['get_subs'], [ subs ])

	assert_eq(
		flags['pre_hook'],
		[
			Conductable.STR_HOOK_GET_SUBS
		]
	)

	assert_eq(
		flags['post_hook'],
		[
			Conductable.STR_HOOK_GET_SUBS
		]
	)

	assert_eq(
		flags['hooked'],
		[
			Conductable.STR_HOOK_GET_SUBS
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_subs')

	assert_eq(
		flags['pre_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS
		]
	)

	assert_eq(
		flags['post_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS
		]
	)

	assert_eq(
		flags['filtered'],
		[
			Conductable.STR_FILTER_SUBS
		]
	)


func test_add_filter() -> void: 

	# hooks
	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: funcref(self, 'pre_hook'),
		Conductable.STR_HOOK_POST_HOOK: funcref(self, 'post_hook'),
		Conductable.STR_HOOK_PRE_FILTER: funcref(self, 'pre_filter'),
		Conductable.STR_HOOK_POST_FILTER: funcref(self, 'post_filter'),
		Conductable.STR_HOOK_GET_SUBS: funcref(self, 'get_subs'),
		Conductable.STR_HOOK_GET_FILTERS: funcref(self, 'get_filters'),
		Conductable.STR_HOOK_PRE_ADD_FILTER: funcref(self, 'pre_add_filter'),
		Conductable.STR_HOOK_POST_ADD_FILTER: funcref(self, 'post_add_filter')
	}

	# filters
	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: \
			funcref(self, 'filter_filter_identifier'),
		Conductable.STR_FILTER_FILTER_ARGS_ARR: \
			funcref(self, 'filter_filter_args_arr'),
		Conductable.STR_FILTER_HOOK_IDENTIFIER: \
			funcref(self, 'filter_hook_identifier'),
		Conductable.STR_FILTER_HOOK_ARGS_ARR: \
			funcref(self, 'filter_hook_args_arr'),
		Conductable.STR_FILTER_SUBS: funcref(self, 'filter_subs'),
		Conductable.STR_FILTER_FILTERS: funcref(self, 'filter_filters'),
		Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
			funcref(self, 'filter_add_filter_identifier'),
		Conductable.STR_FILTER_ADD_FILTER_VALUE: \
			funcref(self, 'filter_add_filter_value')
	}

	# subs
	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
		filters,
		hooks
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
	assert_has(flags, 'get_filters')
	assert_eq(flags['get_filters'], [ filters ])

	assert_has(flags, 'pre_add_filter')
	assert_has(flags, 'post_add_filter')

	assert_eq(
		flags['pre_hook'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_GET_FILTERS,
			Conductable.STR_HOOK_PRE_ADD_FILTER,
			Conductable.STR_HOOK_POST_ADD_FILTER
		]
	)

	assert_eq(
		flags['post_hook'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_GET_FILTERS,
			Conductable.STR_HOOK_PRE_ADD_FILTER,
			Conductable.STR_HOOK_POST_ADD_FILTER
		]
	)

	assert_eq(
		flags['hooked'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_GET_FILTERS,
			Conductable.STR_HOOK_PRE_ADD_FILTER,
			Conductable.STR_HOOK_POST_ADD_FILTER
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_subs')
	assert_has(flags, 'filter_filters')
	assert_has(flags, 'filter_add_filter_identifier')
	assert_has(flags, 'filter_add_filter_value')

	assert_eq(
		flags['pre_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_FILTERS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_ADD_FILTER_VALUE,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)


	assert_eq(
		flags['post_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_FILTERS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_ADD_FILTER_VALUE,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)
	
	assert_eq(
		flags['filtered'],
		[
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_FILTERS,
			Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_ADD_FILTER_VALUE
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_FILTER_ADDED,
		[
			Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
			added_filter,
			Conductable.INT_DEFAULT_PRIORITY,
			conductable
		]
	)

	# state

	assert_has(
		conductable.filters,
		Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER
	)


func test_remove_filter() -> void:

	# hooks
	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: funcref(self, 'pre_hook'),
		Conductable.STR_HOOK_POST_HOOK: funcref(self, 'post_hook'),
		Conductable.STR_HOOK_PRE_FILTER: funcref(self, 'pre_filter'),
		Conductable.STR_HOOK_POST_FILTER: funcref(self, 'post_filter'),
		Conductable.STR_HOOK_GET_SUBS: funcref(self, 'get_subs'),
		Conductable.STR_HOOK_GET_FILTERS: funcref(self, 'get_filters'),
		Conductable.STR_HOOK_PRE_REMOVE_FILTER: \
			funcref(self, 'pre_remove_filter'),
		Conductable.STR_HOOK_POST_REMOVE_FILTER: \
			funcref(self, 'post_remove_filter')
	}

	# filters

	var filter_add_filter_identifier: FuncRef = \
		funcref(self, 'filter_add_filter_identifier')

	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: \
			funcref(self, 'filter_filter_identifier'),
		Conductable.STR_FILTER_FILTER_ARGS_ARR: \
			funcref(self, 'filter_filter_args_arr'),
		Conductable.STR_FILTER_HOOK_IDENTIFIER: \
			funcref(self, 'filter_hook_identifier'),
		Conductable.STR_FILTER_HOOK_ARGS_ARR: \
			funcref(self, 'filter_hook_args_arr'),
		Conductable.STR_FILTER_SUBS: funcref(self, 'filter_subs'),
		Conductable.STR_FILTER_FILTERS: funcref(self, 'filter_filters'),
		Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER: \
			funcref(self, 'filter_remove_filter_identifier'),
		Conductable.STR_FILTER_REMOVE_FILTER_VALUE: \
			funcref(self, 'filter_remove_filter_value'),
		Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER: \
			filter_add_filter_identifier
	}

	# subs
	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
		filters,
		hooks
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

	assert_has(flags, 'get_filters')
	assert_eq(flags['get_filters'], [ filters ])

	assert_has(flags, 'pre_remove_filter')
	assert_has(flags, 'post_remove_filter')

	assert_eq(
		flags['pre_hook'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_GET_FILTERS,
			Conductable.STR_HOOK_PRE_REMOVE_FILTER,
			Conductable.STR_HOOK_POST_REMOVE_FILTER
		]
	)

	assert_eq(
		flags['post_hook'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_GET_FILTERS,
			Conductable.STR_HOOK_PRE_REMOVE_FILTER,
			Conductable.STR_HOOK_POST_REMOVE_FILTER
		]
	)

	assert_eq(
		flags['hooked'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_GET_FILTERS,
			Conductable.STR_HOOK_PRE_REMOVE_FILTER,
			Conductable.STR_HOOK_POST_REMOVE_FILTER
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_subs')
	assert_has(flags, 'filter_filters')
	assert_has(flags, 'filter_remove_filter_identifier')
	assert_has(flags, 'filter_remove_filter_value')

	assert_eq(
		flags['pre_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_FILTERS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_REMOVE_FILTER_VALUE,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)

	assert_eq(
		flags['post_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_FILTERS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_REMOVE_FILTER_VALUE,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)

	assert_eq(
		flags['filtered'],
		[
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_FILTERS,
			Conductable.STR_FILTER_REMOVE_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_REMOVE_FILTER_VALUE
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_FILTER_REMOVED,
		[
			Conductable.STR_FILTER_ADD_FILTER_IDENTIFIER,
			filter_add_filter_identifier,
			-1,
			conductable
		]
	)


func test_add_hook() -> void:

	# hooks
	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: funcref(self, 'pre_hook'),
		Conductable.STR_HOOK_POST_HOOK: funcref(self, 'post_hook'),
		Conductable.STR_HOOK_PRE_FILTER: funcref(self, 'pre_filter'),
		Conductable.STR_HOOK_POST_FILTER: funcref(self, 'post_filter'),
		Conductable.STR_HOOK_GET_SUBS: funcref(self, 'get_subs'),
		Conductable.STR_HOOK_GET_HOOKS: funcref(self, 'get_hooks'),
		Conductable.STR_HOOK_PRE_ADD_HOOK: funcref(self, 'pre_add_hook'),
		Conductable.STR_HOOK_POST_ADD_HOOK: funcref(self, 'post_add_hook')
	}

	# filters
	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: \
			funcref(self, 'filter_filter_identifier'),
		Conductable.STR_FILTER_FILTER_ARGS_ARR: \
			funcref(self, 'filter_filter_args_arr'),
		Conductable.STR_FILTER_HOOK_IDENTIFIER: \
			funcref(self, 'filter_hook_identifier'),
		Conductable.STR_FILTER_HOOK_ARGS_ARR: \
			funcref(self, 'filter_hook_args_arr'),
		Conductable.STR_FILTER_SUBS: funcref(self, 'filter_subs'),
		Conductable.STR_FILTER_ADD_HOOK_IDENTIFIER: \
			funcref(self, 'filter_add_hook_identifier'),
		Conductable.STR_FILTER_HOOKS: funcref(self, 'filter_hooks'),
		Conductable.STR_FILTER_ADD_HOOK_VALUE: \
			funcref(self, 'filter_add_hook_value')
	}

	# subs
	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
		filters,
		hooks
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

	assert_has(flags, 'get_hooks')
	assert_eq(flags['get_hooks'], [ hooks ])

	assert_has(flags, 'pre_add_hook')
	assert_has(flags, 'post_add_hook')

	assert_eq(
		flags['pre_hook'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_GET_HOOKS,
			Conductable.STR_HOOK_PRE_ADD_HOOK,
			Conductable.STR_HOOK_POST_ADD_HOOK
		]
	)

	assert_eq(
		flags['post_hook'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_GET_HOOKS,
			Conductable.STR_HOOK_PRE_ADD_HOOK,
			Conductable.STR_HOOK_POST_ADD_HOOK
		]
	)

	assert_eq(
		flags['hooked'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_GET_HOOKS,
			Conductable.STR_HOOK_PRE_ADD_HOOK,
			Conductable.STR_HOOK_POST_ADD_HOOK
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_subs')
	assert_has(flags, 'filter_hooks')
	assert_has(flags, 'filter_add_hook_identifier')
	assert_has(flags, 'filter_add_hook_value')

	assert_eq(
		flags['pre_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOKS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_ADD_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_ADD_HOOK_VALUE,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)

	assert_eq(
		flags['post_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOKS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_ADD_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_ADD_HOOK_VALUE,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)

	assert_eq(
		flags['filtered'],
		[
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_HOOKS,
			Conductable.STR_FILTER_ADD_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_ADD_HOOK_VALUE
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_HOOK_ADDED,
		[
			Conductable.STR_HOOK_PRE_REMOVE_HOOK,
			added_hook,
			Conductable.INT_DEFAULT_PRIORITY,
			conductable
		]
	)

	# state

	assert_has(conductable.hooks, Conductable.STR_HOOK_PRE_REMOVE_HOOK)


func test_remove_hook() -> void:

	# hooks
	var pre_add_hook: FuncRef = funcref(self, 'pre_add_hook')

	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: funcref(self, 'pre_hook'),
		Conductable.STR_HOOK_POST_HOOK: funcref(self, 'post_hook'),
		Conductable.STR_HOOK_PRE_FILTER: funcref(self, 'pre_filter'),
		Conductable.STR_HOOK_POST_FILTER: funcref(self, 'post_filter'),
		Conductable.STR_HOOK_GET_SUBS: funcref(self, 'get_subs'),
		Conductable.STR_HOOK_GET_HOOKS: funcref(self, 'get_hooks'),
		Conductable.STR_HOOK_PRE_REMOVE_HOOK: funcref(self, 'pre_remove_hook'),
		Conductable.STR_HOOK_POST_REMOVE_HOOK: funcref(self, 'post_remove_hook'),
		Conductable.STR_HOOK_PRE_ADD_HOOK: pre_add_hook
	}

	# filters
	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: \
			funcref(self, 'filter_filter_identifier'),
		Conductable.STR_FILTER_FILTER_ARGS_ARR: \
			funcref(self, 'filter_filter_args_arr'),
		Conductable.STR_FILTER_HOOK_IDENTIFIER: \
			funcref(self, 'filter_hook_identifier'),
		Conductable.STR_FILTER_HOOK_ARGS_ARR: \
			funcref(self, 'filter_hook_args_arr'),
		Conductable.STR_FILTER_SUBS: funcref(self, 'filter_subs'),
		Conductable.STR_FILTER_REMOVE_HOOK_IDENTIFIER: \
			funcref(self, 'filter_remove_hook_identifier'),
		Conductable.STR_FILTER_HOOKS: funcref(self, 'filter_hooks'),
		Conductable.STR_FILTER_REMOVE_HOOK_VALUE: \
			funcref(self, 'filter_remove_hook_value')
	}

	# subs
	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
		filters,
		hooks
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
	assert_has(flags, 'get_hooks')
	assert_eq(flags['get_hooks'], [ hooks ])

	assert_has(flags, 'pre_remove_hook')
	assert_has(flags, 'post_remove_hook')

	assert_eq(
		flags['pre_hook'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_GET_HOOKS,
			Conductable.STR_HOOK_PRE_REMOVE_HOOK,
			Conductable.STR_HOOK_POST_REMOVE_HOOK
		]
	)

	assert_eq(
		flags['post_hook'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_GET_HOOKS,
			Conductable.STR_HOOK_PRE_REMOVE_HOOK,
			Conductable.STR_HOOK_POST_REMOVE_HOOK
		]
	)

	assert_eq(
		flags['hooked'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_GET_HOOKS,
			Conductable.STR_HOOK_PRE_REMOVE_HOOK,
			Conductable.STR_HOOK_POST_REMOVE_HOOK
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_subs')
	assert_has(flags, 'filter_hooks')
	assert_has(flags, 'filter_remove_hook_identifier')
	assert_has(flags, 'filter_remove_hook_value')

	assert_eq(
		flags['pre_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOKS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_REMOVE_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_REMOVE_HOOK_VALUE,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)

	assert_eq(
		flags['post_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOKS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_REMOVE_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_REMOVE_HOOK_VALUE,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)

	assert_eq(
		flags['filtered'],
		[
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_HOOKS,
			Conductable.STR_FILTER_REMOVE_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_REMOVE_HOOK_VALUE
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_HOOK_REMOVED,
		[
			Conductable.STR_HOOK_PRE_ADD_HOOK,
			pre_add_hook,
			-1,
			conductable
		]
	)


func test_add_sub() -> void:

	# hooks
	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: funcref(self, 'pre_hook'),
		Conductable.STR_HOOK_POST_HOOK: funcref(self, 'post_hook'),
		Conductable.STR_HOOK_PRE_FILTER: funcref(self, 'pre_filter'),
		Conductable.STR_HOOK_POST_FILTER: funcref(self, 'post_filter'),
		Conductable.STR_HOOK_GET_SUBS: funcref(self, 'get_subs'),
		Conductable.STR_HOOK_PRE_ADD_SUB: funcref(self, 'pre_add_sub'),
		Conductable.STR_HOOK_POST_ADD_SUB: funcref(self, 'post_add_sub')
	}

	# filters
	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: \
			funcref(self, 'filter_filter_identifier'),
		Conductable.STR_FILTER_FILTER_ARGS_ARR: \
			funcref(self, 'filter_filter_args_arr'),
		Conductable.STR_FILTER_HOOK_IDENTIFIER: \
			funcref(self, 'filter_hook_identifier'),
		Conductable.STR_FILTER_HOOK_ARGS_ARR: \
			funcref(self, 'filter_hook_args_arr'),
		Conductable.STR_FILTER_SUBS: funcref(self, 'filter_subs'),
		Conductable.STR_FILTER_ADD_SUB_IDENTIFIER: \
			funcref(self, 'filter_add_sub_identifier'),
		Conductable.STR_FILTER_ADD_SUB_VALUE: \
			funcref(self, 'filter_add_sub_value')
	}

	# subs
	var subs: Dictionary = {}

	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
		filters,
		hooks,
		subs
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	var added_sub = funcref(self, '')

	conductable.add_sub(
		Conductable.STR_FUNC_REMOVE_HOOK,
		added_sub
	)

	# hooks

	assert_has(flags, 'get_subs')
	assert_eq(flags['get_subs'], [ subs ])

	assert_has(flags, 'pre_add_sub')
	assert_has(flags, 'post_add_sub')

	assert_eq(
		flags['pre_hook'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_PRE_ADD_SUB,
			Conductable.STR_HOOK_POST_ADD_SUB
		]
	)

	assert_eq(
		flags['post_hook'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_PRE_ADD_SUB,
			Conductable.STR_HOOK_POST_ADD_SUB
		]
	)

	assert_eq(
		flags['hooked'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_PRE_ADD_SUB,
			Conductable.STR_HOOK_POST_ADD_SUB
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

	assert_eq(
		flags['pre_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_ADD_SUB_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_ADD_SUB_VALUE,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)

	assert_eq(
		flags['post_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_ADD_SUB_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_ADD_SUB_VALUE,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)

	assert_eq(
		flags['filtered'],
		[
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_ADD_SUB_IDENTIFIER,
			Conductable.STR_FILTER_ADD_SUB_VALUE
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_SUB_ADDED,
		[
			Conductable.STR_FUNC_REMOVE_HOOK,
			added_sub,
			conductable
		]
	)

	# state

	assert_has(conductable.subs, Conductable.STR_FUNC_REMOVE_HOOK)


func test_remove_sub() -> void:

	# hooks
	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: funcref(self, 'pre_hook'),
		Conductable.STR_HOOK_POST_HOOK: funcref(self, 'post_hook'),
		Conductable.STR_HOOK_PRE_FILTER: funcref(self, 'pre_filter'),
		Conductable.STR_HOOK_POST_FILTER: funcref(self, 'post_filter'),
		Conductable.STR_HOOK_GET_SUBS: funcref(self, 'get_subs'),
		Conductable.STR_HOOK_PRE_REMOVE_SUB: funcref(self, 'pre_remove_sub'),
		Conductable.STR_HOOK_POST_REMOVE_SUB: funcref(self, 'post_remove_sub')
	}

	# filters
	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: \
			funcref(self, 'filter_filter_identifier'),
		Conductable.STR_FILTER_FILTER_ARGS_ARR: \
			funcref(self, 'filter_filter_args_arr'),
		Conductable.STR_FILTER_HOOK_IDENTIFIER: \
			funcref(self, 'filter_hook_identifier'),
		Conductable.STR_FILTER_HOOK_ARGS_ARR: \
			funcref(self, 'filter_hook_args_arr'),
		Conductable.STR_FILTER_SUBS: funcref(self, 'filter_subs'),
		Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER: \
			funcref(self, 'filter_remove_sub_identifier'),
		Conductable.STR_FILTER_REMOVE_SUB_VALUE: \
			funcref(self, 'filter_remove_sub_value')
	}

	# subs
	var remove_hook: FuncRef = funcref(self, '')

	var subs: Dictionary = { Conductable.STR_FUNC_REMOVE_HOOK: remove_hook }

	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
		filters,
		hooks,
		subs
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	conductable.remove_sub(Conductable.STR_FUNC_REMOVE_HOOK)

	# hooks

	assert_has(flags, 'get_subs')
	assert_eq(flags['get_subs'], [ subs ])

	assert_has(flags, 'pre_remove_sub')
	assert_has(flags, 'post_remove_sub')

	assert_eq(
		flags['pre_hook'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_PRE_REMOVE_SUB,
			Conductable.STR_HOOK_POST_REMOVE_SUB
		]
	)

	assert_eq(
		flags['post_hook'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_PRE_REMOVE_SUB,
			Conductable.STR_HOOK_POST_REMOVE_SUB
		]
	)

	assert_eq(
		flags['hooked'],
		[
			Conductable.STR_HOOK_GET_SUBS,
			Conductable.STR_HOOK_PRE_REMOVE_SUB,
			Conductable.STR_HOOK_POST_REMOVE_SUB
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

	assert_eq(
		flags['pre_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_REMOVE_SUB_VALUE,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)

	assert_eq(
		flags['post_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_REMOVE_SUB_VALUE,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)

	assert_eq(
		flags['filtered'],
		[
			Conductable.STR_FILTER_SUBS,
			Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER,
			Conductable.STR_FILTER_REMOVE_SUB_VALUE
		]
	)

	# signals

	assert_signal_emitted_with_parameters(
		conductable,
		Conductable.STR_SIGNAL_SUB_REMOVED,
		[
			'remove_hook',
			remove_hook,
			conductable
		]
	)


func test_filter() -> void:

	# hooks
	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: funcref(self, '_pre_hook'),
		Conductable.STR_HOOK_POST_HOOK: funcref(self, '_post_hook'),
		Conductable.STR_HOOK_PRE_FILTER: funcref(self, 'pre_filter'),
		Conductable.STR_HOOK_POST_FILTER: funcref(self, 'post_filter')
	}

	# filters
	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: \
			funcref(self, 'filter_filter_identifier'),
		Conductable.STR_FILTER_FILTER_ARGS_ARR: \
			funcref(self, 'filter_filter_args_arr'),
		Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER: \
			funcref(self, 'filter_remove_sub_identifier_change')
	}

	# subs
	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
		filters,
		hooks
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, '_signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	var sub_identifier = conductable.filter(
		Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER,
		'sub_identifier',
		[ funcref(self, ''), {} ]
	)

	assert_eq(sub_identifier, 'sub_identifier__filtered')

	# hooks

	assert_eq(
		flags['pre_hook'],
		[
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER
		]
	)

	assert_eq(
		flags['post_hook'],
		[
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER
		]
	)

	assert_eq(
		flags['hooked'],
		[
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')

	assert_eq(
		flags['pre_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER
		]
	)

	assert_eq(
		flags['post_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER
		]
	)

	assert_eq(
		flags['filtered'],
		[
			Conductable.STR_FILTER_REMOVE_SUB_IDENTIFIER
		]
	)


func test_hook() -> void:

	# hooks
	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_FILTER: funcref(self, 'pre_filter'),
		Conductable.STR_HOOK_POST_FILTER: funcref(self, 'post_filter'),
		Conductable.STR_HOOK_PRE_HOOK: funcref(self, '_pre_hook'),
		Conductable.STR_HOOK_POST_HOOK: funcref(self, '_post_hook'),
		Conductable.STR_HOOK_PRE_REMOVE_HOOK: funcref(self, 'pre_remove_hook')
	}

	# filters
	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: \
			funcref(self, 'filter_filter_identifier'),
		Conductable.STR_FILTER_FILTER_ARGS_ARR: \
			funcref(self, 'filter_filter_args_arr'),
		Conductable.STR_FILTER_HOOK_IDENTIFIER: \
			funcref(self, 'filter_hook_identifier'),
		Conductable.STR_FILTER_HOOK_ARGS_ARR: \
			funcref(self, 'filter_hook_args_arr')
	}

	# subs
	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
		filters,
		hooks
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, '_signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, '_signal_filtered')

	reset_flags()

	conductable.hook(
		Conductable.STR_HOOK_PRE_REMOVE_HOOK,
		[ '', funcref(self, ''), -1 ]
	)

	# hooks

	assert_has(flags, 'pre_hook')
	assert_has(flags, 'post_hook')
	assert_has(flags, 'pre_remove_hook')

	assert_eq(
		flags['pre_hook'],
		[
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_REMOVE_HOOK
		]
	)

	assert_eq(
		flags['post_hook'],
		[
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_REMOVE_HOOK
		]
	)

	assert_eq(
		flags['hooked'],
		[
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_FILTER,
			Conductable.STR_HOOK_POST_FILTER,
			Conductable.STR_HOOK_PRE_REMOVE_HOOK
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')

	assert_eq(
		flags['pre_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)

	assert_eq(
		flags['post_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)

	assert_eq(
		flags['filtered'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)


func remove_hook(
		identifier: String,
		funcr: FuncRef,
		_self):

	flags['remove_hook'] = true


func test_sub() -> void:

	# hooks
	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_FILTER: funcref(self, 'pre_filter'),
		Conductable.STR_HOOK_POST_FILTER: funcref(self, 'post_filter'),
		Conductable.STR_HOOK_PRE_HOOK: funcref(self, 'pre_hook'),
		Conductable.STR_HOOK_POST_HOOK: funcref(self, 'post_hook'),
		Conductable.STR_HOOK_PRE_SUB: funcref(self, 'pre_sub'),
		Conductable.STR_HOOK_POST_SUB: funcref(self, 'post_sub')
	}

	# filters
	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: \
			funcref(self, 'filter_filter_identifier'),
		Conductable.STR_FILTER_FILTER_ARGS_ARR: \
			funcref(self, 'filter_filter_args_arr'),
		Conductable.STR_FILTER_HOOK_IDENTIFIER: \
			funcref(self, 'filter_hook_identifier'),
		Conductable.STR_FILTER_HOOK_ARGS_ARR: \
			funcref(self, 'filter_hook_args_arr'),
		Conductable.STR_FILTER_SUB_IDENTIFIER: \
			funcref(self, 'filter_sub_identifier'),
		Conductable.STR_FILTER_SUB_ARGS_ARR: \
			funcref(self, 'filter_sub_args_arr'),
		Conductable.STR_FILTER_SUB_ACTION: funcref(self, 'filter_sub_action')
	}

	# subs
	var subs: Dictionary = {
		'remove_hook': funcref(self, 'remove_hook')
	}

	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
		filters,
		hooks,
		subs
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	var return_value = conductable.sub(
		'remove_hook',
		[ 'hook_identifier', funcref(self, '') ]
	)

	# hooks

	assert_has(flags, 'pre_sub')
	assert_has(flags, 'post_sub')
	assert_has(flags, 'remove_hook')

	assert_eq(
		flags['pre_hook'],
		[
			Conductable.STR_HOOK_PRE_SUB,
			Conductable.STR_HOOK_POST_SUB
		]
	)

	assert_eq(
		flags['post_hook'],
		[
			Conductable.STR_HOOK_PRE_SUB,
			Conductable.STR_HOOK_POST_SUB
		]
	)

	assert_eq(
		flags['hooked'],
		[
			Conductable.STR_HOOK_PRE_SUB,
			Conductable.STR_HOOK_POST_SUB
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')
	assert_has(flags, 'filter_sub_identifier')
	assert_has(flags, 'filter_sub_args_arr')

	assert_eq(
		flags['pre_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUB_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUB_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUB_ACTION,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)

	assert_eq(
		flags['post_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUB_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUB_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_SUB_ACTION,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)

	assert_eq(
		flags['filtered'],
		[
			Conductable.STR_FILTER_SUB_IDENTIFIER,
			Conductable.STR_FILTER_SUB_ARGS_ARR,
			Conductable.STR_FILTER_SUB_ACTION
		]
	)

# Conducted.gd


func pre_set_a_property(
		new_property,
		_self) -> void:

	flags['pre_set_a_property'] = true

	return


func post_set_a_property(
		a_property,
		old_a_property,
		_self) -> void:

	flags['post_set_a_property'] = true

	return


func get_a_property(
		_self) -> void:

	flags['get_a_property'] = true

	return


func filter_new_property(
		new_property,
		additiona_arg,
		_self):

	flags['filter_new_property'] = true

	return new_property


func filter_a_property(
		a_property,
		_self):

	flags['filter_a_property'] = true

	return a_property


func test___init() -> void:

	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate()

	assert_eq(conductable.a_property, 'default')

	conductable = Conducted.instantiate('input')

	assert_eq(conductable.a_property, 'input')


func test_set_a_property() -> void:

	# hook
	var hooks: Dictionary = {
		Conductable.STR_HOOK_PRE_HOOK: funcref(self, 'pre_hook'),
		Conductable.STR_HOOK_POST_HOOK: funcref(self, 'post_hook'),
		Conductable.STR_HOOK_PRE_FILTER: funcref(self, 'pre_filter'),
		Conductable.STR_HOOK_POST_FILTER: funcref(self, 'post_filter'),
		'get_a_property': funcref(self, 'get_a_property'),
		'pre_set_a_property': funcref(self, 'pre_set_a_property'),
		'post_set_a_property': funcref(self, 'post_set_a_property')
	}

	# filters
	var filters: Dictionary = {
		Conductable.STR_FILTER_FILTER_IDENTIFIER: \
			funcref(self, 'filter_filter_identifier'),
		Conductable.STR_FILTER_FILTER_ARGS_ARR: \
			funcref(self, 'filter_filter_args_arr'),
		Conductable.STR_FILTER_HOOK_IDENTIFIER: \
			funcref(self, 'filter_hook_identifier'),
		Conductable.STR_FILTER_HOOK_ARGS_ARR: \
			funcref(self, 'filter_hook_args_arr'),
		'new_property': funcref(self, 'filter_new_property'),
		'a_property': funcref(self, 'filter_a_property')
	}

	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
		filters,
		hooks
	)

	watch_signals(conductable)
	conductable.connect(Conductable.STR_SIGNAL_HOOKED, self, 'signal_hooked')
	conductable \
		.connect(Conductable.STR_SIGNAL_FILTERED, self, 'signal_filtered')

	reset_flags()

	conductable.a_property = 'new property'

	# hooks

	assert_has(flags, 'get_a_property')
	assert_has(flags, 'pre_set_a_property')
	assert_has(flags, 'post_set_a_property')

	assert_eq(
		flags['pre_hook'],
		[
			'pre_set_a_property',
			'get_a_property',
			'post_set_a_property'
		]
	)

	assert_eq(
		flags['post_hook'],
		[
			'pre_set_a_property',
			'get_a_property',
			'post_set_a_property'
		]
	)

	assert_eq(
		flags['hooked'],
		[
			'pre_set_a_property',
			'get_a_property',
			'post_set_a_property'
		]
	)

	# filters

	assert_has(flags, 'filter_filter_identifier')
	assert_has(flags, 'filter_filter_args_arr')
	assert_has(flags, 'filter_hook_identifier')
	assert_has(flags, 'filter_hook_args_arr')

	assert_eq(
		flags['pre_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			'new_property',
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			'a_property',
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)

	assert_eq(
		flags['post_filter'],
		[
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			'new_property',
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			'a_property',
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_IDENTIFIER,
			Conductable.STR_FILTER_FILTER_ARGS_ARR,
			Conductable.STR_FILTER_HOOK_ARGS_ARR
		]
	)

	assert_eq(
		flags['filtered'],
		[
			'new_property',
			'a_property'
		]
	)

	# state

	assert_eq(conductable.a_property, 'new property')


func get_a_property_1(
		_self):

	if not 'get_a_property' in flags:
		flags['get_a_property'] = []

	flags['get_a_property'].append(1)


func get_a_property_2(
		_self):

	if not 'get_a_property' in flags:
		flags['get_a_property'] = []

	flags['get_a_property'].append(2)


func get_a_property_3(
		_self):

	if not 'get_a_property' in flags:
		flags['get_a_property'] = []

	flags['get_a_property'].append(3)


func get_a_property_4(
		_self):

	if not 'get_a_property' in flags:
		flags['get_a_property'] = []

	flags['get_a_property'].append(4)


func test_multiple_hooks() -> void:

	# hook
	var hooks: Dictionary = {
		'get_a_property': [
			[ funcref(self, 'get_a_property_1'), 10 ],
			[ funcref(self, 'get_a_property_2'), 10 ],
			[ funcref(self, 'get_a_property_3'), 10 ],
			[ funcref(self, 'get_a_property_4'), 10 ]
		]
	}

	# filters


	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'default',
		{},
		hooks
	)

	reset_flags()

	var property = conductable.a_property

	assert_has(flags, 'get_a_property')
	assert_eq(flags['get_a_property'], [ 1, 2, 3, 4 ])

	reset_flags()

	conductable = Conducted.instantiate()

	conductable.add_hook('get_a_property', funcref(self, 'get_a_property_1'))
	conductable.add_hook('get_a_property', funcref(self, 'get_a_property_2'))
	conductable.add_hook('get_a_property', funcref(self, 'get_a_property_3'))
	conductable.add_hook('get_a_property', funcref(self, 'get_a_property_4'))

	property = conductable.a_property

	assert_has(flags, 'get_a_property')
	assert_eq(flags['get_a_property'], [ 1, 2, 3, 4 ])

	reset_flags()

	conductable.hooks = {}
	conductable.add_hook('get_a_property', funcref(self, 'get_a_property_1'), 15)
	conductable.add_hook('get_a_property', funcref(self, 'get_a_property_2'))
	conductable.add_hook('get_a_property', funcref(self, 'get_a_property_3'), 12)
	conductable.add_hook('get_a_property', funcref(self, 'get_a_property_4'))

	property = conductable.a_property

	assert_has(flags, 'get_a_property')
	assert_eq(flags['get_a_property'], [ 2, 4, 3, 1 ])


func a_property_1(
		a_property,
		_self) -> String:

	if a_property == 'one':
		return 'two'

	return a_property


func a_property_2(
		a_property,
		_self) -> String:

	if a_property == 'two':
		return 'three'

	return a_property


func a_property_3(
		a_property,
		_self) -> String:

	if a_property == 'three':
		return 'four'

	return a_property


func test_multiple_filters() -> void:

	# hook
	

	# filters
	var filters: Dictionary = {
		'a_property': [
			[ funcref(self, 'a_property_1'), 10 ],
			[ funcref(self, 'a_property_2'), 10 ],
			[ funcref(self, 'a_property_3'), 10 ]
		]
	}

	var conductable: PressAccept_Conductor_Conducted = Conducted.instantiate(
		'one',
		filters
	)

	reset_flags()

	var property = conductable.a_property

	assert_eq(property, 'four')


func sub__to_string(
		_self):

	flags['sub__to_string'] = true


func sub___output(
		prefix: String,
		tab_char: String,
		_self):

	flags['sub___output'] = true


func sub_set_filters(
		new_filters: Dictionary,
		_self):

	flags['sub_set_filters'] = true


func sub_get_filters(
		_self):

	flags['sub_get_filters'] = true

	return {}


func sub_set_hooks(
		new_hooks: Dictionary,
		_self):

	flags['sub_set_hooks'] = true


func sub_get_hooks(
		_self):

	flags['sub_get_hooks'] = true

	return {}


func sub_set_subs(
		new_subs: Dictionary,
		_self):

	flags['sub_set_subs'] = true


func sub_get_subs(
		_self):

	flags['sub_get_subs'] = true

	return {
		Conductable.STR_FUNC__TO_STRING: funcref(self, 'sub__to_string'),
		Conductable.STR_FUNC___OUTPUT: funcref(self, 'sub___output'),
		Conductable.STR_FUNC_SET_FILTERS: funcref(self, 'sub_set_filters'),
		Conductable.STR_FUNC_GET_FILTERS: funcref(self, 'sub_get_filters'),
		Conductable.STR_FUNC_SET_HOOKS: funcref(self, 'sub_set_hooks'),
		Conductable.STR_FUNC_GET_HOOKS: funcref(self, 'sub_get_hooks'),
		Conductable.STR_FUNC_SET_SUBS: funcref(self, 'sub_set_subs'),
		Conductable.STR_FUNC_GET_SUBS: funcref(self, 'sub_get_subs'),
		Conductable.STR_FUNC_SIGNAL_HOOK_ADDED: funcref(self, 'sub_signal_hook_added'),
		Conductable.STR_FUNC_SIGNAL_HOOKED: funcref(self, 'sub_signal_hooked'),
		Conductable.STR_FUNC_SIGNAL_HOOK_REMOVED: funcref(self, 'sub_signal_hook_removed'),
		Conductable.STR_FUNC_SIGNAL_HOOKS_SET: funcref(self, 'sub_signal_hooks_set'),
		Conductable.STR_FUNC_SIGNAL_FILTER_ADDED: funcref(self, 'sub_signal_filter_added'),
		Conductable.STR_FUNC_SIGNAL_FILTERED: funcref(self, 'sub_signal_filtered'),
		Conductable.STR_FUNC_SIGNAL_FILTER_REMOVED: funcref(self, 'sub_signal_filter_removed'),
		Conductable.STR_FUNC_SIGNAL_FILTERS_SET: funcref(self, 'sub_signal_filters_set'),
		Conductable.STR_FUNC_SIGNAL_SUB_ADDED: funcref(self, 'sub_signal_sub_added'),
		Conductable.STR_FUNC_SIGNAL_SUBBED: funcref(self, 'sub_signal_subbed'),
		Conductable.STR_FUNC_SIGNAL_SUB_REMOVED: funcref(self, 'sub_signal_sub_removed'),
		Conductable.STR_FUNC_SIGNAL_SUBS_SET: funcref(self, 'sub_signal_subs_set'),
		Conductable.STR_FUNC_ADD_FILTER: funcref(self, 'sub_add_filter'),
		Conductable.STR_FUNC_REMOVE_FILTER: funcref(self, 'sub_remove_filter'),
		Conductable.STR_FUNC_ADD_HOOK: funcref(self, 'sub_add_hook'),
		Conductable.STR_FUNC_REMOVE_HOOK: funcref(self, 'sub_remove_hook'),
		Conductable.STR_FUNC_ADD_SUB: funcref(self, 'sub_add_sub'),
		Conductable.STR_FUNC_REMOVE_SUB: funcref(self, 'sub_remove_sub'),
		Conductable.STR_FUNC_FILTER: funcref(self, 'sub_filter'),
		Conductable.STR_FUNC_HOOK: funcref(self, 'sub_hook'),
		Conductable.STR_FUNC_SUB: funcref(self, 'sub_sub'),
		Conductable.STR_FUNC__ADD: funcref(self, 'sub__add'),
		Conductable.STR_FUNC__REMOVE: funcref(self, 'sub__remove'),
		Conductable.STR_FUNC___HOOK: funcref(self, 'sub___hook'),
		Conductable.STR_FUNC___FILTER: funcref(self, 'sub___filter'),
		Conductable.STR_FUNC__FILTER: funcref(self, 'sub__filter'),
		Conductable.STR_FUNC__HOOK: funcref(self, 'sub__hook'),
		Conductable.STR_FUNC__ACT: funcref(self, 'sub__act'),
		Conductable.STR_FUNC__DO_ACTION: funcref(self, 'sub__do_action')
	}


func sub_signal_hook_added(
		identifier : String,
		value,
		priority   : int,
		_self):

	flags['sub_signal_hook_added'] = true


func sub_signal_hooked(
		identifier : String,
		args       : Array,
		_self):

	flags['sub_signal_hooked'] = true


func sub_signal_hook_removed(
		identifier : String,
		value,
		priority   : int,
		_self):

	flags['sub_signal_hook_removed'] = true


func sub_signal_hooks_set(
		new_hooks: Dictionary,
		old_hooks: Dictionary,
		_self):

	flags['sub_signal_hooks_set'] = true


func sub_signal_filter_added(
		identifier : String,
		value,
		priority   : int,
		_self) -> void:

	flags['sub_signal_filter_added'] = true


func sub_signal_filtered(
		identifier : String,
		input,
		output,
		args       : Array,
		_self):

	flags['sub_signal_filtered'] = true


func sub_signal_filter_removed(
		identifier : String,
		value,
		priority   : int,
		_self):

	flags['sub_signal_filter_removed'] = true


func sub_signal_filters_set(
		new_filters: Dictionary,
		old_filters: Dictionary,
		_self):

	flags['sub_signal_filters_set'] = true


func sub_signal_sub_added(
		identifier: String,
		value,
		_self):

	flags['sub_signal_sub_added'] = true


func sub_signal_subbed(
		identifier : String,
		args       : Array,
		return_value,
		_self):

	flags['sub_signal_subbed'] = true


func sub_signal_sub_removed(
		identifier: String,
		value,
		_self):

	flags['sub_signal_sub_removed'] = true


func sub_signal_subs_set(
		new_subs: Dictionary,
		old_subs: Dictionary,
		_self):

	flags['sub_signal_subs_set'] = true


func sub_add_filter(
		new_filter_identifier : String,
		new_filter_value,  # FuncRef | Array | String
		priority_int          : int,
		_self):

	flags['sub_add_filter'] = true


func sub_remove_filter(
		remove_filter_identifier : String,
		remove_filter_value,  # FuncRef | Array | String
		priority_int             : int,
		_self):

	flags['sub_remove_filter'] = true


func sub_add_hook(
		new_hook_identifier : String,
		new_hook_value,  # FuncRef | Array | String
		priority_int        : int,
		_self):

	flags['sub_add_hook'] = true


func sub_remove_hook(
		remove_hook_identifier : String,
		remove_hook_value,  # FuncRef | Array | String
		priority_int           : int,
		_self):

	flags['sub_remove_hook'] = true


func sub_add_sub(
		sub_identifier: String,
		sub_value,
		_self):

	flags['sub_add_sub'] = true


func sub_remove_sub(
		sub_identifier: String,
		_self):

	flags['sub_remove_sub'] = true


func sub_filter(
		filter_identifier : String,
		filter_value,
		args_arr          : Array,
		_self):

	flags['sub_filter'] = true


func sub_hook(
		hook_identifier : String,
		hook_args_arr   : Array,
		_self):

	flags['sub_hook'] = true


func sub_sub(
		sub_identifier : String,
		args_arr       : Array,
		_self):

	flags['sub_sub'] = true

	var _subs = _self.subs
	var action = _subs[sub_identifier] if _subs.has(sub_identifier) else null

	return _self.conductable._do_action(action, args_arr, false)


func sub__add(
		dict            : Dictionary,
		dict_identifier : String,
		value,
		priority_int    : int,
		_self):

	flags['sub__add'] = true


func sub__remove(
		dict            : Dictionary,
		dict_identifier : String,
		value,
		priority_int    : int,
		_self):

	flags['sub__remove'] = true


func sub___hook(
		hook_identifier : String,
		hook_args_arr   : Array,
		_hooks          : Dictionary,
		_subs           : Dictionary,
		_self):

	flags['sub___hook'] = true


func sub___filter(
		filter_identifier : String,
		filter_value,
		filter_args_arr   : Array,
		_filters          : Dictionary,
		_hooks            : Dictionary,
		_subs             : Dictionary,
		_self):

	flags['sub___filter'] = true


func sub__filter(
		filter_identifier : String,
		filter_value,
		filter_args_arr   : Array,
		_filters          : Dictionary,
		_hooks            : Dictionary,
		_subs             : Dictionary,
		_self):

	flags['sub__filter'] = true


func sub__hook(
		hook_identifier : String,
		hook_args_arr   : Array,
		_filters        : Dictionary,
		_hooks          : Dictionary,
		_subs           : Dictionary,
		_self):

	flags['sub__hook'] = true


func sub__act(
		dict            : Dictionary,
		dict_identifier : String,
		args_arr        : Array,
		filter_bool     : bool,
		filter_value,
		_self):

	flags['sub__act'] = true


func sub__do_action(
		action,
		args_arr: Array,
		return_arg: bool,
		_self):

	flags['sub__do_action'] = true

	if typeof(action) == TYPE_ARRAY:
		if action.size() == 2:
			if typeof(action[0]) == TYPE_OBJECT \
					and typeof(action[1]) == TYPE_STRING:
				action = funcref(action[0], action[1])
	elif typeof(action) == TYPE_STRING:
		action = funcref(_self, action)

	if action is FuncRef and action.is_valid():
		return action.call_funcv(args_arr + [ _self ])

	if return_arg and args_arr:
		return args_arr[0]

	return null


func test_substitutions() -> void:

	var subs: Dictionary = {
		Conductable.STR_FUNC__TO_STRING: funcref(self, 'sub__to_string'),
		Conductable.STR_FUNC___OUTPUT: funcref(self, 'sub___output'),
		Conductable.STR_FUNC_SET_FILTERS: funcref(self, 'sub_set_filters'),
		Conductable.STR_FUNC_GET_FILTERS: funcref(self, 'sub_get_filters'),
		Conductable.STR_FUNC_SET_HOOKS: funcref(self, 'sub_set_hooks'),
		Conductable.STR_FUNC_GET_HOOKS: funcref(self, 'sub_get_hooks'),
		Conductable.STR_FUNC_SET_SUBS: funcref(self, 'sub_set_subs'),
		Conductable.STR_FUNC_GET_SUBS: funcref(self, 'sub_get_subs'),
		Conductable.STR_FUNC_SIGNAL_HOOK_ADDED: funcref(self, 'sub_signal_hook_added'),
		Conductable.STR_FUNC_SIGNAL_HOOKED: funcref(self, 'sub_signal_hooked'),
		Conductable.STR_FUNC_SIGNAL_HOOK_REMOVED: funcref(self, 'sub_signal_hook_removed'),
		Conductable.STR_FUNC_SIGNAL_HOOKS_SET: funcref(self, 'sub_signal_hooks_set'),
		Conductable.STR_FUNC_SIGNAL_FILTER_ADDED: funcref(self, 'sub_signal_filter_added'),
		Conductable.STR_FUNC_SIGNAL_FILTERED: funcref(self, 'sub_signal_filtered'),
		Conductable.STR_FUNC_SIGNAL_FILTER_REMOVED: funcref(self, 'sub_signal_filter_removed'),
		Conductable.STR_FUNC_SIGNAL_FILTERS_SET: funcref(self, 'sub_signal_filters_set'),
		Conductable.STR_FUNC_SIGNAL_SUB_ADDED: funcref(self, 'sub_signal_sub_added'),
		Conductable.STR_FUNC_SIGNAL_SUBBED: funcref(self, 'sub_signal_subbed'),
		Conductable.STR_FUNC_SIGNAL_SUB_REMOVED: funcref(self, 'sub_signal_sub_removed'),
		Conductable.STR_FUNC_SIGNAL_SUBS_SET: funcref(self, 'sub_signal_subs_set'),
		Conductable.STR_FUNC_ADD_FILTER: funcref(self, 'sub_add_filter'),
		Conductable.STR_FUNC_REMOVE_FILTER: funcref(self, 'sub_remove_filter'),
		Conductable.STR_FUNC_ADD_HOOK: funcref(self, 'sub_add_hook'),
		Conductable.STR_FUNC_REMOVE_HOOK: funcref(self, 'sub_remove_hook'),
		Conductable.STR_FUNC_ADD_SUB: funcref(self, 'sub_add_sub'),
		Conductable.STR_FUNC_REMOVE_SUB: funcref(self, 'sub_remove_sub'),
		Conductable.STR_FUNC_FILTER: funcref(self, 'sub_filter'),
		Conductable.STR_FUNC_HOOK: funcref(self, 'sub_hook'),
		Conductable.STR_FUNC_SUB: funcref(self, 'sub_sub'),
		Conductable.STR_FUNC__ADD: funcref(self, 'sub__add'),
		Conductable.STR_FUNC__REMOVE: funcref(self, 'sub__remove'),
		Conductable.STR_FUNC___HOOK: funcref(self, 'sub___hook'),
		Conductable.STR_FUNC___FILTER: funcref(self, 'sub___filter'),
		Conductable.STR_FUNC__FILTER: funcref(self, 'sub__filter'),
		Conductable.STR_FUNC__HOOK: funcref(self, 'sub__hook'),
		Conductable.STR_FUNC__ACT: funcref(self, 'sub__act'),
		Conductable.STR_FUNC__DO_ACTION: funcref(self, 'sub__do_action')
	}

	var conductable: PressAccept_Conductor_Conducted = \
		Conducted.instantiate(
			'default',
			{},
			{},
			subs
		)
		
	reset_flags()

	conductable._to_string()
	assert_has(flags, 'sub__to_string')

	conductable.__output('')
	assert_has(flags, 'sub___output')

	conductable.conductable.set_filters({})
	assert_has(flags, 'sub_set_filters')

	conductable.conductable.get_filters()
	assert_has(flags, 'sub_get_filters')

	conductable.conductable.set_hooks({})
	assert_has(flags, 'sub_set_hooks')

	conductable.conductable.get_hooks()
	assert_has(flags, 'sub_get_hooks')

	conductable.conductable.set_subs({})
	assert_has(flags, 'sub_set_subs')

	conductable.conductable.get_subs()
	assert_has(flags, 'sub_get_subs')

	conductable.conductor_signal_hook_added('', null, 0)
	assert_has(flags, 'sub_signal_hook_added')

	conductable.conductor_signal_hooked('', [])
	assert_has(flags, 'sub_signal_hooked')

	conductable.conductor_signal_hook_removed('', null, 0)
	assert_has(flags, 'sub_signal_hook_removed')

	conductable.conductor_signal_hooks_set({}, {})
	assert_has(flags, 'sub_signal_hooks_set')

	conductable.conductor_signal_filter_added('', null, 0)
	assert_has(flags, 'sub_signal_filter_added')

	conductable.conductor_signal_filtered('', null, null, [])
	assert_has(flags, 'sub_signal_filtered')

	conductable.conductor_signal_filter_removed('', null, 0)
	assert_has(flags, 'sub_signal_filter_removed')

	conductable.conductor_signal_filters_set({}, {})
	assert_has(flags, 'sub_signal_filters_set')

	conductable.conductor_signal_sub_added('', null)
	assert_has(flags, 'sub_signal_sub_added')

	conductable.conductor_signal_subbed('', [], null)
	assert_has(flags, 'sub_signal_subbed')

	conductable.conductor_signal_sub_removed('', null)
	assert_has(flags, 'sub_signal_sub_removed')

	conductable.conductor_signal_subs_set({}, {})
	assert_has(flags, 'sub_signal_subs_set')

	conductable.add_filter('', null)
	assert_has(flags, 'sub_add_filter')

	conductable.remove_filter('', null)
	assert_has(flags, 'sub_remove_filter')

	conductable.add_hook('', null)
	assert_has(flags, 'sub_add_hook')

	conductable.remove_hook('', null)
	assert_has(flags, 'sub_remove_hook')

	conductable.add_sub('', null)
	assert_has(flags, 'sub_add_sub')

	conductable.remove_sub('')
	assert_has(flags, 'sub_remove_sub')

	conductable.filter('', null)
	assert_has(flags, 'sub_filter')

	conductable.hook('')
	assert_has(flags, 'sub_hook')

	conductable.sub('')
	assert_has(flags, 'sub_sub')

	conductable.conductable._add({}, '', null)
	assert_has(flags, 'sub__add')

	conductable.conductable._remove({}, '', null)
	assert_has(flags, 'sub__remove')

	conductable.conductable.__hook('')
	assert_has(flags, 'sub___hook')

	conductable.conductable.__filter('', null)
	assert_has(flags, 'sub___filter')

	conductable.conductable._filter('', null)
	assert_has(flags, 'sub__filter')

	conductable.conductable._hook('')
	assert_has(flags, 'sub__hook')

	conductable.conductable._act({}, '')
	assert_has(flags, 'sub__act')
	
	reset_flags()

	conductable.conductable._do_action('')
	assert_has(flags, 'sub__do_action')

