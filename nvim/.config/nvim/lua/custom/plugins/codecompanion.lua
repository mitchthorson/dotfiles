-- More 🤖 stuff
return {
  "olimorris/codecompanion.nvim",
  opts = {
    display = {
      action_palette = {
        width = 95,
        height = 10,
        prompt = "Prompt ",                 -- Prompt used for interactive LLM calls
        provider = "telescope",               -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
        opts = {
          show_default_actions = true,      -- Show the default actions in the action palette?
          show_default_prompt_library = true, -- Show the default prompt library in the action palette?
          title = "CodeCompanion actions",  -- The title of the action palette
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
