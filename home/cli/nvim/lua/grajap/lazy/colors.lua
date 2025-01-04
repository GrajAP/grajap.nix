return {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, config = function()
            require('catppuccin').setup({
--               disable_background = false,
            })
        end
    }}
