tool
class_name PressAccept_Conductor_Conductable

# |=============================================================|
# |                                                             |
# |                   Press Accept: Conductor                   |
# | Dynamic Overriding And Aspect-Oriented Programming In Godot |
# |                                                             |
# |=============================================================|
#
# By implementing three types of dynamic overrides we can create objects that
# are highly configurable, even to the point of being able to externally
# override method calls (subtitutions).
#
# The three types of dynamic overrides are:
#
#     * Filters, which are used to pass a given value through various 'filter'
#           methods which may alter that value given a context
#
#     * Hooks, which are used to call external methods at given 'join points'
#           with a context when certain actions occur.
#
#     * Substitutions (or subs), which entirely override a given method with
#           the same arguments with an externally provided method.
#
# This package allows you to create dynamic overriding either as a property, or
# through mixin composition using Mixer.instantiate`
#
# |------------------|
# | Meta Information |
# |------------------|
#
# Organization Namespace : PressAccept
# Package Namespace      : Conductor
# Class                  : Conductable
#
# Organization        : Press Accept
# Organization URI    : https://pressaccept.com/
# Organization Social : @pressaccept
#
# Author        : Asher Kadar Wolfstein
# Author URI    : https://wunk.me/ (Personal Blog)
# Author Social : https://incarnate.me/members/asherwolfstein/
#                 @asherwolfstein (Twitter)
#                 https://ko-fi.com/asherwolfstein
#
# Copyright : Press Accept: Conductor © 2021 The Novelty Factor LLC
#                 (Press Accept, Asher Kadar Wolfstein)
# License   : Proprietary. All Rights Reserved.
#
# |-----------|
# | Changelog |
# |-----------|
#
# 1.0.0    01/21/2022    First Release
#

# ***********
# | Signals |
# ***********

# fired on add_hook
signal conductable_hook_added     (identifier, value, priority, emitter)

# fired on hook
signal conductable_hooked         (identifier, args, emitter)

# fired on remove_hook
signal conductable_hook_removed   (identifier, value, priority, emitter)

# fired on hook access
signal conductable_hooks_set      (new_hooks, old_hooks, emitter)

# fired on add_filter
signal conductable_filter_added   (identifier, value, priority, emitter)

# fired on filter
signal conductable_filtered       (identifier, input, output, args, emitter)

# fired on remove_filter
signal conductable_filter_removed (identifier, value, priority, emitter)

# fired on filter access
signal conductable_filters_set    (new_filters, old_filters, emitter)

# fired on add_sub
signal conductable_sub_added      (identifier, value, emitter)

# fired on sub
signal conductable_subbed         (identifier, args, return_value, emitter)

# fired on remove_sub
signal conductable_sub_removed    (identifier, value, emitter)

# fired on sub access (with a new value)
signal conductable_subs_set       (new_subs, old_subs, emitter)

# *************
# | Constants |
# *************

const STR_SIGNAL_HOOK_ADDED     : String = 'conductable_hook_added'
const STR_SIGNAL_HOOKED         : String = 'conductable_hooked'
const STR_SIGNAL_HOOK_REMOVED   : String = 'conductable_hook_removed'
const STR_SIGNAL_HOOKS_SET      : String = 'conductable_hooks_set'
const STR_SIGNAL_FILTER_ADDED   : String = 'conductable_filter_added'
const STR_SIGNAL_FILTERED       : String = 'conductable_filtered'
const STR_SIGNAL_FILTER_REMOVED : String = 'conductable_filter_removed'
const STR_SIGNAL_FILTERS_SET    : String = 'conductable_filters_set'
const STR_SIGNAL_SUB_ADDED      : String = 'conductable_sub_added'
const STR_SIGNAL_SUBBED         : String = 'conductable_subbed'
const STR_SIGNAL_SUB_REMOVED    : String = 'conductable_sub_removed'
const STR_SIGNAL_SUBS_SET       : String = 'conductable_subs_set'

const STR_IDENTIFIER_SEPARATOR : String = '/'
const STR_IDENTIFIER_BASE  : String = 'conductable' + STR_IDENTIFIER_SEPARATOR
const STR_HOOK_BASE        : String = 'STR_HOOK_'
const STR_FILTER_BASE      : String = 'STR_FILTER_'

const STR_HOOK_OUTPUT             : String = STR_IDENTIFIER_BASE + 'output'
const STR_HOOK_SET_FILTERS        : String = \
	STR_IDENTIFIER_BASE + 'set_filters'
const STR_HOOK_GET_FILTERS        : String = \
	STR_IDENTIFIER_BASE + 'get_filters'
const STR_HOOK_SET_HOOKS          : String = STR_IDENTIFIER_BASE + 'set_hooks'
const STR_HOOK_GET_HOOKS          : String = STR_IDENTIFIER_BASE + 'get_hooks'
const STR_HOOK_SET_SUBS           : String = STR_IDENTIFIER_BASE + 'set_subs'
const STR_HOOK_GET_SUBS           : String = STR_IDENTIFIER_BASE + 'get_subs'
const STR_HOOK_PRE_ADD_HOOK       : String = \
	STR_IDENTIFIER_BASE + 'pre_add_hook'
const STR_HOOK_POST_ADD_HOOK      : String = \
	STR_IDENTIFIER_BASE + 'post_add_hook'
const STR_HOOK_PRE_REMOVE_HOOK    : String = \
	STR_IDENTIFIER_BASE + 'pre_remove_hook'
const STR_HOOK_POST_REMOVE_HOOK   : String = \
	STR_IDENTIFIER_BASE + 'post_remove_hook'
const STR_HOOK_PRE_ADD_FILTER     : String = \
	STR_IDENTIFIER_BASE + 'pre_add_filter'
const STR_HOOK_POST_ADD_FILTER    : String = \
	STR_IDENTIFIER_BASE + 'post_add_filter'
const STR_HOOK_PRE_REMOVE_FILTER  : String = \
	STR_IDENTIFIER_BASE + 'pre_remove_filter'
const STR_HOOK_POST_REMOVE_FILTER : String = \
	STR_IDENTIFIER_BASE + 'post_remove_filter'
const STR_HOOK_PRE_ADD_SUB        : String = \
	STR_IDENTIFIER_BASE + 'pre_add_sub'
const STR_HOOK_POST_ADD_SUB       : String = \
	STR_IDENTIFIER_BASE + 'post_add_sub'
