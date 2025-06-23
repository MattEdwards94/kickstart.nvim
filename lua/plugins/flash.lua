-- The best way to navigate around
return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    -- stylua: ignore
    keys = {
        -- regular flash mode for jumping to a location on screen
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        -- Use treesitter to get the syntax tree break points. Selects the whole scope
        { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        -- While performing an operator, use remote flash to flash from somewhere else.
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
}
