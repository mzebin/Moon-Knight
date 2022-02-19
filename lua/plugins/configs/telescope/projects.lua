local status_ok, projects = pcall(require, "project_nvim")
if not status_ok then
	return
end

projects.setup({
	---@ Show hidden files in telescope when searching for files in a project
	show_hidden = true,
})