const STR_HOOK_PRE_REMOVE_SUB     : String = \
	STR_IDENTIFIER_BASE + 'pre_remove_sub'
const STR_HOOK_POST_REMOVE_SUB    : String = \
	STR_IDENTIFIER_BASE + 'post_remove_sub'
const STR_HOOK_PRE_HOOK           : String = STR_IDENTIFIER_BASE + 'pre_hook'
const STR_HOOK_POST_HOOK          : String = STR_IDENTIFIER_BASE + 'post_hook'
const STR_HOOK_PRE_FILTER         : String = STR_IDENTIFIER_BASE + 'pre_filter'
const STR_HOOK_POST_FILTER        : String = \
	STR_IDENTIFIER_BASE + 'post_filter'
const STR_HOOK_PRE_SUB            : String = STR_IDENTIFIER_BASE + 'pre_sub'
const STR_HOOK_POST_SUB           : String = STR_IDENTIFIER_BASE + 'post_sub'

const STR_FILTER_OUTPUT        : String = STR_IDENTIFIER_BASE + 'output'
const STR_FILTER_NEW_FILTERS   : String = STR_IDENTIFIER_BASE + 'new_filters'
const STR_FILTER_FILTERS       : String = STR_IDENTIFIER_BASE + 'filters'
const STR_FILTER_NEW_HOOKS     : String = STR_IDENTIFIER_BASE + 'new_hooks'
const STR_FILTER_HOOKS         : String = STR_IDENTIFIER_BASE + 'hooks'
const STR_FILTER_NEW_SUBS      : String = STR_IDENTIFIER_BASE + 'new_subs'
const STR_FILTER_SUBS          : String = STR_IDENTIFIER_BASE + 'subs'

const STR_FILTER_ADD_FILTER_IDENTIFIER : String = \
	STR_IDENTIFIER_BASE + 'add_filter_identifier'
const STR_FILTER_ADD_FILTER_VALUE      : String = \
	STR_IDENTIFIER_BASE + 'add_filter_value'

const STR_FILTER_REMOVE_FILTER_IDENTIFIER : String = \
	STR_IDENTIFIER_BASE + 'remove_filter_identifier'
const STR_FILTER_REMOVE_FILTER_VALUE      : String = \
	STR_IDENTIFIER_BASE + 'remove_filter_value'

const STR_FILTER_ADD_HOOK_IDENTIFIER : String = \
	STR_IDENTIFIER_BASE + 'add_hook_identifier'
const STR_FILTER_ADD_HOOK_VALUE      : String = \
	STR_IDENTIFIER_BASE + 'add_hook_value'

const STR_FILTER_REMOVE_HOOK_IDENTIFIER : String = \
	STR_IDENTIFIER_BASE + 'remove_hook_identifier'
const STR_FILTER_REMOVE_HOOK_VALUE      : String = \
	STR_IDENTIFIER_BASE + 'remove_hook_value'

const STR_FILTER_ADD_SUB_IDENTIFIER  : String = \
	STR_IDENTIFIER_BASE + 'add_sub_identifier'
const STR_FILTER_ADD_SUB_VALUE       : String = \
	STR_IDENTIFIER_BASE + 'add_sub_value'

const STR_FILTER_REMOVE_SUB_IDENTIFIER : String = \
	STR_IDENTIFIER_BASE + 'remove_sub_identifier'
const STR_FILTER_REMOVE_SUB_VALUE      : String = \
	STR_IDENTIFIER_BASE + 'remove_sub_value'
const STR_FILTER_SUB_ACTION            : String = \
	STR_IDENTIFIER_BASE + 'sub_action'

const STR_FILTER_FILTER_IDENTIFIER     : String = \
	STR_IDENTIFIER_BASE + 'filter_identifier'
const STR_FILTER_FILTER_ARGS_ARR       : String = \
	STR_IDENTIFIER_BASE + 'filter_args_arr'

const STR_FILTER_HOOK_IDENTIFIER       : String = \
	STR_IDENTIFIER_BASE + 'hook_identifier'
const STR_FILTER_HOOK_ARGS_ARR         : String = \
	STR_IDENTIFIER_BASE + 'hook_args_arr'

const STR_FILTER_SUB_IDENTIFIER       : String = \
	STR_IDENTIFIER_BASE + 'sub_identifier'
const STR_FILTER_SUB_ARGS_ARR         : String = \
	STR_IDENTIFIER_BASE + 'sub_args_arr'

const STR_FUNC__TO_STRING            : String = '_to_string'
const STR_FUNC___OUTPUT              : String = '__output'
const STR_FUNC_SET_FILTERS           : String = 'set_filters'
const STR_FUNC_GET_FILTERS           : String = 'get_filters'
const STR_FUNC_SET_HOOKS             : String = 'set_hooks'
const STR_FUNC_GET_HOOKS             : String = 'get_hooks'
const STR_FUNC_SET_SUBS              : String = 'set_subs'
const STR_FUNC_GET_SUBS              : String = 'get_subs'
const STR_FUNC_SIGNAL_HOOK_ADDED     : String = 'signal_hook_added'
const STR_FUNC_SIGNAL_HOOKED         : String = 'signal_hooked'
const STR_FUNC_SIGNAL_HOOK_REMOVED   : String = 'signal_hook_removed'
const STR_FUNC_SIGNAL_HOOKS_SET      : String = 'signal_hooks_set'
const STR_FUNC_SIGNAL_FILTER_ADDED   : String = 'signal_filter_added'
const STR_FUNC_SIGNAL_FILTERED       : String = 'signal_filtered'
const STR_FUNC_SIGNAL_FILTER_REMOVED : String = 'signal_filter_removed'
const STR_FUNC_SIGNAL_FILTERS_SET    : String = 'signal_filters_set'
const STR_FUNC_SIGNAL_SUB_ADDED      : String = 'signal_sub_added'
const STR_FUNC_SIGNAL_SUBBED         : String = 'signal_subbed'
const STR_FUNC_SIGNAL_SUB_REMOVED    : String = 'signal_sub_removed'
const STR_FUNC_SIGNAL_SUBS_SET       : String = 'signal_subs_set'
const STR_FUNC_ADD_FILTER            : String = 'add_filter'
const STR_FUNC_REMOVE_FILTER         : String = 'remove_filter'
const STR_FUNC_ADD_HOOK              : String = 'add_hook'
const STR_FUNC_REMOVE_HOOK           : String = 'remove_hook'
const STR_FUNC_ADD_SUB               : String = 'add_sub'
const STR_FUNC_REMOVE_SUB            : String = 'remove_sub'
const STR_FUNC_FILTER                : String = 'filter'
const STR_FUNC_HOOK                  : String = 'hook'
const STR_FUNC_SUB                   : String = 'sub'
const STR_FUNC__ADD                  : String = '_add'
const STR_FUNC__REMOVE               : String = '_remove'
const STR_FUNC___HOOK                : String = '__hook'
const STR_FUNC___FILTER              : String = '__filter'
const STR_FUNC__FILTER               : String = '_filter'
const STR_FUNC__HOOK                 : String = '_hook'
const STR_FUNC__ACT                  : String = '_act'
const STR_FUNC__DO_ACTION            : String = '_do_action'

