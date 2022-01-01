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
# 1.0.0    12/31/2021    First Release
#

# ***********
# | Signals |
# ***********

# fired on add_hook
signal hook_added     (hook_identifier, hook_value, emitter)

# fired on hook
signal hooked         (hook_identifier, args_arr, emitter)

# fired on remove_hook
signal hook_removed   (hook_identifier, hook_value, emitter)

# fired on hook access
signal hooks_set      (new_hooks, old_hooks, emitter)

# fired on add_filter
signal filter_added   (filter_identifier, filter_value, emitter)

# fired on filter
signal filtered       (filter_identifier, input, output, args_arr, emitter)

# fired on remove_filter
signal filter_removed (filter_identifier, filter_value, emitter)

# fired on filter access
signal filters_set    (new_filters, old_filters, emitter)

# fired on add_sub
signal sub_added      (sub_identifier, sub_value, emitter)

# fired on sub
signal subbed         (sub_identifier, args_arr, ret_value, emitter)

# fired on remove_sub
signal sub_removed    (sub_identifier, sub_value, emitter)

# fired on sub access (with a new value)
signal subs_set       (new_subs, old_subs, emitter)

# *************
# | Constants |
# *************

const STR_SIGNAL_HOOK_ADDED     : String = 'hook_added'
const STR_SIGNAL_HOOKED         : String = 'hooked'
const STR_SIGNAL_HOOK_REMOVED   : String = 'hook_removed'
const STR_SIGNAL_HOOKS_SET      : String = 'hooks_set'
const STR_SIGNAL_FILTER_ADDED   : String = 'filter_added'
const STR_SIGNAL_FILTERED       : String = 'filtered'
const STR_SIGNAL_FILTER_REMOVED : String = 'filter_removed'
const STR_SIGNAL_FILTERS_SET    : String = 'filters_set'
const STR_SIGNAL_SUB_ADDED      : String = 'sub_added'
const STR_SIGNAL_SUBBED         : String = 'subbed'
const STR_SIGNAL_SUB_REMOVED    : String = 'sub_removed'
const STR_SIGNAL_SUBS_SET       : String = 'subs_set'

const STR_IDENTIFIER_SEPARATOR : String = '/'
const STR_IDENTIFIER_BASE  : String = 'conductable' + STR_IDENTIFIER_SEPARATOR
const STR_HOOK_BASE        : String = 'STR_HOOK_'
const STR_FILTER_BASE      : String = 'STR_FILTER_'

const STR_HOOK_SET_FILTERS        : String = STR_IDENTIFIER_BASE + 'set_filters'
const STR_HOOK_GET_FILTERS        : String = STR_IDENTIFIER_BASE + 'get_filters'
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
const STR_HOOK_PRE_ADD_SUB        : String = STR_IDENTIFIER_BASE + 'pre_add_sub'
const STR_HOOK_POST_ADD_SUB       : String = \
	STR_IDENTIFIER_BASE + 'post_add_sub'
const STR_HOOK_PRE_REMOVE_SUB     : String = \
	STR_IDENTIFIER_BASE + 'pre_remove_sub'
const STR_HOOK_POST_REMOVE_SUB    : String = \
	STR_IDENTIFIER_BASE + 'post_remove_sub'
const STR_HOOK_PRE_HOOK           : String = STR_IDENTIFIER_BASE + 'pre_hook'
const STR_HOOK_POST_HOOK          : String = STR_IDENTIFIER_BASE + 'post_hook'
const STR_HOOK_PRE_FILTER         : String = STR_IDENTIFIER_BASE + 'pre_filter'
const STR_HOOK_POST_FILTER        : String = STR_IDENTIFIER_BASE + 'post_filter'
const STR_HOOK_PRE_SUB            : String = STR_IDENTIFIER_BASE + 'pre_sub'
const STR_HOOK_POST_SUB           : String = STR_IDENTIFIER_BASE + 'post_sub'

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


# *************************
# | Meta Static Functions |
# *************************


