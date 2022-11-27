require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "lua", "rust", "go" },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
})

require("treesitter-context").setup({
  enable = true,
  max_lines = 0,
  trim_scope = "outer",
  min_window_height = 0,
  patterns = {
    default = {
      "class",
      "function",
      "method",
      "for",
      "while",
      "if",
      "switch",
      "case",
    },
    tex = {
      "chapter",
      "section",
      "subsection",
      "subsubsection",
    },
    rust = {
      "impl_item",
      "struct",
      "enum",
    },
    scala = {
      "object_definition",
    },
    vhdl = {
      "process_statement",
      "architecture_body",
      "entity_declaration",
    },
    markdown = {
      "section",
    },
    elixir = {
      "anonymous_function",
      "arguments",
      "block",
      "do_block",
      "list",
      "map",
      "tuple",
      "quoted_content",
    },
    json = {
      "pair",
    },
    yaml = {
      "block_mapping_pair",
    },
  },
  exact_patterns = {
  },

  -- [!] The options below are exposed but shouldn't require your attention,
  --     you can safely ignore them.

  zindex = 20,
  mode = "cursor",
  separator = "~",
})