const STR_MIXIN_IDENTIFIER: String = 'conductable'

const INT_DEFAULT_PRIORITY: int = 10

# *************************
# | Meta Static Functions |
# *************************


static func __mixable_info() -> PressAccept_Mixer_Mixin:

	var mixin_info: PressAccept_Mixer_Mixin = \
		PressAccept_Mixer_Mixin.new(
			STR_MIXIN_IDENTIFIER,
			'res://addons/PressAccept/Conductor/Conductable.gd'
		)

	mixin_info.add_signals(
		[
			STR_SIGNAL_HOOK_ADDED,
			STR_SIGNAL_HOOKED,
			STR_SIGNAL_HOOK_REMOVED,
			STR_SIGNAL_HOOKS_SET,
			STR_SIGNAL_FILTER_ADDED,
			STR_SIGNAL_FILTERED,
			STR_SIGNAL_FILTER_REMOVED,
			STR_SIGNAL_FILTERS_SET,
			STR_SIGNAL_SUB_ADDED,
			STR_SIGNAL_SUBBED,
			STR_SIGNAL_SUB_REMOVED,
			STR_SIGNAL_SUBS_SET
		]
	)

	mixin_info.add_properties(
		[
			'filters',
			'hooks',
			'subs'
		]
	)

	mixin_info.add_methods(
		[
			STR_FUNC_SIGNAL_HOOK_ADDED,
			STR_FUNC_SIGNAL_HOOKED,
			STR_FUNC_SIGNAL_HOOK_REMOVED,
			STR_FUNC_SIGNAL_HOOKS_SET,
			STR_FUNC_SIGNAL_FILTER_ADDED,
			STR_FUNC_SIGNAL_FILTERED,
			STR_FUNC_SIGNAL_FILTER_REMOVED,
			STR_FUNC_SIGNAL_FILTERS_SET,
			STR_FUNC_SIGNAL_SUB_ADDED,
			STR_FUNC_SIGNAL_SUBBED,
			STR_FUNC_SIGNAL_SUB_REMOVED,
			STR_FUNC_SIGNAL_SUBS_SET,
			STR_FUNC__TO_STRING,
			STR_FUNC___OUTPUT,
			STR_FUNC_ADD_FILTER,
			STR_FUNC_REMOVE_FILTER,
			STR_FUNC_ADD_HOOK,
			STR_FUNC_REMOVE_HOOK,
			STR_FUNC_ADD_SUB,
			STR_FUNC_REMOVE_SUB,
			STR_FUNC_FILTER,
			STR_FUNC_HOOK,
			STR_FUNC_SUB
		]
	)

	return mixin_info


# ***************************
# | Public Static Functions |
# ***************************


# is object hookable?
static func hookable(
		object: Object) -> bool: # String | Script

	return object.has_method('add_hook')


# is object filterable?
static func filterable(
		object: Object) -> bool: # String | Script

	return object.has_method('add_filter')


# get all hook STR_HOOK_ constants of a script
static func get_all_hook_constants(
		type, # String | Script
		hook_prefix: String = STR_HOOK_BASE) -> Dictionary:

	var constants : Dictionary = \
		PressAccept_Typer_ObjectInfo.script_constant_info(type)
	var ret       : Dictionary = {}

	for key in constants:
		if key.begins_with(hook_prefix):
			ret[key] = constants[key]

	return ret


# get all filter STR_FILTER_ constants of a script
static func get_all_filter_constants(
		type, # String | Script
		filter_prefix: String = STR_FILTER_BASE) -> Dictionary:

	var constants : Dictionary = \
		PressAccept_Typer_ObjectInfo.script_constant_info(type)
	var ret       : Dictionary = {}

	for key in constants:
		if key.begins_with(filter_prefix):
			ret[key] = constants[key]

	return ret


# *********************
# | Public Properties |
# *********************

var filters : Dictionary = {} setget set_filters , get_filters
var hooks   : Dictionary = {} setget set_hooks   , get_hooks
var subs    : Dictionary = {} setget set_subs    , get_subs

# **********************
# | Private Properties |
# **********************

var _self: Object # mixed container

# ***************
# | Constructor |
# ***************


func _init(
		init_self    : Object) -> void:

	_self = init_self


# ********************
# | Built-In Methods |
# ********************


func _to_string() -> String:

	if _self.subs.has(STR_FUNC__TO_STRING):
		return _self.sub(STR_FUNC__TO_STRING)

	return __output('')


# pretty print the dictionary information prefaced by, and using a whitespace
func __output(
		prefix: String,
		tab_char: String = "\t") -> String:

	var _subs: Dictionary = _self.subs
	if _subs.has(STR_FUNC___OUTPUT):
		return _self.sub(STR_FUNC___OUTPUT, [ prefix, tab_char ])

	var _hooks: Dictionary = _self.hooks
	if _hooks.has(STR_HOOK_OUTPUT):
		_self.hook(STR_HOOK_OUTPUT, [ prefix, tab_char ])

	var output_str: String = ""

	output_str += "\n" + prefix + _self.__get_script() \
		+ '/' + STR_MIXIN_IDENTIFIER + " ="

	var _filters: Dictionary = _self.filters
	for set in [ [ 'hooks', _hooks ], [ 'filters', _filters ]]:
		output_str += "\n" + prefix + tab_char + set[0] + ':'
		for key in set[1]:
			output_str += "\n" + prefix + tab_char + tab_char + key + ': '
			for element in set[1][key]:
				if element[0] is Object \
						and element[0].has_method('__output'):
					output_str += element[0].__output(
						prefix + tab_char + tab_char + tab_char,
						tab_char
					)
				else:
					output_str += str(element[0])
				output_str += ', ' + str(element[1])

	output_str += "\n" + prefix + tab_char + 'subs:'
	for key in _subs:
		output_str += "\n" + prefix + tab_char + tab_char + key + ': '
		if _subs[key] is Object and _subs[key].has_method('__output'):
			output_str += _subs[key].__output(
				prefix + tab_char + tab_char + tab_char,
				tab_char
			)
		else:
			output_str += str(_subs[key])

	if _filters.has(STR_FILTER_OUTPUT):
		return _self.filter(
			STR_FILTER_OUTPUT,
			output_str,
			[ prefix, tab_char ]
		)
	else:
		return output_str


