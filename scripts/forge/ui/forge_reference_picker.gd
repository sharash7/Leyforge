class_name ForgeReferencePicker
extends VBoxContainer
## Searchable visual stable-ID picker. Display metadata is editor-only; callers
## continue storing the selected canonical ID in their existing source field.

signal reference_selected(stable_id: String)

var _choices: Array[Dictionary] = []
var _search: LineEdit
var _list: ItemList
var _status: Label
var _selected_id := ""


func configure(
		choices: Array[Dictionary], selected_id := "",
		empty_label := "No compatible sources found") -> void:
	_choices = choices.duplicate(true)
	_selected_id = selected_id
	_build_ui(empty_label)
	_refresh()


func _build_ui(empty_label: String) -> void:
	add_theme_constant_override("separation", 5)
	_search = LineEdit.new()
	_search.placeholder_text = "Search by name, category, state or stable ID"
	_search.clear_button_enabled = true
	_search.text_changed.connect(func(_value: String) -> void: _refresh())
	add_child(_search)
	_list = ItemList.new()
	_list.custom_minimum_size = Vector2(260, 150)
	_list.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_list.allow_reselect = true
	_list.item_selected.connect(_choose)
	add_child(_list)
	_status = Label.new()
	_status.text = empty_label
	_status.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_status.add_theme_color_override("font_color", Color("#B7C2CF"))
	add_child(_status)
	set_meta("accessible_label",
		"Searchable source reference picker. The chosen result stores its canonical stable ID.")


func _refresh() -> void:
	if not is_instance_valid(_list):
		return
	_list.clear()
	var query := _search.text.strip_edges().to_lower()
	var sorted := _choices.duplicate(true)
	sorted.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("name", a.get("id", ""))).naturalnocasecmp_to(
			str(b.get("name", b.get("id", "")))) < 0)
	for choice in sorted:
		var stable_id := str(choice.get("id", ""))
		var name := str(choice.get("name", stable_id))
		var category := str(choice.get("category", "Source"))
		var state := str(choice.get("state", "unknown"))
		var dependency := str(choice.get("dependency", "available"))
		var haystack := "%s %s %s %s %s" % [
			stable_id, name, category, state, dependency]
		if not query.is_empty() and not query in haystack.to_lower():
			continue
		var prefix := "SELECTED" if stable_id == _selected_id else category.to_upper()
		_list.add_item("%s  |  %s\n%s  |  %s  |  %s" % [
			prefix, name, stable_id, state.replace("_", " "), dependency])
		_list.set_item_metadata(_list.item_count - 1, stable_id)
		if stable_id == _selected_id:
			_list.select(_list.item_count - 1)
	_status.text = "%d compatible source(s). Stored value: %s" % [
		_list.item_count, _selected_id if not _selected_id.is_empty() else "none"]


func _choose(index: int) -> void:
	_selected_id = str(_list.get_item_metadata(index))
	_refresh()
	reference_selected.emit(_selected_id)
