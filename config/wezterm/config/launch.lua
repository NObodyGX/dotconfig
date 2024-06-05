local platform = require('utils.platform')()

local options = {
   default_prog = {},
   launch_menu = {},
}

options.default_prog = { 'zsh', '-l' }
options.launch_menu = {
   { label = 'Bash', args = { 'bash', '-l' } },
   { label = 'Zsh', args = { 'zsh', '-l' } },
}

return options