# ******************
# | SetGet Methods |
# ******************


func _normalize_dict(
		dict: Dictionary) -> void: # pass by reference

	for key in dict:
		if typeof(dict[key]) != TYPE_ARRAY:
			dict[key] = [ [ dict[key], INT_DEFAULT_PRIORITY ] ]


func set_filters(
		new_filters: Dictionary) -> void:

	if _self.subs.has(STR_FUNC_SET_FILTERS):
		_self.sub(STR_FUNC_SET_FILTERS, [ new_filters ])
		return

	if filters == new_filters:
		# Godot calls this on indexed assignment, but it's already equal
		return

	_normalize_dict(new_filters)

	var old_filters = _self.filters

	if filters.has(STR_FILTER_NEW_FILTERS):
		new_filters = _filter(
			STR_FILTER_NEW_FILTERS,
			new_filters,
			[],
			filters,
			hooks,
			subs
		)

	filters = new_filters

	if hooks.has(STR_HOOK_SET_FILTERS):
		_hook(
			STR_HOOK_SET_FILTERS,
			[ new_filters, old_filters ],
			filters,
			hooks,
			subs
		)

	signal_filters_set(_self.filters, old_filters)


func get_filters() -> Dictionary:

	if subs.has(STR_FUNC_GET_FILTERS):
		return _do_action(subs[STR_FUNC_GET_FILTERS], [])

	if hooks.has(STR_HOOK_GET_FILTERS):
		_hook(
			STR_HOOK_GET_FILTERS,
			[ filters ],
			filters,
			hooks,
			subs
		)

	if filters.has(STR_FILTER_FILTERS):
		return _filter(
			STR_FILTER_FILTERS,
			filters,
			[],
			filters,
			hooks,
			subs
		)

	return filters


func set_hooks(
		new_hooks: Dictionary) -> void:

	if _self.subs.has(STR_FUNC_SET_HOOKS):
		_self.sub(STR_FUNC_SET_HOOKS, [ new_hooks ])
		return

	if hooks == new_hooks:
		# Godot calls this on indexed assignment, but it's already equal
		return

	_normalize_dict(new_hooks)

	var old_hooks = _self.hooks

	if filters.has(STR_FILTER_NEW_HOOKS):
		new_hooks = _filter(
			STR_FILTER_NEW_HOOKS,
			new_hooks,
			[],
			filters,
			hooks,
			subs
		)

	hooks = new_hooks

	if hooks.has(STR_HOOK_SET_HOOKS):
		_hook(
			STR_HOOK_SET_HOOKS,
			[ new_hooks, old_hooks ],
			filters,
			hooks,
			subs
		)

	signal_hooks_set(_self.hooks, old_hooks)


func get_hooks() -> Dictionary:

	if subs.has(STR_FUNC_GET_HOOKS):
		return _do_action(subs[STR_FUNC_GET_HOOKS], [])

	if hooks.has(STR_HOOK_GET_HOOKS):
		_hook(
			STR_HOOK_GET_HOOKS,
			[ hooks ],
			filters,
			hooks,
			subs
		)

	if filters.has(STR_FILTER_HOOKS):
		return _filter(
			STR_FILTER_HOOKS,
			hooks,
			[],
			filters,
			hooks,
			subs
		)

	return hooks


func set_subs(
		new_subs: Dictionary) -> void:

	var _subs : Dictionary = _self.subs
	if _subs.has(STR_FUNC_SET_SUBS):
		_self.sub(STR_FUNC_SET_SUBS, [ new_subs ])
		return

	if subs == new_subs:
		# Godot calls this on indexed assignment, but it's already equal
		return

	var old_subs = _subs

	if filters.has(STR_FILTER_NEW_SUBS):
		new_subs = _filter(
			STR_FILTER_NEW_SUBS,
			new_subs,
			[],
			filters,
			hooks,
			subs
		)

	subs = new_subs

	if hooks.has(STR_HOOK_SET_SUBS):
		_hook(
			STR_HOOK_SET_SUBS,
			[ new_subs, old_subs ],
			filters,
			hooks,
			subs
		)

	signal_subs_set(_self.subs, old_subs)


func get_subs() -> Dictionary:

	if subs.has(STR_FUNC_GET_SUBS):
		return _do_action(subs[STR_FUNC_GET_SUBS], [])

	if hooks.has(STR_HOOK_GET_SUBS):
		_hook(
			STR_HOOK_GET_SUBS,
			[ subs ],
			filters,
			hooks,
			subs
		)

	if filters.has(STR_FILTER_SUBS):
		return _filter(
			STR_FILTER_SUBS,
			subs,
			[],
			filters,
			hooks,
			subs
		)

	return subs


# ******************
# | Signal Methods |
# ******************


func signal_hook_added(
		identifier : String,
		value,
		priority   : int) -> void:

	if subs.has(STR_FUNC_SIGNAL_HOOK_ADDED):
		_do_action(
			subs[STR_FUNC_SIGNAL_HOOK_ADDED],
			[ identifier, value, priority ]
		)
		return

	emit_signal(STR_SIGNAL_HOOK_ADDED, identifier, value, priority, _self)


func signal_hooked(
		identifier : String,
		args       : Array) -> void:

	if subs.has(STR_FUNC_SIGNAL_HOOKED):
		_do_action(subs[STR_FUNC_SIGNAL_HOOKED], [ identifier, args ])
		return

	emit_signal(STR_SIGNAL_HOOKED, identifier, args, _self)


