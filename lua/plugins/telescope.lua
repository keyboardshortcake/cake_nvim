return {
    'nvim-telescope/telescope.nvim',
    -- tag = '0.1.1',
    -- or                              , branch = '0.1.1',plug
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { "debugloop/telescope-undo.nvim" },
        -- {'junegunn/fzf'},
        -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }, -- don't need, just for fun
        -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
        -- { "aaronhallaert/advanced-git-search.nvim" }, -- don't need
        {
            "aaronhallaert/advanced-git-search.nvim",
            config = function()
                --require("telescope").load_extension("advanced_git_search")
            end,
            dependencies = {
                "nvim-telescope/telescope.nvim",
                -- to show diff splits and open commits in browser
                "tpope/vim-fugitive",
                -- alternative to fugitive, can I use both?
                {
                    "sindrets/diffview.nvim",
                    event = "BufRead",
                },
                -- to open commits in browser with fugitive
                "tpope/vim-rhubarb",
                -- optional: to replace the diff from fugitive with diffview.nvim
                -- (fugitive is still needed to open in browser)
                -- "sindrets/diffview.nvim",
            },
            -- requires = {
            --   "nvim-telescope/telescope.nvim",
            --   -- to show diff splits and open commits in browser
            --   "tpope/vim-fugitive",
            -- },
        },
        { "tpope/vim-fugitive" }, -- advanced_git_search uses this
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
            -- config = function()
            --     require('live_grep_args').setup({
            --         quote_char = '"',
            --         postfix = "-uu",
            --         trim = false,
            --     })
            -- end
        },
        { 'nvim-telescope/telescope-node-modules.nvim' },
        -- { "wesleimp/telescope-windowizer.nvim" },
        "tsakirist/telescope-lazy.nvim",
        --lazy
        {
            "nvim-telescope/telescope-file-browser.nvim",
            dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
        },
        {
            "tom-anders/telescope-vim-bookmarks.nvim",
        },
    },
    opts = function()
        -- perform a telescope action on multiple files instead of having to send stuff to quick fix list heh
        -- https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-1679797700
        local select_one_or_multi = function(prompt_bufnr)
            local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
            local multi = picker:get_multi_selection()
            if not vim.tbl_isempty(multi) then
                require('telescope.actions').close(prompt_bufnr)
                for _, j in pairs(multi) do
                    if j.path ~= nil then
                        vim.cmd(string.format('%s %s', 'edit', j.path))
                    end
                end
            else
                require('telescope.actions').select_default(prompt_bufnr)
            end
        end
        -- cool functionality to switch the find text to find text in a specific folder on the fly
        -- https://github.com/nvim-telescope/telescope.nvim/issues/2201#issuecomment-1654204454
        local select_dir_for_grep = function(prompt_bufnr)
            local action_state = require("telescope.actions.state")
            local fb = require("telescope").extensions.file_browser
            local lga = require("telescope").extensions.live_grep_args
            local current_line = action_state.get_current_line()

            fb.file_browser({
                files = false,
                depth = false,
                attach_mappings = function(prompt_bufnr)
                    require("telescope.actions").select_default:replace(function()
                        local entry_path = action_state.get_selected_entry().Path
                        local dir = entry_path:is_dir() and entry_path or entry_path:parent()
                        local relative = dir:make_relative(vim.fn.getcwd())
                        local absolute = dir:absolute()

                        lga.live_grep_args({
                            results_title = relative .. "/",
                            cwd = absolute,
                            default_text = current_line,
                        })
                    end)

                    return true
                end,
            })
        end
        local actions = require "telescope.actions"
        local lga_actions = require("telescope-live-grep-args.actions")
        return {
            defaults = {
                -- prompt_prefix = " ",
                -- selection_caret = " ",
                path_display = { "smart" },
                file_ignore_patterns = { ".git/", "node_modules" },
                -- file_ignore_patterns = { ".git/" },
                -- cool setting to try: smart send to quick fix list
                -- https://www.reddit.com/r/neovim/comments/100ndit/comment/j2t92fu/?utm_source=share&utm_medium=web2x&context=3
                mappings = {
                    i = {
                        -- ["<C-l>"] = actions.select_dir_for_grep,
                        -- ["<C-l>"] = lga_actions.quote_prompt({
                        --     postfix = " -uu "
                        -- }),
                        -- ["<Down>"] = actions.cycle_history_next,
                        -- ["<Down>"] = actions.move_selection_next,
                        -- ["<Up>"] = actions.cycle_history_prev,
                        -- ["<Up>"] = actions.move_selection_previous,
                        ["<C-s>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                },

            },
            pickers = {
                -- keymap("n", "<leader>fc", ":Telescope current_buffer_fuzzy_find<CR>", opts)
                current_buffer_fuzzy_find = {
                    mappings = {
                        i = {
                            ["<c-f>"] = actions.to_fuzzy_refine,
                        }
                    }
                },
                find_files = {
                    -- vimgrep_arguments = {
                    --     'rg',
                    --     -- this makes sure we're ignoring git -ignores and looking through hidden files too
                    --     -- it's a ripgrep flag
                    --     '-uu',
                    --     '--no-heading',
                    --     '--with-filename',
                    --     '--line-number',
                    --     '--column',
                    --     '--smart-case',
                    -- },
                    mappings = {
                        i = {
                            ["<CR>"] = select_one_or_multi,
                            ["<C-l>"] = select_dir_for_grep,
                        }
                    },
                },
                live_grep = {
                    -- vimgrep_arguments = {
                    --     'rg',
                    --     -- this makes sure we're ignoring git -ignores and looking through hidden files too
                    --     -- it's a ripgrep flag
                    --     '-uu',
                    --     '--no-heading',
                    --     '--with-filename',
                    --     '--line-number',
                    --     '--column',
                    --     '--smart-case',
                    -- },
                    mappings = {
                        i = {
                            ["<c-f>"] = actions.to_fuzzy_refine,
                            ["<C-l>"] = select_dir_for_grep,
                            ['<CR>'] = select_one_or_multi,
                        },
                        n = {
                            ["<C-l>"] = select_dir_for_grep

                        }
                    }
                },

            },
            extensions = {
                -- quicknote = {
                --     defaultScope = "Global",
                -- },
                fzf                 = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    -- case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    case_mode = "respect_case",     -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
                file_browser        = {
                    -- TODO: Figur out how to show the hidden stuff in file browser
                    --
                    -- no_ignore = {
                    --     true
                    -- },
                    -- hidden = {
                    --     file_browser = false,
                    --     folder_browser = false,
                    -- },
                    mappings = {
                        i = {
                            ["<CR>"] = select_one_or_multi,
                            ["<C-l>"] = select_dir_for_grep,
                        }
                    },
                },
                advanced_git_search = {
                    -- fugitive or diffview
                    -- diff_plugin = "fugitive",
                    diff_plugin = "diffview",
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
                },
                undo                = {
                    -- opts = {
                    --     extensions = {
                    --         undo = {
                    --             side_by_side = true,
                    --             layout_strategy = "vertical",
                    --             layout_config = {
                    --                 preview_height = 0.8,
                    --             },
                    --         },
                    --     },
                    -- }
                },
                live_grep_args      = {
                    -- These settings are sensetive. For example, if --column is missing it doesn't work anymore etc
                    -- https://github.com/nvim-telescope/telescope-live-grep-args.nvim/issues/9#issuecomment-1043376714
                    vimgrep_arguments = {
                        'rg',
                        -- this makes sure we're ignoring git -ignores and looking through hidden files too
                        -- it's a ripgrep flag
                        -- '-uu',
                        -- well, i guess I only want to look through hidden files but not .gitignore stuff afterall heh
                        '--hidden',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--smart-case',
                    },
                    mappings = {
                        i = {
                            -- this just literally injects the flag onto your screen, dislike
                            -- ["<C-k>"] = lga_actions.quote_prompt({
                            --     postfix = " -uu "
                            -- }),
                            ["<c-f>"] = actions.to_fuzzy_refine,
                            ["<C-l>"] = select_dir_for_grep,
                        },
                        n = {
                            ["<C-l>"] = select_dir_for_grep

                        }
                    }
                }
                -- please take a look at the readme of the extension you want to configure
            },
        }
    end,
    config = function(_, opts)
        require('telescope').setup(opts)
        -- local status_ok, telescope = pcall(require, "telescope")
        -- if not status_ok then
        --     return
        -- end



        -- telescope.setup(opts)
        require('telescope').load_extension "fzf"
        require('telescope').load_extension "advanced_git_search"
        require('telescope').load_extension "live_grep_args"
        require('telescope').load_extension "node_modules"
        require('telescope').load_extension "undo"
        require('telescope').load_extension "lazy"
        require('telescope').load_extension "file_browser"
        require('telescope').load_extension "vim_bookmarks"
        -- require("telescope").load_extension("quicknote")
        -- telescope.load_extension "windowizer"
    end
    -- // interestingly, my mappsings shortcut (and probably that whole return block) doesn't work with this active
    -- config = function(_, opts)
    --     local telescope = require('telescope')
    --
    --     telescope.load_extension "fzf"
    --     telescope.load_extension "advanced_git_search"
    --     telescope.load_extension("live_grep_args")
    --     telescope.load_extension("node_modules")
    -- end
}

-- local status_ok, telescope = pcall(require, "telescope")
-- if not status_ok then
--   return
-- end
--
-- local actions = require "telescope.actions"
--
-- telescope.setup {
--   defaults = {
--
--     prompt_prefix = " ",
--     selection_caret = " ",
--     path_display = { "smart" },
--
--     mappings = {
--       i = {
--         ["<C-n>"] = actions.cycle_history_next,
--         ["<C-p>"] = actions.cycle_history_prev,
--
--         ["<C-j>"] = actions.move_selection_next,
--         ["<C-k>"] = actions.move_selection_previous,
--
--         ["<C-c>"] = actions.close,
--
--         ["<Down>"] = actions.move_selection_next,
--         ["<Up>"] = actions.move_selection_previous,
--
--         ["<CR>"] = actions.select_default,
--         ["<C-x>"] = actions.select_horizontal,
--         ["<C-v>"] = actions.select_vertical,
--         ["<C-t>"] = actions.select_tab,
--
--         ["<C-u>"] = actions.preview_scrolling_up,
--         ["<C-d>"] = actions.preview_scrolling_down,
--
--         ["<PageUp>"] = actions.results_scrolling_up,
--         ["<PageDown>"] = actions.results_scrolling_down,
--
--         ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
--         ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
--         ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
--         ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
--         ["<C-l>"] = actions.complete_tag,
--         ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
--       },
--
--       n = {
--         ["<esc>"] = actions.close,
--         ["<CR>"] = actions.select_default,
--         ["<C-x>"] = actions.select_horizontal,
--         ["<C-v>"] = actions.select_vertical,
--         ["<C-t>"] = actions.select_tab,
--
--         ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
--         ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
--         ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
--         ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
--
--         ["j"] = actions.move_selection_next,
--         ["k"] = actions.move_selection_previous,
--         ["H"] = actions.move_to_top,
--         ["M"] = actions.move_to_middle,
--         ["L"] = actions.move_to_bottom,
--
--         ["<Down>"] = actions.move_selection_next,
--         ["<Up>"] = actions.move_selection_previous,
--         ["gg"] = actions.move_to_top,
--         ["G"] = actions.move_to_bottom,
--
--         ["<C-u>"] = actions.preview_scrolling_up,
--         ["<C-d>"] = actions.preview_scrolling_down,
--
--         ["<PageUp>"] = actions.results_scrolling_up,
--         ["<PageDown>"] = actions.results_scrolling_down,
--
--         ["?"] = actions.which_key,
--       },
--     },
--   },
--   pickers = {
--     -- Default configuration for builtin pickers goes here:
--     -- picker_name = {
--     --   picker_config_key = value,
--     --   ...
--     -- }
--     -- Now the picker_config_key will be applied every time you call this
--     -- builtin picker
--   },
--   extensions = {
--     -- Your extension configuration goes here:
--     -- extension_name = {
--     --   extension_config_key = value,
--     -- }
--     -- please take a look at the readme of the extension you want to configure
--   },
-- }
