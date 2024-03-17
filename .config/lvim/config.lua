--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
vim.opt.list = true
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyobones"
-- vim.o.background = "light"
lvim.builtin.lualine.style = "default"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
vim.keymap.set("n", "<Leader>rc", ":lua require('ror.commands').list_commands()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>d', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
lvim.builtin.which_key.mappings["f"] = { "<cmd>lua require('fzf-lua').files()<CR>", 'Git files' }
lvim.builtin.which_key.mappings["st"] = { "<cmd>lua require('fzf-lua').grep()<CR>", "Text" }
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Set header
local cute_dark = {
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢫⣴⣿⣿⣿⣿⣿⣿⣶⣶⣌⡉⠍⣛⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣴⣿⣿⣿⣿⣿⣷⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢋⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡌⢻⣶⣬⣍⡛⠻⣿⣿⣿⠿⠛⠛⠿⣿⡿⠟⣋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⢻⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⢛⣁⢼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠘⠂⠹⣿⣿⣿⣷⣦⣍⡁⢰⣿⣿⣶⣦⣀⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⡿⠟⣋⣥⣶⣾⣿⣿⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢁⡠⠀⢰⡆⠀⠹⣿⣿⣿⣿⣿⢃⡆⢻⣿⣿⣿⣿⣿⣦⡈⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣧⠹⣿⣿⣿⣿⣿⣿⣿",
  "⣿⠟⢋⣥⣶⣶⣶⣌⠙⢿⣿⣿⣧⠹⣿⣿⣿⣿⣿⣿⣿⠟⢁⣴⠏⣠⡄⢸⡇⢸⣀⠹⣿⣿⣿⣯⣼⣿⡘⣿⣿⣿⣿⠿⠿⢛⠈⣿⣿⣿⣿⣿⣿⣧⠸⣿⣿⢰⡜⣿⣿⣿⣿⣿⣿",
  "⣡⣾⣿⣿⣿⣿⣿⣿⣷⣄⠹⣿⣿⣇⠙⣿⣿⣿⣿⡟⢁⣤⣿⠃⣰⣿⡇⢸⡇⢸⣿⣆⠙⣿⣿⡿⣿⣿⣇⠛⣉⣤⣴⣦⠀⢹⡄⠘⢿⣿⣿⣿⣿⣿⣇⢹⣿⣸⣿⣼⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡷⠌⢿⣿⣷⡌⢻⠟⢁⣴⣿⣿⠃⢠⣿⣿⡇⠸⣇⠘⣿⣿⣆⠘⢯⣴⣿⣿⡿⢀⣿⣿⣿⣿⣿⡄⠃⣿⣦⡙⠻⣿⣿⣿⣿⣼⡏⣉⡛⠿⣿⣿⣿⣯⣿",
  "⡘⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⣠⣤⣉⡛⠛⢊⣴⣿⣿⡿⠁⠀⣿⣿⢿⣿⡀⢿⡆⢻⣿⣿⣔⣀⡉⠤⢤⣴⣾⣿⠀⢸⣿⣿⣿⡀⢹⣿⣿⣷⣄⠙⢶⣾⡿⢃⣿⣿⣶⢹⣿⢿⣟⣻",
  "⣷⡘⣿⣿⣿⣿⣿⠏⠄⢀⣾⣿⣿⣿⡿⠁⢼⣿⡿⠋⣠⡆⢰⣿⠇⣸⣿⣇⠸⣧⠈⣿⣿⣿⣿⡑⠀⢸⣿⣿⣿⡇⢸⣿⣿⣿⣧⠸⣯⠻⢿⣿⣷⣄⠡⠴⠿⠿⠿⠿⢸⣿⣿⣿⣿",
  "⣿⣿⣎⢻⣿⣿⠇⣴⣶⣿⣿⣿⣿⡿⠁⣴⣾⠟⣡⣾⣿⠀⣾⡿⠀⣿⣿⣿⡀⢹⡄⢸⣿⣿⣿⠁⠀⢀⣿⣿⣿⣷⠘⣿⣿⣿⣏⠀⢿⣷⣤⣭⣴⣶⣶⣶⣶⣶⠶⠒⢠⣭⣿⣿⣿",
  "⣿⣿⣿⣦⡙⠿⠀⡟⠿⢿⣿⣿⠿⠁⣴⡿⢉⣾⣿⣿⣿⢀⣿⠃⢸⣿⣿⣿⣇⠀⢻⡀⢻⣿⡟⠀⢠⡌⣿⣿⣿⣿⡆⢻⣿⣿⡇⠀⠈⠿⠿⠿⠿⠿⠿⠛⢋⣡⣶⣿⣦⠈⢿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⡀⠁⣸⣿⣿⣿⡆⢠⠟⢡⣮⣭⣍⣙⡋⠘⣿⠀⣾⣿⣿⣿⡟⢰⡀⠳⡀⢻⠃⢠⣿⡇⢸⡿⣶⣾⣷⠈⣿⣿⣿⡄⣿⣭⡙⣿⡍⣿⣿⣦⣈⠘⠿⢿⠿⠗⠘⠛⣉",
  "⣌⡙⠿⣿⣿⣿⡇⠀⢿⣿⣿⣿⠀⡎⣠⣿⣿⣿⣿⣿⣿⠀⣿⠀⣿⣿⣿⣿⡇⢸⡿⣆⠈⠀⢀⣾⣿⠿⠀⢿⣷⣶⣿⡧⠘⣿⣿⡧⠹⣿⡇⠿⣧⢸⡿⠿⠿⠃⣈⣤⣤⣤⣄⣀⠙",
  "⣿⣿⣷⣌⠻⣿⡿⠀⢸⣿⣿⡇⠠⢠⣿⣿⣿⣿⣿⣿⣿⡀⣿⠀⣿⣿⣿⣿⠁⢸⠀⣿⣷⠄⠀⠹⣿⣿⣧⠀⣿⣿⣿⣧⠀⠘⣿⣿⡀⢻⠁⣿⣿⠈⢖⡒⠺⡿⣿⣿⣿⣿⣿⣿⣶",
  "⠹⣿⣿⣿⣷⣶⣿⡆⠀⢻⣿⠁⠀⣾⣿⡛⠛⠛⠒⠉⢛⠇⢘⠀⢿⣿⣿⣿⠇⠘⠀⣿⣿⠀⣿⣦⣘⢿⣿⣦⠙⣿⣿⣿⠀⣦⠈⢻⣧⠘⣠⣿⣿⠄⢻⣿⠀⡇⢡⠈⠻⣿⣿⣿⣿",
  "⣷⣌⣿⣿⣿⣿⣿⠃⠀⠈⣿⠀⠀⠻⠟⠁⣠⣶⠖⠀⠈⠳⡀⠀⢸⣿⣿⣿⠀⢠⠀⣿⣿⠀⣿⣿⠿⢿⣿⣿⣆⠙⣿⣿⡆⢹⡇⣈⠻⣦⠘⣿⣿⡇⢸⣿⡀⢳⡈⠄⢲⣤⡙⢿⣿",
  "⣿⣿⡿⣾⣿⡿⠃⠔⠀⠠⠸⡀⠀⢰⠀⢰⣿⠃⠾⡇⠀⠀⢱⡀⠀⢿⣿⣿⡇⠀⠀⢻⣿⠀⠿⠒⠂⠉⠙⠛⠻⣦⠙⣿⡇⠸⡇⢸⣷⠈⠀⠹⣿⣧⢸⣿⡇⠸⣇⠐⠈⣿⣷⣄⠙",
  "⣿⣷⣿⣿⠟⠁⠀⣰⠁⠀⠢⣄⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⢸⣷⣄⡀⠻⣿⠷⠀⠀⡄⠉⣠⡰⠸⣷⡄⠀⠀⠀⠀⠀⠈⢳⠀⡇⠘⣿⡆⣦⠀⣻⡿⢸⣿⡇⠀⢿⡄⠀⠹⣿⣿⣷",
  "⣿⣿⠟⢁⣠⣾⠀⣿⠀⠀⣀⠘⡄⠁⠑⢸⣿⡄⠀⢀⡀⠀⢸⣿⣿⣿⣷⣤⣤⣤⣦⣼⣿⡟⠀⠀⠈⠀⠀⠀⠀⡄⠀⠳⣄⡀⠀⠀⠹⡇⢻⣿⣿⡇⢸⣿⡇⠁⠘⣿⡀⢦⡌⠻⣿",
  "⣿⣶⣾⣿⣿⣿⢸⣿⠀⣰⠟⢁⣄⠀⢀⣥⣉⣁⣀⣀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢀⠀⢀⠀⠀⠀⣿⠀⠀⣠⡤⢀⣈⣦⡀⣾⣿⠟⠀⢸⣿⣧⢀⡆⠹⣧⠈⢿⣦⣘",
  "⣿⣿⣿⣿⣿⣿⠘⠃⡰⠋⢠⣿⡄⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣀⠘⠻⠀⠀⠀⣸⣿⠀⠀⣿⡇⢸⣿⣿⣿⠟⠁⡦⠀⣾⣿⡏⢸⣿⡀⠹⣧⠈⢿⣿",
  "⣿⣿⣿⣿⣿⠟⠀⠀⠁⠀⣾⣯⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣉⣛⡛⣛⣥⠄⠄⢹⠃⣼⣿⣿⠁⣰⡿⢁⣄⠙⢿⣧⢸⣿⣷⡄⠻⣧⠘⣿",
  "⣿⣿⠟⠉⣀⣀⣤⠀⢠⠀⣿⡇⠀⣠⣙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢀⣀⠸⢀⣿⣿⣿⣿⠏⣀⣂⣉⡛⠄⡙⢸⣿⣿⣿⣦⠘⢧⠈",
  "⣿⣿⣿⣿⣿⣿⣿⣇⢻⡄⢿⣿⠀⠹⣿⣷⡈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠡⠄⠛⣋⣠⣾⣿⣿⡟⢃⣴⣿⣿⣿⡿⠷⢄⣢⡍⠻⡿⠿⣷⣄⡳",
  "⣿⣿⣿⣿⣿⣿⣿⠟⠀⢳⡈⢿⣆⡀⠈⠻⣿⣦⡙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⡶⠁⣼⣿⣿⣿⣿⠟⠀⠾⠭⠭⠍⠀⠒⠚⢋⣩⣥⣴⣶⣶⣤⠙⡟",
  "⣿⣿⣿⣿⣿⣿⠏⠀⣴⣆⠁⠈⠻⣀⠀⣄⠙⣿⣷⡄⢈⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢋⠁⣸⣿⣿⣿⣻⠟⠀⢀⡀⢀⣴⡤⠌⣠⣾⣿⣿⣿⣿⣿⣿⣿⣇⣿",
  "⣿⣿⣿⣿⣿⠃⢀⠀⣿⣿⣿⡄⠀⡙⠀⣿⣴⠘⣿⣿⡄⢻⣶⣤⠉⢛⠛⠻⠿⠿⣿⣿⣿⣿⣿⣫⣥⣶⣾⠏⣰⣿⡿⠛⣉⠀⣰⣾⣿⠇⡟⣠⠂⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣌",
  "⣿⣿⣿⣿⣷⣿⣿⠀⠛⢿⣿⠇⠀⣿⣆⠰⠇⢀⡽⠿⠷⠀⠉⠁⠾⣿⡿⠋⣠⣤⡀⢻⣿⣿⣿⣿⣿⡿⠋⣴⠿⢋⣰⡾⢃⣼⣿⣿⡟⢸⠁⡟⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⡀⢸⠸⣿⢀⠀⣿⣿⠆⣰⣿⣿⣿⣿⣿⣿⣿⣦⠈⢠⣾⣾⡟⡇⠀⣿⣿⣿⣿⠟⠁⠔⢁⣶⣿⠟⣠⣾⡿⠿⢛⠁⢋⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣛⣹",
  "⣿⣿⣿⣿⣿⣿⣿⣇⠈⡆⠏⢸⣄⡿⢋⣴⣿⣿⣟⣛⣛⠛⠛⠻⣿⣷⣌⠛⢿⡇⠀⠀⣿⣿⠛⡁⠀⡤⢠⣿⡿⢃⡔⡆⠏⣰⣿⠏⣴⣿⣿⣿⣿⣿⣯⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣤⣘⣄⠈⠟⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣝⡛⠷⢄⠁⠘⠀⣿⠟⢋⣴⣿⠃⣼⠏⣠⣾⡇⣷⢸⣿⠇⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠛⠃⣼⣿⣿⣿⣿⣿⣿⠯⣭⡭⡍⠙⠻⢿⣿⣷⣦⡄⠀⠀⣣⣾⣿⡟⣫⠀⠀⣴⣿⣿⡿⠀⢸⡿⠠⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⢿"
}
local cute_light = {
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡔⠋⠀⠀⠀⠀⠀⠀⠉⠉⠳⢶⣲⠤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀⠀⠀⠈⢳⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⡄⠉⠓⠲⢤⣄⠀⠀⠀⣀⣤⣤⣀⠀⢀⣠⠴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡄⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡤⠾⡃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣧⣽⣆⠀⠀⠀⠈⠙⠲⢾⡏⠀⠀⠉⠙⠿⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⢀⣠⠴⠚⠉⠁⠀⠀⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⢟⣿⡏⢹⣿⣆⠀⠀⠀⠀⠀⡼⢹⡄⠀⠀⠀⠀⠀⠙⢷⡀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠘⣆⠀⠀⠀⠀⠀⠀⠀",
  "⠀⣠⡴⠚⠉⠉⠉⠳⣦⡀⠀⠀⠘⣆⠀⠀⠀⠀⠀⠀⠀⣠⡾⠋⣰⠟⢻⡇⢸⡇⠿⣆⠀⠀⠀⠐⠃⠀⢧⠀⠀⠀⠀⣀⣀⡤⣷⠀⠀⠀⠀⠀⠀⠘⣇⠀⠀⡏⢣⠀⠀⠀⠀⠀⠀",
  "⠞⠁⠀⠀⠀⠀⠀⠀⠈⠻⣆⠀⠀⠸⣦⠀⠀⠀⠀⢠⡾⠛⠀⣼⠏⠀⢸⡇⢸⡇⠀⠹⣦⠀⠀⢀⠀⠀⠸⣤⠶⠛⠋⠙⣿⡆⢻⣧⡀⠀⠀⠀⠀⠀⠸⡆⠀⠇⠀⠃⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⣳⡀⠀⠈⢳⡄⣠⡾⠋⠀⠀⣼⡟⠀⠀⢸⣇⠸⣧⠀⠀⠹⣧⡐⠋⠀⠀⢀⡿⠀⠀⠀⠀⠀⢻⣼⠀⠙⢦⣄⠀⠀⠀⠀⠃⢰⠶⢤⣀⠀⠀⠀⠐⠀",
  "⢧⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⠟⠛⠶⢤⣤⡵⠋⠀⠀⢀⣾⣿⠀⠀⡀⠀⢿⡀⢹⡄⠀⠀⠫⠿⢶⣛⡛⠋⠁⠀⣿⡇⠀⠀⠀⢿⡆⠀⠀⠈⠻⣦⡉⠁⢀⡼⠀⠀⠉⡆⠀⡀⠠⠄",
  "⠈⢧⠀⠀⠀⠀⠀⣰⣻⡿⠁⠀⠀⠀⢀⣾⡃⠀⢀⣴⠟⢹⡏⠀⣸⠇⠀⠸⣇⠘⣷⠀⠀⠀⠀⢮⣿⡇⠀⠀⠀⢸⡇⠀⠀⠀⠘⣇⠐⣄⡀⠀⠈⠻⣞⣋⣀⣀⣀⣀⡇⠀⠀⠀⠀",
  "⠀⠀⠱⡄⠀⠀⣸⠋⠉⠀⠀⠀⠀⢀⣾⠋⠁⣠⠞⠁⠀⣿⠁⢀⣿⠀⠀⠀⢿⡆⢻⡇⠀⠀⠀⣾⣿⡿⠀⠀⠀⠈⣧⠀⠀⠀⠰⣿⡀⠈⠛⠒⠋⠉⠉⠉⠉⠉⣉⣭⡟⠒⠀⠀⠀",
  "⠀⠀⠀⠙⢦⣀⣿⢠⣀⡀⠀⠀⣀⣾⠋⢀⡶⠁⠀⠀⠀⡿⠀⣼⡇⠀⠀⠀⠸⣿⡄⢿⡄⠀⢠⣿⡟⢳⠀⠀⠀⠀⢹⡄⠀⠀⢸⣿⣷⣀⣀⣀⣀⣀⣀⣤⡴⠞⠉⠀⠙⣷⡀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⢿⣾⠇⠀⠀⠀⢹⡟⣠⡞⠑⠒⠲⠦⢴⣧⠀⣿⠁⠀⠀⠀⢠⡏⢿⣌⢿⡄⣼⡟⠀⢸⡇⢀⠉⠁⠈⣷⠀⠀⠀⢻⠀⠒⢦⠀⢲⠀⠀⠙⠷⣧⣀⡀⣀⣨⣧⣤⠶",
  "⠳⢦⣀⠀⠀⠀⢸⣿⡀⠀⠀⠀⣿⢱⠟⠀⠀⠀⠀⠀⠀⣿⠀⣿⠀⠀⠀⠀⢸⡇⢀⠹⣷⣿⡿⠁⠀⣀⣿⡀⠈⠉⠀⢘⣧⠀⠀⢘⣆⠀⢸⣀⠘⡇⢀⣀⣀⣼⠷⠛⠛⠛⠻⠿⣦",
  "⠀⠀⠈⠳⣄⠀⢀⣿⡇⠀⠀⢸⣟⡟⠀⠀⠀⠀⠀⠀⠀⢿⠀⣿⠀⠀⠀⠀⣾⡇⣿⠀⠈⣻⣿⣆⠀⠀⠘⣿⠀⠀⠀⠘⣿⣧⠀⠀⢿⡄⣾⠀⠀⣷⡩⢭⣅⢀⠀⠀⠀⠀⠀⠀⠉",
  "⣆⠀⠀⠀⠈⠉⠀⢹⣿⡄⠀⣾⣿⠁⠀⢤⣤⣤⣭⣶⡤⣸⡧⣿⡀⠀⠀⠀⣸⣧⣿⠀⠀⣿⠀⠙⠧⡀⠀⠙⣦⠀⠀⠀⣿⠙⣷⡄⠘⣧⠟⠀⠀⣻⡄⠀⣿⢸⡞⣷⣄⠀⠀⠀⠀",
  "⠈⠳⠀⠀⠀⠀⠀⣼⣿⣷⠀⣿⣿⣄⣠⣾⠟⠉⣩⣿⣷⣌⢿⣿⡇⠀⠀⠀⣿⡟⣿⠀⠀⣿⠀⠀⣀⡀⠀⠀⠹⣦⠀⠀⢹⡆⢸⠷⣄⠙⣧⠀⠀⢸⡇⠀⢿⡌⢷⣻⡍⠛⢦⡀⠀",
  "⠀⠀⢀⠁⠀⢀⣼⣫⣿⣟⣇⢿⣿⡏⣿⡏⠀⣼⣁⢸⣿⣿⡎⢿⣿⡀⠀⠀⢸⣿⣿⡄⠀⣿⣀⣭⣽⣶⣦⣤⣄⠙⣦⠀⢸⣇⢸⡇⠈⣷⣿⣆⠀⠘⡇⠀⢸⣇⠸⣯⣷⠀⠈⠻⣦",
  "⠀⠈⠀⠀⣠⣾⣿⠏⣾⣿⣝⠻⣿⣿⣿⠀⠀⣿⣿⣿⣿⣿⡇⠈⠻⢿⣄⠀⣈⣿⣿⢻⣶⠟⢏⣇⠈⢻⣿⣿⣿⣿⣿⣷⡌⣿⢸⣧⠀⢹⠙⣿⠄⢀⡇⠀⢸⣿⡀⢻⣿⣆⠀⠀⠈",
  "⠀⠀⣠⡾⠟⠁⣿⠀⣿⣿⠿⣧⢻⣾⣮⡇⠀⢻⣿⡿⢿⣿⡇⠀⠀⠀⠈⠛⠛⠛⠙⠃⠀⢠⣿⣿⣷⣿⣿⣿⣿⢻⣿⣌⠻⢿⣿⣿⣆⢸⡄⠀⠀⢸⡇⠀⢸⣾⣧⠀⢿⡙⢳⣄⠀",
  "⠀⠉⠁⠀⠀⠀⡇⠀⣿⠏⣠⡾⠻⣿⡿⠚⠶⠾⠿⠿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡿⣿⡿⣿⣿⣿⠀⣿⣿⠟⢛⡿⠷⠙⢿⠁⠀⣠⣿⡇⠀⠘⡿⢹⣆⠘⣷⡀⠙⠧",
  "⠀⠀⠀⠀⠀⠀⣧⣼⢏⣴⡟⠀⢻⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠿⣧⣄⣿⣿⣿⠇⠀⣿⣿⠀⢸⡇⠀⠀⠀⣠⣾⢙⣿⠁⠀⢰⡇⠀⢿⣆⠘⣷⡀⠀",
  "⠀⠀⠀⠀⠀⣠⣿⣿⣾⣿⠁⠐⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠶⠤⢤⠤⠚⣻⣻⡆⣼⠃⠀⠀⣾⠏⢀⡾⠻⣦⡀⠘⡇⠀⠈⢻⣄⠘⣧⠀",
  "⠀⠀⣠⣶⠿⠿⠛⣿⡟⣿⠀⢸⣿⠟⠦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡿⠿⣇⡿⠀⠀⠀⠀⣰⠿⠽⠶⢤⣻⢦⡇⠀⠀⠀⠙⣧⡘⣷",
  "⠀⠀⠀⠀⠀⠀⠀⠸⡄⢻⡀⠀⣿⣆⠀⠈⢷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣞⣻⣤⠴⠟⠁⠀⠀⢠⡼⠋⠀⠀⠀⢀⣈⡻⠝⢲⣄⢀⣀⠈⠻⢌",
  "⠀⠀⠀⠀⠀⠀⠀⣠⣿⡌⢷⡀⠹⢿⣷⣄⠀⠙⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⢉⣾⠃⠀⠀⠀⠀⣠⣿⣁⣒⣒⣲⣿⣭⣥⡴⠖⠚⠋⠉⠉⠛⣦⢠",
  "⠀⠀⠀⠀⠀⠀⣰⣿⠋⠹⣾⣷⣄⠿⣿⠻⣦⠀⠈⢻⡷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⣾⠇⠀⠀⠀⠄⣠⣿⡿⢿⡿⠋⢛⣳⠟⠁⠀⠀⠀⠀⠀⠀⠀⠸⠀",
  "⠀⠀⠀⠀⠀⣼⡿⣿⠀⠀⠀⢻⣿⢦⣿⠀⠋⣧⠀⠀⢻⡄⠉⠛⣶⡤⣤⣄⣀⣀⠀⠀⠀⠀⠀⠔⠚⠉⠁⣰⠏⠀⢀⣤⠶⣿⠏⠁⠀⣸⢠⠟⣽⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠳",
  "⠀⠀⠀⠀⠈⠀⠀⣿⣤⡀⠀⣸⣿⠀⠹⣏⣸⡿⢂⣀⣈⣿⣶⣾⣁⠀⢀⣴⠟⠛⢿⡄⠀⠀⠀⠀⠀⢀⣴⠋⣀⡴⠏⢁⡼⠃⠀⠀⢠⡇⣾⢠⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⢿⡇⣇⠀⡿⣿⠀⠀⣹⠏⠀⠀⠀⠀⠀⠀⠀⠙⣷⡟⠁⠁⢠⢸⣿⠀⠀⠀⠀⣠⣾⣫⡾⠉⠀⣠⠟⠁⢀⣀⡤⣾⡴⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠤⠆",
  "⠀⠀⠀⠀⠀⠀⠀⠸⣷⢹⣰⡇⠻⢀⡴⠋⠀⠀⠠⠤⠤⣤⣤⣄⠀⠈⠳⣤⡀⢸⣿⣿⠀⠀⣤⢾⣿⢛⡟⠀⢀⡼⢫⢹⣰⠏⠀⣰⠋⠀⠀⠀⠀⠀⠐⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠛⠧⠻⣷⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠢⢤⣈⡻⣾⣧⣿⠀⣠⡴⠋⠀⣼⠃⣰⠟⠁⢸⠈⡇⠀⣸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⣼⠃⠀⠀⠀⠀⠀⠀⣐⠒⢒⢲⣦⣄⡀⠀⠈⠙⢻⣿⣿⠜⠁⠀⢠⠔⣿⣿⠋⠀⠀⢀⣿⡇⢀⣟⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡀",
}

lvim.builtin.alpha.dashboard.section.header.val = cute_dark
lvim.builtin.alpha.dashboard.section.header.opts.hl = "function"
lvim.builtin.alpha.dashboard.section.footer.val = ""

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Test",
  f = { "<cmd>w<cr><cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "File" },
  t = { "<cmd>w<cr><cmd>lua require('neotest').run.run()<cr>", "Line" },
  l = { "<cmd>w<cr><cmd>lua require('neotest').run.run_last()<cr>", "Last" },
  x = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
  i = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Info" },
  s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
  n = { '<cmd>lua require("neotest").jump.next({ status = "failed" })<cr>', "Next failed" },
  j = { '<cmd>:A<cr>', "Jump" }
}
lvim.builtin.which_key.mappings["m"] = {
  name = "+Window",
  m = { "<C-w>|", "Maximize" },
  q = { "<C-w>=", "Minimize" }
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "solargraph" })
require("lspconfig").solargraph.setup({})

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  { "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })
    end, },
  { 'nvim-neotest/neotest',
    requires = {
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'olimorris/neotest-rspec',
    }, config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-rspec'),
      }
    })
  end
  },
  { "sindrets/diffview.nvim" },
  { "kchmck/vim-coffee-script" },
  { "RRethy/nvim-treesitter-endwise" },
  { "tpope/vim-endwise" },
  { "wsdjeg/vim-fetch" },
  { "pechorin/any-jump.vim" },
  { "ggandor/leap.nvim" },
  { "vim-test/vim-test" },
  { "tpope/vim-rails" },
  { "suketa/nvim-dap-ruby" },
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
  { 'nvim-pack/nvim-spectre' },
  { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'nvim-tree/nvim-web-devicons' }
  },
  { 'rcarriga/nvim-notify' },
  { 'stevearc/dressing.nvim' },
  { 'weizheheng/ror.nvim' },
  { 'rose-pine/neovim',       as = 'rose-pine' },
  { 'mcchrish/zenbones.nvim', requires = "rktjmp/lush.nvim" }
}

require('nvim-treesitter.configs').setup {
  endwise = {
    enable = true,
  },
}

require("dressing").setup({
  input = {
    min_width = { 60, 0.9 },
  },
  select = {
    -- telescope = require('telescope.themes').get_ivy({...})
    telescope = require('telescope.themes').get_dropdown({ layout_config = { height = 15, width = 90 } }), }
})

require('dap-ruby').setup()
require('leap').set_default_keymaps()
require('fzf-lua').setup({ 'telescope' })

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "fzf")
  -- any other extensions loading
end

-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