func signal_hook_removed(
		identifier: String,
		value,
		priority: int) -> void:

	if subs.has(STR_FUNC_SIGNAL_HOOK_REMOVED):
		_do_action(
			subs[STR_FUNC_SIGNAL_HOOK_REMOVED],
			[ identifier, value, priority ]
		)
		return

	emit_signal(STR_SIGNAL_HOOK_REMOVED, identifier, value, priority, _self)


func signal_hooks_set(
		new_hooks: Dictionary,
		old_hooks: Dictionary) -> void:

	if subs.has(STR_FUNC_SIGNAL_HOOKS_SET):
		_do_action(subs[STR_FUNC_SIGNAL_HOOKS_SET], [ new_hooks, old_hooks ])
		return

	emit_signal(STR_SIGNAL_HOOKS_SET, new_hooks, old_hooks, _self)


func signal_filter_added(
		identifier : String,
		value,
		priority   : int) -> void:

	if subs.has(STR_FUNC_SIGNAL_FILTER_ADDED):
		_do_action(
			subs[STR_FUNC_SIGNAL_FILTER_ADDED],
			[ identifier, value, priority ]
		)
		return

	emit_signal(STR_SIGNAL_FILTER_ADDED, identifier, value, priority, _self)


func signal_filtered(
		identifier : String,
		input,
		output,
		args       : Array) -> void:

	if subs.has(STR_FUNC_SIGNAL_FILTERED):
		_do_action(
			subs[STR_FUNC_SIGNAL_FILTERED],
			[ identifier, input, output, args ]
		)
		return

	emit_signal(STR_SIGNAL_FILTERED, identifier, input, output, args, _self)


func signal_filter_removed(
		identifier : String,
		value,
		priority   : int) -> void:

	if subs.has(STR_FUNC_SIGNAL_FILTER_REMOVED):
		_do_action(
			subs[STR_FUNC_SIGNAL_FILTER_REMOVED],
			[ identifier, value, priority ]
		)
		return

	emit_signal(STR_SIGNAL_FILTER_REMOVED, identifier, value, priority, _self)


func signal_filters_set(
		new_filters: Dictionary,
		old_filters: Dictionary) -> void:

	if subs.has(STR_FUNC_SIGNAL_FILTERS_SET):
		_do_action(
			subs[STR_FUNC_SIGNAL_FILTERS_SET],
			[ new_filters, old_filters ]
		)
		return

	emit_signal(STR_SIGNAL_FILTERS_SET, new_filters, old_filters, _self)


func signal_sub_added(
		identifier: String,
		value) -> void:

	if subs.has(STR_FUNC_SIGNAL_SUB_ADDED):
		_do_action(
			subs[STR_FUNC_SIGNAL_SUB_ADDED],
			[ identifier, value ]
		)
		return

	emit_signal(STR_SIGNAL_SUB_ADDED, identifier, value, _self)


func signal_subbed(
		identifier : String,
		args       : Array,
		return_value) -> void:

	if subs.has(STR_FUNC_SIGNAL_SUBBED):
		_do_action(
			subs[STR_FUNC_SIGNAL_SUBBED],
			[ identifier, args, return_value ]
		)
		return

	emit_signal(STR_SIGNAL_SUBBED, identifier, args, return_value, _self)


func signal_sub_removed(
		identifier: String,
		value) -> void:

	if subs.has(STR_FUNC_SIGNAL_SUB_REMOVED):
		_do_action(
			subs[STR_FUNC_SIGNAL_SUB_REMOVED],
			[ identifier, value ]
		)
		return

	emit_signal(STR_SIGNAL_SUB_REMOVED, identifier, value, _self)


func signal_subs_set(
		new_subs: Dictionary,
		old_subs: Dictionary) -> void:

	if subs.has(STR_FUNC_SIGNAL_SUBS_SET):
		_do_action(
			subs[STR_FUNC_SIGNAL_SUBS_SET],
			[ new_subs, old_subs ]
		)
		return

	emit_signal(STR_SIGNAL_SUBS_SET, new_subs, old_subs, _self)


# ******************
# | Public Methods |
# ******************


func add_filter(
		new_filter_identifier : String,
		new_filter_value, # FuncRef | Array | String
		priority_int          : int = INT_DEFAULT_PRIORITY) -> void:

	var _subs: Dictionary = _self.subs
	if _subs.has(STR_FUNC_ADD_FILTER):
		_self.sub(
			STR_FUNC_ADD_FILTER,
			[ new_filter_identifier, new_filter_value, priority_int ]
		)
		return

	var _filters : Dictionary = _self.filters
	var _hooks   : Dictionary = _self.hooks

	if _filters.has(STR_FILTER_ADD_FILTER_IDENTIFIER):
		new_filter_identifier = _filter(
			STR_FILTER_ADD_FILTER_IDENTIFIER,
			new_filter_identifier,
			[ new_filter_value, priority_int, _filters ],
			_filters,
			_hooks,
			_subs
		)

	if _filters.has(STR_FILTER_ADD_FILTER_VALUE):
		new_filter_value = _filter(
			STR_FILTER_ADD_FILTER_VALUE,
			new_filter_value,
			[ new_filter_identifier, priority_int, _filters ],
			_filters,
			_hooks,
			_subs
		)

	if not new_filter_identifier or not new_filter_value:
		return

	if _hooks.has(STR_HOOK_PRE_ADD_FILTER):
		_hook(
			STR_HOOK_PRE_ADD_FILTER,
			[ new_filter_identifier, new_filter_value, priority_int ],
			_filters,
			_hooks,
			_subs
		)

	_add(_filters, new_filter_identifier, new_filter_value, priority_int)

	signal_filter_added(new_filter_identifier, new_filter_value, priority_int)

	if _hooks.has(STR_HOOK_POST_ADD_FILTER):
		_hook(
			STR_HOOK_POST_ADD_FILTER,
			[ new_filter_identifier, new_filter_value, priority_int ],
			_filters,
			_hooks,
			_subs
		)


