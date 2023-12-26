return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    -- or                              , branch = '0.1.1',plug
    dependencies = {
--         dependencies = {
--     { 
--         "nvim-telescope/telescope-live-grep-args.nvim" ,
--         -- This will not install any breaking changes.
--         -- For major updates, this must be adjusted manually.
--         version = "^1.0.0",
--     },
--   },
--   config = function()
--     require("telescope").load_extension("live_grep_args")
--   end
-- }
        'nvim-lua/plenary.nvim',
        -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }, -- don't need, just for fun
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { "aaronhallaert/advanced-git-search.nvim" }, -- don't need
        "tpope/vim-fugitive", -- advanced_git_search uses this
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },
    },
    opts = function()
        local status_ok, telescope = pcall(require, "telescope")
        if not status_ok then
          return
        end

        telescope.load_extension "fzf"
        telescope.load_extension "advanced_git_search"
        telescope.load_extension("live_grep_args")

        local actions = require "telescope.actions"

        return {
            defaults = {
                -- prompt_prefix = " ",
                -- selection_caret = " ",
                path_display = { "smart" },
                -- file_ignore_patterns = { ".git/", "node_modules" },
                file_ignore_patterns = { ".git/" },
                mappings = {
                    i = {
                        -- ["<Down>"] = actions.cycle_history_next,
                        ["<Down>"] = actions.move_selection_next,
                        -- ["<Up>"] = actions.cycle_history_prev,
                        ["<Up>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                   -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true,    -- override the file sorter
                        -- case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                        case_mode = "respect_case",     -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                    advanced_git_search = {
                        -- fugitive or diffview
                        diff_plugin = "fugitive",
                        -- customize git in previewer
                        -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
                        git_flags = {},
                        -- customize git diff in previewer
                        -- e.g. flags such as { "--raw" }
                        git_diff_flags = {},
                        -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
                        show_builtin_git_pickers = false,
                        entry_default_author_or_date = "author", -- one of "author" or "date"

                        -- Telescope layout setup
                        telescope_theme = {
                            -- function_name_1 = {
                            --     -- Theme options
                            -- },
                            -- function_name_2 = "dropdown",
                            -- e.g. realistic example
                            show_custom_functions = {
                                layout_config = { width = 0.4, height = 0.4 },
                            },

                        }
                    }
                },
            }
        }
    -- },
    end
}