static func __mixable_info() -> PressAccept_Mixer_Mixin:

	var mixin_info: PressAccept_Mixer_Mixin = \
		PressAccept_Mixer_Mixin.new(
			'conductable',
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
			'add_filter',
			'remove_filter',
			'add_hook',
			'remove_hook',
			'add_sub',
			'remove_sub',
			'filter',
			'hook',
			'sub'
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

var filters : Dictionary setget set_filters , get_filters
var hooks   : Dictionary setget set_hooks   , get_hooks
var subs    : Dictionary setget set_subs    , get_subs

# **********************
# | Private Properties |
# **********************

var _self: Object # mixed container

# ***************
# | Constructor |
# ***************


func _init(
		init_self    : Object,
		init_filters : Dictionary = {},
		init_hooks   : Dictionary = {},
		init_subs    : Dictionary = {}) -> void:

	_self = init_self
	self.filters = init_filters
	self.hooks   = init_hooks
	self.subs    = init_subs


# ******************
# | SetGet Methods |
# ******************


func set_filters(
		new_filters: Dictionary) -> void:

	var old_filters = self.filters

	new_filters = filter(STR_FILTER_NEW_FILTERS, new_filters)

	filters = new_filters

	hook(STR_HOOK_SET_FILTERS, [ new_filters ])

	emit_signal(STR_SIGNAL_FILTERS_SET, self.filters, old_filters, _self)


func get_filters() -> Dictionary:

	hook(STR_HOOK_GET_FILTERS, [ filters ])

	return filter(STR_FILTER_FILTERS, filters)


func set_hooks(
		new_hooks: Dictionary) -> void:

	var old_hooks = self.hooks

	new_hooks = filter(STR_FILTER_NEW_HOOKS, new_hooks)

	hooks = new_hooks

	hook(STR_HOOK_SET_HOOKS, [ new_hooks ])

	emit_signal(STR_SIGNAL_HOOKS_SET, self.hooks, old_hooks, _self)


func get_hooks() -> Dictionary:

	hook(STR_HOOK_GET_HOOKS, [ hooks ])

	return filter(STR_FILTER_HOOKS, hooks)


func set_subs(
		new_subs: Dictionary) -> void:

	if subs == new_subs:
		# Godot calls this on indexed assignment, but it's already equal
		return

	var old_subs = self.subs

	new_subs = filter(STR_FILTER_NEW_SUBS, new_subs)

	subs = new_subs

	hook(STR_HOOK_SET_SUBS, [ new_subs ])

	emit_signal(STR_SIGNAL_SUBS_SET, self.subs, old_subs, _self)


func get_subs() -> Dictionary:

	hook(STR_HOOK_GET_SUBS, [ subs ] )

	return filter(STR_FILTER_SUBS, subs)


# ******************
# | Public Methods |
# ******************


func add_filter(
		filter_identifier: String,
		filter_value) -> void: # FuncRef | Array | String

	if self.subs.has('add_filter'):
		sub('add_filter', [ filter_identifier, filter_value ])
		return

	var _filters: Dictionary = self.filters

	filter_identifier = filter(
		STR_FILTER_ADD_FILTER_IDENTIFIER,
		filter_identifier,
		[ filter_value, _filters ]
	)

	filter_value = filter(
		STR_FILTER_ADD_FILTER_VALUE,
		filter_value,
		[ filter_identifier, _filters ]
	)

	if not filter_identifier or not filter_value:
		return

	hook(STR_HOOK_PRE_ADD_FILTER, [ filter_identifier, filter_value ])

	_add(self.filters, filter_identifier, filter_value)

	hook(STR_HOOK_POST_ADD_FILTER, [ filter_identifier, filter_value ])

	emit_signal(STR_SIGNAL_FILTER_ADDED, filter_identifier, filter_value, _self)


func remove_filter(
		filter_identifier: String,
		filter_value) -> bool: # FuncRef | Array | String

	if self.subs.has('remove_filter'):
		return sub('remove_filter', [ filter_identifier, filter_value ])

	var _filters: Dictionary = self.filters

	filter_identifier = filter(
		STR_FILTER_REMOVE_FILTER_IDENTIFIER,
		filter_identifier,
		[ filter_value, _filters ]
	)

	filter_value = filter(
		STR_FILTER_REMOVE_FILTER_VALUE,
		filter_value,
		[ filter_identifier, _filters ]
	)

	if not filter_identifier or not filter_value:
		return false

	hook(STR_HOOK_PRE_REMOVE_FILTER, [ filter_identifier, filter_value ])

	var ret: bool = _remove(self.filters, filter_identifier, filter_value)

	hook(STR_HOOK_POST_REMOVE_FILTER, [ filter_identifier, filter_value ])

	emit_signal(
		STR_SIGNAL_FILTER_REMOVED,
		filter_identifier,
		filter_value,
		_self
	)

	return ret


func add_hook(
		hook_identifier: String,
		hook_value) -> void: # FuncRef | Array | String

	if self.subs.has('add_hook'):
		sub('add_hook', [ hook_identifier, hook_value ])
		return

	var _hooks: Dictionary = self.hooks

	hook_identifier = filter(
			STR_FILTER_ADD_HOOK_IDENTIFIER,
			hook_identifier,
			[ hook_value, _hooks ]
		)

	hook_value = filter(
			STR_FILTER_ADD_HOOK_VALUE,
			hook_value,
			[ hook_identifier, _hooks ]
		)

	if not hook_identifier or not hook_value:
		return

	hook(STR_HOOK_PRE_ADD_HOOK, [ hook_identifier, hook_value ])

	_add(self.hooks, hook_identifier, hook_value)

	hook(STR_HOOK_POST_ADD_HOOK, [ hook_identifier, hook_value ])

	emit_signal(STR_SIGNAL_HOOK_ADDED, hook_identifier, hook_value, _self)


func remove_hook(
		hook_identifier: String,
		hook_value) -> bool: # FuncRef | Array | String

	if self.subs.has('remove_hook'):
		return sub('remove_hook', [ hook_identifier, hook_value ])

	var _hooks: Dictionary = self.hooks

	hook_identifier = filter(
			STR_FILTER_REMOVE_HOOK_IDENTIFIER,
			hook_identifier,
			[ hook_value, _hooks ]
		)

	hook_value = filter(
			STR_FILTER_REMOVE_HOOK_VALUE,
			hook_value,
			[ hook_identifier, _hooks ]
		)

	if not hook_identifier or not hook_value:
		return false

	hook(STR_HOOK_PRE_REMOVE_HOOK, [ hook_identifier, hook_value ])

	var ret: bool = _remove(self.hooks, hook_identifier, hook_value)

	hook(STR_HOOK_POST_REMOVE_HOOK, [ hook_identifier, hook_value ])

	emit_signal(STR_SIGNAL_HOOK_REMOVED, hook_identifier, hook_value, _self)

	return ret


func add_sub(
		sub_identifier: String,
		sub_value) -> void: # FuncRef | Array | String

	var _subs: Dictionary = self.subs

	if _subs.has('add_sub'):
		sub('add_sub', [ sub_identifier, sub_value ])
		return

	sub_identifier = filter(
		STR_FILTER_ADD_SUB_IDENTIFIER,
		sub_identifier,
		[ sub_value, _subs ]
	)

	sub_value = filter(
		STR_FILTER_ADD_SUB_VALUE,
		sub_value,
		[ sub_identifier, _subs ]
	)

	hook(STR_HOOK_PRE_ADD_SUB, [ sub_identifier, sub_value ])

	self.subs[sub_identifier] = sub_value

	hook(STR_HOOK_POST_ADD_SUB, [ sub_identifier, sub_value ])

	emit_signal(STR_SIGNAL_SUB_ADDED, sub_identifier, sub_value, _self)


func remove_sub(
		sub_identifier: String) -> bool:

	var _subs: Dictionary = self.subs

	if _subs.has('remove_sub'):
		return sub('remove_sub', [ sub_identifier ])

	sub_identifier = filter(
		STR_FILTER_REMOVE_SUB_IDENTIFIER,
		sub_identifier,
		[ _subs[sub_identifier], _subs ]
	)

	var sub_value = filter(
		STR_FILTER_REMOVE_SUB_VALUE,
		_subs[sub_identifier],
		[ sub_identifier, _subs ]
	)

	if not sub_identifier or not sub_value:
		return false

	hook(STR_HOOK_PRE_REMOVE_SUB, [ sub_identifier, sub_value ])

	var ret: bool = self.subs.erase(sub_identifier)

	hook(STR_HOOK_POST_REMOVE_SUB, [ sub_identifier, sub_value ])

	emit_signal(STR_SIGNAL_SUB_REMOVED, sub_identifier, sub_value, _self)

	return ret


# *********************
# | Protected Methods |
# *********************


# execute a filter, should only be called by _self
func filter(
		filter_identifier: String,
		filter_value,
		args_arr: Array = []):

	if subs.has('filter'):
		return sub('filter', [ filter_identifier, filter_value, args_arr ])

	filter_identifier = _act(
		filters,
		STR_FILTER_FILTER_IDENTIFIER,
		[ filter_value, args_arr ],
		true,
		filter_identifier
	)

	args_arr = _act(
		filters,
		STR_FILTER_FILTER_ARGS_ARR,
		[ filter_identifier, filter_value ],
		true,
		args_arr
	)

	var input = filter_value

	_act(hooks, STR_HOOK_PRE_FILTER, [ filter_identifier, input, args_arr ])

	var output = \
		_act(filters, filter_identifier, args_arr, true, filter_value)

	_act(hooks, STR_HOOK_POST_FILTER, [ filter_identifier, output, args_arr ])

	emit_signal(
		STR_SIGNAL_FILTERED,
		filter_identifier,
		input,
		output,
		args_arr,
		_self
	)

	return output


# execute a hook, should only be called by _self
func hook(
		hook_identifier: String,
		args_arr: Array = []) -> void:

	if subs.has('hook'):
		sub('hook', [ hook_identifier, args_arr ])
		return

	hook_identifier = filter(
		STR_FILTER_HOOK_IDENTIFIER,
		hook_identifier,
		[ args_arr ]
	)

	args_arr = filter(
		STR_FILTER_HOOK_ARGS_ARR,
		args_arr,
		[ hook_identifier ]
	)

	_act(hooks, STR_HOOK_PRE_HOOK, [ hook_identifier, args_arr ])

	_act(hooks, hook_identifier, args_arr)

	_act(hooks, STR_HOOK_POST_HOOK, [ hook_identifier, args_arr ])

	emit_signal(STR_SIGNAL_HOOKED, hook_identifier, args_arr, _self)


# execute a sub(stitution), should only be called by _self
func sub(
		sub_identifier: String,
		args_arr: Array = []):

	sub_identifier = filter(
		STR_FILTER_SUB_IDENTIFIER,
		sub_identifier,
		[ args_arr ]
	)

	args_arr = filter(
		STR_FILTER_SUB_ARGS_ARR,
		args_arr,
		[ sub_identifier ]
	)

	if subs.has(sub_identifier):
		hook(STR_HOOK_PRE_SUB, [ sub_identifier, args_arr ])

		var action = filter(
			STR_FILTER_SUB_ACTION,
			self.subs[sub_identifier],
			[ sub_identifier, args_arr ]
		)

		if typeof(action) == TYPE_ARRAY:
			if action.size() == 2:
				if typeof(action[0]) == TYPE_OBJECT \
						and typeof(action[1]) == TYPE_STRING:
					action = funcref(action[0], action[1])

		var ret

		if action is FuncRef and action.is_valid():
			ret = action.call_funcv(args_arr + [ _self ])

		hook(STR_HOOK_POST_SUB, [ sub_identifier, args_arr, ret ])

		emit_signal(STR_SIGNAL_SUBBED, sub_identifier, args_arr, ret, _self)

		return ret

	return null


# *******************
# | Private Methods |
# *******************


# add a hook or filter to underlying dictionary
func _add(
		dict: Dictionary,
		dict_identifier,
		value) -> void:

	if subs.has('_add'):
		sub('_add', [ dict, dict_identifier, value ])
		return

	if dict.has(dict_identifier):
		if typeof(dict[dict_identifier]) == TYPE_ARRAY:
			dict[dict_identifier].push_back(value)
		else:
			dict[dict_identifier] = \
				[dict[dict_identifier], value]
	else:
		dict[dict_identifier] = value


# carry out a hook or filter (may cause multiple funcref executions)
func _act(
		dict        : Dictionary,
		dict_identifier,
		args_arr    : Array = [],
		filter_bool : bool  = false,
		filter_value        = null):

	if subs.has('_act'):
		return sub(
			'_act',
			[ dict, dict_identifier, args_arr, filter_bool, filter_value ]
		)

	var ret = filter_value

	if dict.has(dict_identifier):
		if typeof(dict[dict_identifier]) == TYPE_ARRAY:
			for action in dict[dict_identifier]:
				ret = _do_action(
					dict[dict_identifier],
					([ ret ] + args_arr) if filter_bool else args_arr
				)
		else:
			ret = _do_action(
				dict[dict_identifier],
				([ ret ] + args_arr) if filter_bool else args_arr
			)

	return ret


# remove a hook or filter from the underlying dictionary
func _remove(
		dict: Dictionary,
		dict_identifier,
		value) -> bool:

	if subs.has('_remove'):
		return sub('_remove', [ dict, dict_identifier, value ])

	if dict.has(dict_identifier):
		if typeof(dict[dict_identifier]) == TYPE_ARRAY:
			if dict[dict_identifier].has(value):
				dict[dict_identifier].erase(value)
				return true
		else:
			return dict.erase(dict_identifier)

	return false


# execute the funcref
func _do_action(
		action,
		args_arr: Array):

	if subs.has('_do_action'):
		return sub('_do_action', [ action, args_arr ])

	if typeof(action) == TYPE_ARRAY:
		if action.size() == 2:
			if typeof(action[0]) == TYPE_OBJECT \
					and typeof(action[1]) == TYPE_STRING:
				action = funcref(action[0], action[1])
	elif typeof(action) == TYPE_STRING:
		action = funcref(_self, action)

	if action is FuncRef and action.is_valid():
		return action.call_funcv(args_arr + [ _self ])

	if args_arr:
		return args_arr[0]

	return null