func remove_filter(
		remove_filter_identifier : String,
		remove_filter_value,  # FuncRef | Array | String
		priority_int             : int = -1) -> bool:

	var _subs: Dictionary = _self.subs
	if _subs.has(STR_FUNC_REMOVE_FILTER):
		return _self.sub(
			STR_FUNC_REMOVE_FILTER,
			[ remove_filter_identifier, remove_filter_value, priority_int ]
		)

	var _filters : Dictionary = _self.filters
	var _hooks   : Dictionary = _self.hooks

	if _filters.has(STR_FILTER_REMOVE_FILTER_IDENTIFIER):
		remove_filter_identifier = _filter(
			STR_FILTER_REMOVE_FILTER_IDENTIFIER,
			remove_filter_identifier,
			[ remove_filter_value, priority_int, _filters ],
			_filters,
			_hooks,
			_subs
		)

	if _filters.has(STR_FILTER_REMOVE_FILTER_VALUE):
		remove_filter_value = _filter(
			STR_FILTER_REMOVE_FILTER_VALUE,
			remove_filter_value,
			[ remove_filter_identifier, priority_int, _filters ],
			_filters,
			_hooks,
			_subs
		)

	if not remove_filter_identifier or not remove_filter_value:
		return false

	if _hooks.has(STR_HOOK_PRE_REMOVE_FILTER):
		_hook(
			STR_HOOK_PRE_REMOVE_FILTER,
			[ remove_filter_identifier, remove_filter_value, priority_int ],
			_filters,
			_hooks,
			_subs
		)

	var ret: bool = _remove(
		_filters,
		remove_filter_identifier,
		remove_filter_value,
		priority_int
	)

	signal_filter_removed(
		remove_filter_identifier,
		remove_filter_value,
		priority_int
	)

	if _hooks.has(STR_HOOK_POST_REMOVE_FILTER):
		_hook(
			STR_HOOK_POST_REMOVE_FILTER,
			[ remove_filter_identifier, remove_filter_value, priority_int ],
			_filters,
			_hooks,
			_subs
		)

	return ret


func add_hook(
		new_hook_identifier : String,
		new_hook_value,  # FuncRef | Array | String
		priority_int        : int = INT_DEFAULT_PRIORITY) -> void:

	var _subs: Dictionary = _self.subs
	if _subs.has(STR_FUNC_ADD_HOOK):
		_self.sub(
			STR_FUNC_ADD_HOOK,
			[ new_hook_identifier, new_hook_value, priority_int ]
		)
		return

	var _filters : Dictionary = _self.filters
	var _hooks   : Dictionary = _self.hooks

	if _filters.has(STR_FILTER_ADD_HOOK_IDENTIFIER):
		new_hook_identifier = _filter(
			STR_FILTER_ADD_HOOK_IDENTIFIER,
			new_hook_identifier,
			[ new_hook_value, priority_int, _hooks ],
			_filters,
			_hooks,
			_subs
		)

	if _filters.has(STR_FILTER_ADD_HOOK_VALUE):
		new_hook_value = _filter(
			STR_FILTER_ADD_HOOK_VALUE,
			new_hook_value,
			[ new_hook_identifier, priority_int, _hooks ],
			_filters,
			_hooks,
			_subs
		)

	if not new_hook_identifier or not new_hook_value:
		return

	if _hooks.has(STR_HOOK_PRE_ADD_HOOK):
		_hook(
			STR_HOOK_PRE_ADD_HOOK,
			[ new_hook_identifier, new_hook_value, priority_int ],
			_filters,
			_hooks,
			_subs
		)

	_add(_hooks, new_hook_identifier, new_hook_value, priority_int)

	signal_hook_added(new_hook_identifier, new_hook_value, priority_int)

	if _hooks.has(STR_HOOK_POST_ADD_HOOK):
		_hook(
			STR_HOOK_POST_ADD_HOOK,
			[ new_hook_identifier, new_hook_value, priority_int ],
			_filters,
			_hooks,
			_subs
		)


func remove_hook(
		remove_hook_identifier : String,
		remove_hook_value,  # FuncRef | Array | String
		priority_int           : int = -1) -> bool:

	var _subs = _self.subs
	if _subs.has(STR_FUNC_REMOVE_HOOK):
		return _self.sub(
			STR_FUNC_REMOVE_HOOK,
			[ remove_hook_identifier, remove_hook_value, priority_int ]
		)

	var _filters : Dictionary = _self.filters
	var _hooks   : Dictionary = _self.hooks

	if _filters.has(STR_FILTER_REMOVE_HOOK_IDENTIFIER):
		remove_hook_identifier = _filter(
			STR_FILTER_REMOVE_HOOK_IDENTIFIER,
			remove_hook_identifier,
			[ remove_hook_value, priority_int, _hooks ],
			_filters,
			_hooks,
			_subs
		)

	if _filters.has(STR_FILTER_REMOVE_HOOK_VALUE):
		remove_hook_value = _filter(
			STR_FILTER_REMOVE_HOOK_VALUE,
			remove_hook_value,
			[ remove_hook_identifier, priority_int, _hooks ],
			_filters,
			_hooks,
			_subs
		)

	if not remove_hook_identifier or not remove_hook_value:
		return false

	if _hooks.has(STR_HOOK_PRE_REMOVE_HOOK):
		_hook(
			STR_HOOK_PRE_REMOVE_HOOK,
			[ remove_hook_identifier, remove_hook_value, priority_int ],
			_filters,
			_hooks,
			_subs
		)

	var ret: bool = _remove(
		_hooks,
		remove_hook_identifier,
		remove_hook_value,
		priority_int
	)

	signal_hook_removed(
		remove_hook_identifier,
		remove_hook_value,
		priority_int
	)

	if _hooks.has(STR_HOOK_POST_REMOVE_HOOK):
		_hook(
			STR_HOOK_POST_REMOVE_HOOK,
			[ remove_hook_identifier, remove_hook_value, priority_int ],
			_filters,
			_hooks,
			_subs
		)

	return ret


func add_sub(
		sub_identifier: String,
		sub_value) -> void: # FuncRef | Array | String

	var _subs: Dictionary = _self.subs
	if _subs.has(STR_FUNC_ADD_SUB):
		_self.sub(STR_FUNC_ADD_SUB, [ sub_identifier, sub_value ])
		return

	var _filters : Dictionary = _self.filters
	var _hooks   : Dictionary = _self.hooks

	if _filters.has(STR_FILTER_ADD_SUB_IDENTIFIER):
		sub_identifier = _filter(
			STR_FILTER_ADD_SUB_IDENTIFIER,
			sub_identifier,
			[ sub_value, _subs ],
			_filters,
			_hooks,
			_subs
		)

	if _filters.has(STR_FILTER_ADD_SUB_VALUE):
		sub_value = _filter(
			STR_FILTER_ADD_SUB_VALUE,
			sub_value,
			[ sub_identifier, _subs ],
			_filters,
			_hooks,
			_subs
		)

	if _hooks.has(STR_HOOK_PRE_ADD_SUB):
		_hook(
			STR_HOOK_PRE_ADD_SUB,
			[ sub_identifier, sub_value ],
			_filters,
			_hooks,
			_subs
		)

	_subs[sub_identifier] = sub_value

	signal_sub_added(sub_identifier, sub_value)

	if _hooks.has(STR_HOOK_POST_ADD_SUB):
		_hook(
			STR_HOOK_POST_ADD_SUB,
			[ sub_identifier, sub_value ],
			_filters,
			_hooks,
			_subs
		)


