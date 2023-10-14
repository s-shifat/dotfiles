-- If you want the :Gitignore command to overwrite your 
-- current .gitignore
-- instead of appending to it, you can set
--
-- vim.g.gitignore_nvim_overwrite = true

-- Keymaps
lvim.builtin.which_key.mappings["gi"] = {
"<cmd>Gitignore<CR>", "Generate Gitigonre"
}
