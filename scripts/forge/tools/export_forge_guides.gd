@tool
extends SceneTree
## Writes the maintained external guide from the same records rendered in Forge.

const OUTPUT := "res://development/FORGE_CREATOR_GUIDES.md"

func _init() -> void:
	var content_issues := ForgeSectionGuides.content_issues()
	if not content_issues.is_empty():
		for issue in content_issues:
			printerr("FORGE_GUIDE_CONTENT_ERROR %s" % issue)
		quit(1)
		return
	var lines: Array[String] = ["# Leyforge Forge Creator Guides", "",
		"> Generated from `ForgeSectionGuides`. Edit the guide definitions, not this file.", "",
		"Each workflow has a Basic checklist and an In-depth walkthrough. In-depth steps explain the exact control, example input, reason, expected result, verification, mistakes and recovery.", ""]
	for page in ForgeSectionGuides.page_titles():
		lines.append("## %s" % page)
		lines.append("")
		for mode in [ForgeSectionGuides.BASIC, ForgeSectionGuides.IN_DEPTH]:
			lines.append("### %s" % ("Basic" if mode == ForgeSectionGuides.BASIC else "In-depth"))
			lines.append("")
			var records := ForgeSectionGuides.records_for_page(str(page), mode)
			for index in records.size():
				lines.append("#### %d. %s" % [index + 1, str(records[index].get("title", "Step"))])
				lines.append("")
				lines.append(ForgeSectionGuides.format_record(records[index]))
				lines.append("")
	lines.append("## Glossary")
	lines.append("")
	for term in ForgeSectionGuides.glossary():
		lines.append("- **%s:** %s" % [term, ForgeSectionGuides.glossary()[term]])
	var file := FileAccess.open(OUTPUT, FileAccess.WRITE)
	if file == null:
		printerr("FORGE_GUIDE_EXPORT failed to open %s" % OUTPUT)
		quit(1)
		return
	file.store_string("\n".join(lines) + "\n")
	print("FORGE_GUIDE_EXPORT ok pages=%d path=%s" % [ForgeSectionGuides.page_titles().size(), OUTPUT])
	quit(0)