func remove_sub(
		sub_identifier: String) -> bool:

	var _subs: Dictionary = _self.subs
	if _subs.has(STR_FUNC_REMOVE_SUB):
		return _self.sub(STR_FUNC_REMOVE_SUB, [ sub_identifier ])

	var _filters : Dictionary = _self.filters
	var _hooks   : Dictionary = _self.hooks

	if _filters.has(STR_FILTER_REMOVE_SUB_IDENTIFIER):
		sub_identifier = _filter(
			STR_FILTER_REMOVE_SUB_IDENTIFIER,
			sub_identifier,
			[ _subs[sub_identifier], _subs ],
			_filters,
			_hooks,
			_subs
		)

	var sub_value = _subs[sub_identifier]
	if _filters.has(STR_FILTER_REMOVE_SUB_VALUE):
		sub_value = _filter(
			STR_FILTER_REMOVE_SUB_VALUE,
			sub_value,
			[ sub_identifier, _subs ],
			_filters,
			_hooks,
			_subs
		)

	if not sub_identifier or not sub_value:
		return false

	if _hooks.has(STR_HOOK_PRE_REMOVE_SUB):
		_hook(
			STR_HOOK_PRE_REMOVE_SUB,
			[ sub_identifier, sub_value ],
			_filters,
			_hooks,
			_subs
		)

	var ret: bool = _subs.erase(sub_identifier)
	signal_sub_removed(sub_identifier, sub_value)

	if _hooks.has(STR_HOOK_POST_REMOVE_SUB):
		_hook(
			STR_HOOK_POST_REMOVE_SUB,
			[ sub_identifier, sub_value ],
			_filters,
			_hooks,
			_subs
		)

	return ret


# *********************
# | Protected Methods |
# *********************


# execute a filter, should only be called by _self
func filter(
		filter_identifier : String,
		filter_value,
		args_arr          : Array = []):

	var _subs: Dictionary = _self.subs
	if _subs.has(STR_FUNC_FILTER):
		return _self.sub(
			STR_FUNC_FILTER,
			[ filter_identifier, filter_value, args_arr ]
		)

	return _filter(
		filter_identifier,
		filter_value,
		args_arr,
		_self.filters,
		_self.hooks,
		_subs
	)


# execute a hook, should only be called by _self
func hook(
		hook_identifier : String,
		hook_args_arr   : Array = []) -> void:

	var _subs: Dictionary = _self.subs
	if _subs.has(STR_FUNC_HOOK):
		_self.sub(STR_FUNC_HOOK, [ hook_identifier, hook_args_arr ])
		return

	_hook(hook_identifier, hook_args_arr, _self.filters, _self.hooks, _subs)


# execute a sub(stitution), should only be called by _self
func sub(
		sub_identifier : String,
		args_arr       : Array = []):

	var _subs    : Dictionary = _self.subs
	if _subs.has(STR_FUNC_SUB):
		return _do_action(_subs[STR_FUNC_SUB], [ sub_identifier, args_arr ])

	var _filters : Dictionary = _self.filters
	var _hooks   : Dictionary = _self.hooks

	var action = _subs[sub_identifier] if _subs.has(sub_identifier) else null

	if _filters.has(STR_FILTER_SUB_IDENTIFIER):
		sub_identifier = _filter(
			STR_FILTER_SUB_IDENTIFIER,
			sub_identifier,
			[ args_arr, action ],
			_filters,
			_hooks,
			_subs
		)

	if _filters.has(STR_FILTER_SUB_ARGS_ARR):
		args_arr = _filter(
			STR_FILTER_SUB_ARGS_ARR,
			args_arr,
			[ sub_identifier, action ],
			_filters,
			_hooks,
			_subs
		)

	if not _subs.has(sub_identifier):
		return action
	
	if _filters.has(STR_FILTER_SUB_ACTION):
		action = _filter(
			STR_FILTER_SUB_ACTION,
			action,
			[ sub_identifier, args_arr ],
			_filters,
			_hooks,
			_subs
		)

	if _hooks.has(STR_HOOK_PRE_SUB):
		_hook(
			STR_HOOK_PRE_SUB,
			[ sub_identifier, args_arr, action ],
			_filters,
			_hooks,
			_subs
		)

	var return_value = _do_action(action, args_arr, false)

	signal_subbed(sub_identifier, args_arr, return_value)

	if _hooks.has(STR_HOOK_POST_SUB):
		_hook(
			STR_HOOK_POST_SUB,
			[ sub_identifier, args_arr, action, return_value ],
			_filters,
			_hooks,
			_subs
		)

	return return_value


# *******************
# | Private Methods |
# *******************


# add a hook or filter to underlying dictionary
func _add(
		dict            : Dictionary,
		dict_identifier : String,
		value,
		priority_int    : int = INT_DEFAULT_PRIORITY) -> void:

	if subs.has(STR_FUNC__ADD):
		sub(STR_FUNC__ADD, [ dict, dict_identifier, value, priority_int ])
		return

	if not dict.has(dict_identifier):
		dict[dict_identifier] = []

	dict[dict_identifier].push_back([ value, priority_int ])
	dict[dict_identifier].sort_custom(self, '_sort')


func _sort(
		a,
		b) -> bool:

	return a[1] < b[1]


# remove a hook or filter from the underlying dictionary
func _remove(
		dict            : Dictionary,
		dict_identifier : String,
		value,
		priority_int    : int = -1) -> bool:

	if subs.has(STR_FUNC__REMOVE):
		return sub(
			STR_FUNC__REMOVE,
			[ dict, dict_identifier, value, priority_int ]
		)

	if dict.has(dict_identifier):
		for element in dict[dict_identifier].duplicate():
			if element[0] == value \
					and (priority_int < 0 or element[1] == priority_int):
				dict[dict_identifier].erase(element)
				return true

	return false


