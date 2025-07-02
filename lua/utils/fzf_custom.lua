local M = {}

function M.live_grep_in_selected_dir()
  -- Define the base directory for the directory picker (where fd starts searching)
  -- Using vim.fn.expand('~') is more robust than "~" directly for internal Lua paths.
  local picker_start_dir = vim.fn.expand('~')

  require("fzf-lua").fzf_exec(
    "fd --type d --max-depth 6 --hidden -L", -- This command will be run with 'picker_start_dir' as its cwd
    {
      cwd = picker_start_dir, -- Set the working directory for the 'fd' command
      prompt = "Select directory to grep in > ",
      actions = {
        ["default"] = function(selected_dir_table)
          if selected_dir_table and selected_dir_table[1] then
            local relative_path = selected_dir_table[1] -- e.g., "my_project/src"

            -- IMPORTANT: Construct the absolute path
            -- Use vim.fs.joinpath for robust path concatenation
            local absolute_selected_path = vim.fs.joinpath(picker_start_dir, relative_path)

            -- Now, pass the absolute path to live_grep's cwd option
            require("fzf-lua").live_grep({ cwd = absolute_selected_path })
          end
        end,
      },
    }
  )
end

return M
