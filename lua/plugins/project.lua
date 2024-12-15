return {
    "ahmedkhalf/project.nvim",
    opts = function()
        return {
            detection_methods = { "pattern" },
            -- patterns used to detect root dir, when **"pattern"** is in detection_methods
            -- added by cake. added tsconfig for work angualr projects, some of them at least
            -- added .npmrc for works custom thing
            patterns = { ".npmrc", ".nvimrc", "eslint.config.js", "prettier.config.js", ".git", "Makefile", "package.json", "tsconfig.app.json", ".this_is_a_project" },
        }
    end,
    config = function(_, opts)
        local status_ok, project = pcall(require, "project_nvim")
        if not status_ok then
            return
        end

        project.setup(opts)

        local tele_status_ok, telescope = pcall(require, "telescope")
        if not tele_status_ok then
            return
        end
        telescope.load_extension('projects')
    end

}