func __hook(
		hook_identifier : String,
		hook_args_arr   : Array      = [],
		_hooks          : Dictionary = _self.hooks,
		_subs           : Dictionary = _self.subs) -> void:

	if _subs.has(STR_FUNC___HOOK):
		_do_action(
			_subs[STR_FUNC___HOOK],
			[ hook_identifier, hook_args_arr, _hooks, _subs ]
		)
		return

	if _hooks.has(STR_HOOK_PRE_HOOK):
		_act(_hooks, STR_HOOK_PRE_HOOK, [ hook_identifier, hook_args_arr ] )

		signal_hooked(STR_HOOK_PRE_HOOK, [ hook_identifier, hook_args_arr ])

	_act(_hooks, hook_identifier, hook_args_arr)

	signal_hooked(hook_identifier, hook_args_arr)

	if _hooks.has(STR_HOOK_POST_HOOK):
		_act(_hooks, STR_HOOK_POST_HOOK, [ hook_identifier, hook_args_arr ] )

		signal_hooked(STR_HOOK_POST_HOOK, [ hook_identifier, hook_args_arr ])


func __filter(
		filter_identifier : String,
		filter_value,
		filter_args_arr   : Array      = [],
		_filters          : Dictionary = _self.filters,
		_hooks            : Dictionary = _self.hooks,
		_subs             : Dictionary = _self.subs):

	if _subs.has(STR_FUNC___FILTER):
		return _do_action(
			_subs[STR_FUNC___FILTER],
			[
				filter_identifier,
				filter_value,
				filter_args_arr,
				_filters,
				_hooks,
				_subs
			]
		)

	var input = filter_value

	if _hooks.has(STR_HOOK_PRE_FILTER):
		__hook(
			STR_HOOK_PRE_FILTER,
			[ filter_identifier, input, filter_args_arr ],
			_hooks,
			_subs
		)

	var output = _act(
		_filters,
		filter_identifier,
		filter_args_arr,
		true,
		filter_value
	)

	signal_filtered(filter_identifier, input, output, filter_args_arr)

	if _hooks.has(STR_HOOK_POST_FILTER):
		__hook(
			STR_HOOK_POST_FILTER,
			[ filter_identifier, input, output, filter_args_arr ],
			_hooks,
			_subs
		)

	return output


func _filter(
		filter_identifier : String,
		filter_value,
		filter_args_arr   : Array      = [],
		_filters          : Dictionary = _self.filters,
		_hooks            : Dictionary = _self.hooks,
		_subs             : Dictionary = _self.subs):

	if _subs.has(STR_FUNC__FILTER):
		return _do_action(
			_subs[STR_FUNC__FILTER],
			[
				filter_identifier,
				filter_value,
				filter_args_arr,
				_filters,
				_hooks,
				_subs
			]
		)

	var filter = _filters[filter_identifier] \
		if _filters.has(filter_identifier) \
		else null

	if _filters.has(STR_FILTER_FILTER_IDENTIFIER):
		filter_identifier = __filter(
			STR_FILTER_FILTER_IDENTIFIER,
			filter_identifier,
			[ filter_value, filter_args_arr, filter ],
			_filters,
			_hooks,
			_subs
		)

	if _filters.has(STR_FILTER_FILTER_ARGS_ARR):
		filter_args_arr = __filter(
			STR_FILTER_FILTER_ARGS_ARR,
			filter_args_arr,
			[ filter_identifier, filter_value, filter ],
			_filters,
			_hooks,
			_subs
		)

	return __filter(
		filter_identifier,
		filter_value,
		filter_args_arr,
		_filters,
		_hooks,
		_subs
	)


func _hook(
		hook_identifier : String,
		hook_args_arr   : Array      = [],
		_filters        : Dictionary = _self.filters,
		_hooks          : Dictionary = _self.hooks,
		_subs           : Dictionary = _self.subs) -> void:

	if _subs.has(STR_FUNC__HOOK):
		_do_action(
			_subs[STR_FUNC__HOOK],
			[ hook_identifier, hook_args_arr, _filters, _hooks, _subs ]
		)
		return

	var hook = _hooks[hook_identifier] if _hooks.has(hook_identifier) else null

	if _filters.has(STR_FILTER_HOOK_IDENTIFIER):
		hook_identifier = _filter(
			STR_FILTER_HOOK_IDENTIFIER,
			hook_identifier,
			[ hook_args_arr, hook ],
			_filters,
			_hooks,
			_subs
		)

	if _filters.has(STR_FILTER_HOOK_ARGS_ARR):
		hook_args_arr = _filter(
			STR_FILTER_HOOK_ARGS_ARR,
			hook_args_arr,
			[ hook_identifier, hook ],
			_filters,
			_hooks,
			_subs
		)

	__hook(hook_identifier, hook_args_arr, _hooks, _subs)


# carry out a hook or filter (may cause multiple funcref executions)
func _act(
		dict            : Dictionary,
		dict_identifier : String,
		args_arr        : Array = [],
		filter_bool     : bool  = false,
		filter_value            = null):

	if subs.has(STR_FUNC__ACT):
		return sub(
			STR_FUNC__ACT,
			[ dict, dict_identifier, args_arr, filter_bool, filter_value ]
		)

	var ret = filter_value

	if dict.has(dict_identifier):
		for action in dict[dict_identifier]:
			ret = _do_action(
				action[0], # dict[dict_identifier],
				([ ret ] + args_arr) if filter_bool else args_arr
			)
#		else:
#			ret = _do_action(
#				dict[dict_identifier],
#				([ ret ] + args_arr) if filter_bool else args_arr
#			)

	return ret


# execute the funcref
func _do_action(
		action,
		args_arr   : Array = [],
		return_arg : bool  = true):

	if subs.has(STR_FUNC__DO_ACTION):
		var _args_arr = [ action, args_arr, return_arg ]
		action = subs[STR_FUNC__DO_ACTION]
		args_arr = _args_arr

		if typeof(action) == TYPE_ARRAY:
			if action.size() == 2:
				if typeof(action[0]) == TYPE_OBJECT \
						and typeof(action[1]) == TYPE_STRING:
					action = funcref(action[0], action[1])
		elif typeof(action) == TYPE_STRING:
			action = funcref(_self, action)

		if action is FuncRef and action.is_valid():
			return action.call_funcv(args_arr + [ _self ])

		return null

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

