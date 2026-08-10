class_name ForgeAuthoringTypeDescriptor
extends RefCounted
## Metadata that lets every Forge studio share one document lifecycle.

var type_id := ""
var domain := ""
var display_name := ""
var resource_class := ""
var schema_id := ""
var id_prefix := ""
var id_property := ""
var display_property := "display_name"
var source_root := ""
var status_property := "source_status"
var lifecycle_property := "lifecycle"
var capabilities: PackedStringArray = []


static func from_record(record: Dictionary) -> ForgeAuthoringTypeDescriptor:
	var value := ForgeAuthoringTypeDescriptor.new()
	value.type_id = str(record.get("type_id", ""))
	value.domain = str(record.get("domain", ""))
	value.display_name = str(record.get("display_name", value.type_id))
	value.resource_class = str(record.get("resource_class", "Resource"))
	value.schema_id = str(record.get("schema_id", ""))
	value.id_prefix = str(record.get("id_prefix", ""))
	value.id_property = str(record.get("id_property", ""))
	value.display_property = str(record.get("display_property", "display_name"))
	value.source_root = str(record.get("source_root", ""))
	value.status_property = str(record.get("status_property", "source_status"))
	value.lifecycle_property = str(record.get("lifecycle_property", "lifecycle"))
	value.capabilities = PackedStringArray(record.get("capabilities", []))
	return value


func identity(resource: Resource) -> String:
	if resource == null or id_property.is_empty():
		return ""
	return str(resource.get(id_property))


func title(resource: Resource) -> String:
	if resource == null or display_property.is_empty():
		return identity(resource)
	return str(resource.get(display_property))


func default_path(resource: Resource) -> String:
	var source_id := identity(resource)
	if source_root.is_empty() or source_id.is_empty():
		return ""
	return source_root.path_join("%s.tres" % ForgeId.safe_filename(source_id))


func to_record() -> Dictionary:
	return {
		"type_id": type_id,
		"domain": domain,
		"display_name": display_name,
		"resource_class": resource_class,
		"schema_id": schema_id,
		"id_prefix": id_prefix,
		"id_property": id_property,
		"display_property": display_property,
		"source_root": source_root,
		"status_property": status_property,
		"lifecycle_property": lifecycle_property,
		"capabilities": Array(capabilities),
	}
