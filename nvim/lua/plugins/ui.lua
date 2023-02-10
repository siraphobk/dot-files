local function lualine_setup()
  local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed,
      }
    end
  end

  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = "catppuccin",
      component_separators = { left = "┊", right = "┊" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        { "diff", source = diff_source },
        "diagnostics",
      },
      lualine_c = { "filename", "searchcount" },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  })
end

local function dashboard_setup()

  local alpha = require("alpha")
  local dashboard = require("alpha/themes/dashboard")

  -- Set header
  dashboard.section.header.val = {
    "⠀⠀⠀⠀⠀⠀⣠⣾⠃⠀⠀⠀⣿⠃⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⣿⠀⠀⠀⢹⣇⠀⠀⠀⠀⠀⠘⣇⠀⠘⢿⣷⡉⠉⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⣀⣠⣴⣾⡿⠁⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⢰⡇⠀⠀⠸⣇⠀⠀⠀⢻⡄⠀⠀⠀⠀⠀⢻⡀⠀⠈⠻⣿⣮⡉⢹⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⢰⣿⣿⣿⣿⣿⠁⠀⢀⠀⠁⠀⢻⡆⠀⠀⠀⠀⠀⠀⢸⣧⠀⠀⠀⢻⡄⠀⠀⠀⢿⡀⠀⠀⠀⠀⠸⡇⠀⠀⠀⠘⡿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠘⣿⣿⣿⣿⠇⠀⠀⣾⠀⠀⠀⢸⣧⠀⠀⠀⠀⠀⠀⠈⣿⣦⠀⠀⠈⢿⣄⠀⠀⠈⢷⡀⠀⠀⠀⠀⣷⠀⠀⠀⠀⢷⡀⠙⢿⣷⡀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⢻⣿⣿⡏⠀⢠⡀⢻⠀⠀⠀⢸⣿⣦⡀⠀⠀⠀⠀⠀⢿⡉⢷⡄⠀⠘⢿⣦⡀⠀⠈⢷⡀⠀⠀⠀⢻⠀⠀⠀⠀⠈⣧⠀⠈⢻⣷⡀⠀⠀⠀⠀⠀⠀",
    "⠀⠘⣿⡿⠀⠀⣸⠀⣸⡇⠀⠀⢸⡇⠈⢷⣄⡀⠀⠀⠀⢺⣇⠀⠙⢦⣄⠈⢷⡹⢦⡀⠈⣷⠀⠀⠀⢸⡇⠀⠀⠀⠀⠸⣇⠀⠀⠹⣷⡀⠀⠀⠀⠀⠀",
    "⠀⠀⣸⡇⠀⠀⡯⢠⣿⢿⡄⠀⢸⡇⠀⠀⠈⠛⠶⣦⣄⣀⣹⣿⡓⠳⠎⠛⠲⠿⢦⣽⣶⣼⣇⠀⠀⢸⡇⠀⠀⠀⠀⠀⢻⡄⠀⠀⢻⣧⠀⠀⠀⠀⠀",
    "⠀⢠⣿⠀⠀⠀⡇⣼⠏⠀⠻⣆⢘⣧⣴⠖⠋⠀⠀⠀⠀⠉⠁⠉⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡁⠀⢸⡇⠀⠀⠀⠀⠀⠘⣷⠀⠀⠈⣿⣇⠀⠀⠀⠀",
    "⠀⣼⡟⠀⠀⠀⣿⡟⠀⠀⠀⠙⠳⠥⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣼⡇⠀⢸⡇⠀⠀⠀⠀⠀⠀⢹⡇⠀⠀⡟⢿⣆⠀⠀⠀",
    "⢀⣿⡇⠀⠀⠀⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡤⢶⣾⣿⣿⣏⡹⠿⣇⠀⢸⡇⠀⠀⠀⠀⠀⠀⠘⣧⠀⠀⣧⠸⣿⡀⠀⠀",
    "⢸⣿⢣⠀⠀⠀⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣶⣯⠵⠶⠛⠉⠁⠀⠀⠀⠀⢿⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⢻⠀⠀⣿⠀⣿⣧⠀⠀",
    "⣸⡏⢹⠀⠀⠀⢿⡇⠀⠀⠀⣠⣤⣶⣾⣿⣻⣿⡿⠖⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⢀⠀⣀⠀⢸⡀⢸⠀⠀⠀⠀⠀⠀⠀⠀⢸⡆⠀⡿⢰⡏⣿⡀⠀",
    "⣿⡇⢸⡄⠀⠀⢸⣿⢀⣴⣟⣡⡽⠟⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡆⠸⣗⠻⠗⠻⠇⢸⡇⣸⠁⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⡇⢸⠇⢸⣧⠀",
    "⣿⡅⠘⣇⠀⠀⠀⣿⡘⠛⠉⠁⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⢈⡇⣿⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⢠⣃⡿⠀⠀⣿⠀",
    "⣿⢷⡀⢹⡄⠀⠀⢹⡇⠀⠀⣸⡆⠶⠄⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⡶⠃⠀⠀⠀⠀⠀⢸⣧⡇⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠘⣼⠃⠀⠀⢻⡄",
    "⣿⠈⣧⠈⢷⠀⠀⠈⣿⠀⠀⠈⠀⠀⠀⠀⢀⠀⠀⢀⣀⣤⠴⠖⢚⣩⠽⠋⠀⠀⠀⠀⠀⠀⠀⠀⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⣸⠀⣰⠏⠀⠀⠀⢼⡇",
    "⣿⠀⠘⣇⠘⣧⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠉⠛⠛⠷⠖⠒⠒⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⢁⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⢰⠟⠀⠀⠀⠀⣿⡄",
    "⣿⡄⠀⠘⣦⠘⣇⠀⠈⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⠾⠋⢀⣽⡇⠀⠀⠀⠀⠀⠀⠀⠀⢨⡷⠋⠀⠀⠀⠀⠀⣿⠀",
    "⢸⣧⠀⠀⠘⢧⡘⢧⡀⠘⠻⠶⢤⣤⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⣀⣀⣠⣴⣾⠟⠋⢀⣠⠶⢻⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠃⠀⠀⠀⠀⠀⣰⡏⠀",
    "⠀⢿⡆⠀⠀⡈⢳⣄⠱⣄⠀⠀⠀⠀⠀⣽⠉⠉⢉⣉⠙⢿⣉⠉⠻⣿⡿⠋⢀⣠⠖⠋⠁⠀⣾⠁⠀⠀⠀⠀⠀⠀⠀⠀⢰⡟⠀⠀⠀⠀⠀⣠⡟⠀⠀",
    "⠀⠈⢿⡄⠐⣧⠀⠙⢦⡈⠀⠀⠀⠀⠀⢻⣆⠀⠀⠙⢦⣀⠉⠳⢤⣘⣧⠶⠋⠁⠀⠀⠀⣰⡿⠀⠀⠀⠀⠀⠀⠀⢀⣠⠿⠃⠀⠀⠀⢀⣴⠟⠁⠀⠀",
  }

  -- local anya_cute_face = {
  --   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠞⠉⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠈⠓⢄⠀⠀⠀⠙⠑⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  --   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀⢀⡴⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠈⠹⢦⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  --   "⠀⠀⣀⣠⣤⣴⣶⣶⣾⣟⠟⠀⠀⠠⠃⢠⠎⠀⠀⠀⣰⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡀⠀⠀⠀⠀⠑⣟⢿⣷⣶⣶⣶⣤⣤⣀⠀",
  --   "⠀⠸⣿⣿⣿⣿⣿⡿⢻⠋⠀⠀⠀⠁⡰⠃⠀⠀⠀⢰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢶⡀⠀⠀⠀⠈⢺⠛⣿⣿⣿⣿⣿⣿⠃",
  --   "⠀⠀⢿⣿⣿⣿⡿⢳⠃⢀⡀⠀⠀⡼⠁⠠⠀⠀⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⡀⠀⠑⠄⠀⠳⡛⢿⣿⣿⣿⡟⠀",
  --   "⠀⠀⢸⣿⣿⣿⣤⡇⠃⠀⠀⠀⢰⠃⠀⢡⡎⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢱⡄⠀⠀⠀⠀⢱⢸⣿⣿⣿⠃⠀",
  --   "⠀⠀⠀⣿⣿⢫⡟⠸⠀⠀⠀⠀⡏⠀⠀⡎⠀⠀⣸⡀⠀⠀⠀⠀⠀⠀⣄⢯⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⠀⠈⢦⠀⠀⢫⡹⣿⡟⠀⠀",
  --   "⠀⠀⠀⢸⣿⣿⠁⣏⠀⠀⠀⢸⠁⠀⡸⠀⠀⣼⠟⡇⠀⠀⠀⠀⠀⠀⠘⣼⡆⠀⠀⠈⣧⠀⠀⠀⠀⠀⠘⡆⠀⠀⢧⠀⠀⢻⣿⠃⠀⠀",
  --   "⠀⠀⠀⠀⣿⠇⠀⠮⠀⠀⠀⡏⠀⠀⡇⠀⡰⠧⠤⠼⡀⢰⠀⠀⠀⠀⠀⠸⣿⣦⠀⠀⠘⣧⡀⠀⠀⠀⠀⠹⡀⠀⠸⡄⠀⠈⢿⣄⠀⠀",
  --   "⠀⠀⠀⢠⡟⡄⠀⡳⠀⠀⢰⠇⠀⣼⠁⡰⢁⣀⣀⠀⠹⡄⢣⠀⠀⠀⠀⠀⠙⣌⠛⠦⡀⠱⡙⢦⡀⠀⢣⠀⢣⠀⠀⢇⠀⠈⢏⣏⠛⢖",
  --   "⠀⠀⢠⢳⠃⡇⠀⢑⠀⠀⢸⠀⡜⢉⣦⣯⡵⠶⢦⣌⠐⠜⢄⠳⣄⡀⠀⠀⠀⠈⢲⣈⣭⣵⣿⣑⠳⣄⠈⡇⠘⡆⠀⢸⠀⠀⢸⠘⡆⠀",
  --   "⠀⣠⠃⡞⠀⢱⠀⢸⠀⠀⢸⡜⢠⣿⠟⢁⠐⢿⣷⣌⢳⡀⠀⠑⠸⠯⠉⠑⠒⢢⡟⠁⠘⣿⣶⡍⠻⣬⡷⣧⠀⢳⠀⠨⡄⠀⢈⠆⢹⡀",
  --   "⡜⠁⣼⠇⠀⠈⡆⠈⡆⠀⢸⠐⣾⠃⠀⣿⡖⣶⡽⣿⠀⣧⠀⠀⠀⠀⠀⠀⠀⣾⠀⣷⣶⣷⣹⣿⠀⢹⡾⢾⢀⣾⡀⠀⡇⠀⢸⠀⠀⢣",
  --   "⣠⡾⢼⡁⠀⠀⠹⡄⢱⠀⢸⠐⣻⠀⠀⣿⣏⣿⣧⢿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠈⠘⣿⢿⣿⢿⣻⠀⠀⡷⠞⠉⣯⡇⢀⡇⠀⣸⠀⠀⠘",
  --   "⣿⡝⣾⠀⠀⠀⠀⢳⠈⢇⠸⡀⠹⡄⠀⠘⢇⣐⡨⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣔⣂⡸⠃⠀⢸⠓⠂⢰⢿⡇⢰⠀⢀⡇⠀⠀⠀",
  --   "⣷⣛⣼⠀⠀⠀⠀⠀⠣⡈⢆⢇⠀⠈⠢⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⡄⠋⠁⢀⡷⢫⣗⡸⠀⡼⠀⠀⠀⠀",
  --   "⢷⣝⣾⡄⠀⠀⠀⠀⠀⠑⣌⢾⡀⠀⠀⠀⠀⠀⠀⣠⡖⠒⠒⠒⠒⠒⠒⠒⠒⠦⠤⣄⠀⠀⠁⠁⠀⠀⠀⡜⠛⣫⣷⠃⡼⠁⠀⠀⠀⠀",
  --   "⠸⣿⣸⣇⠀⠀⠀⠀⠀⠀⠀⢣⣇⠀⠀⠀⠀⠀⢸⣿⡿⠟⠛⠛⠛⠛⠛⠛⠛⠛⠿⣿⡇⠀⠀⠀⠀⠀⢸⣧⢿⢿⡟⡸⠃⠀⠀⠀⠀⢀",
  --   "⣧⠘⢿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠹⣆⠀⠀⠀⠀⠈⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⠁⠀⠀⠀⠀⢠⡿⣼⡹⣾⡟⠁⠀⠀⠀⠀⠀⢸",
  --   "⠈⠁⠈⠻⡽⡄⠀⠀⠀⠀⠀⠀⠀⠘⢦⠀⠀⠀⠀⠀⠓⢦⡀⠀⠀⠀⠀⠀⢀⡠⠞⠁⠀⠀⠀⢀⣴⣟⡳⢧⣻⡽⠀⠀⠀⠀⠀⠀⢀⡯",
  --   "⣿⣶⣤⣄⣹⡽⣆⠀⠀⠀⠀⠀⠀⠀⠈⠳⣄⡀⠀⠀⠀⠀⠈⠓⠒⠒⠒⠚⠉⠀⠀⠀⢀⣠⣴⢯⡳⣞⣿⣷⣹⡇⠀⠀⠀⠀⠀⢀⣾⢳",
  --   "⣿⣿⣿⣿⣿⣿⣯⠷⣄⠀⠀⠀⠀⠀⠀⠀⠹⣿⣷⣒⣦⢤⣤⣠⣀⣄⣠⣤⣤⣴⣶⢻⡽⣻⣮⣗⣻⢼⣻⡟⢾⡇⠀⠀⠀⠀⢀⡾⣭⣿",
  --   "⣿⣿⣿⣿⣿⣿⣿⣿⣽⣳⢦⣀⠀⠀⠀⠀⠀⠹⡏⠁⠉⠓⠦⣉⡉⠛⣙⣩⠵⢚⠩⠳⣽⣽⣼⣿⣾⣷⣷⣿⣿⠆⠀⠀⠀⣠⣾⣻⣾⣿",
  -- }


  -- Set menu
  dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
    dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
    dashboard.button("l", "  Load last session", ":lua require('persistence').load()<CR>"),
    dashboard.button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button("q", "  Quit NVIM", ":qa<CR>"),

  }

  -- Set footer
  dashboard.section.footer.val = {
    "( ≖ ‿ ≖ ) HEH~",
  }

  -- Send config to alpha
  alpha.setup(dashboard.opts)

  -- Disable folding on alpha buffer
  vim.cmd([[
			    autocmd FileType alpha setlocal nofoldenable
			]])
end

local function bufferline_setup()
  require("bufferline").setup({
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
      diagnostics = "nvim_lsp",
    },
  })

  local map = vim.keymap.set

  map("n", "<A-c>", ":bp|bd #<CR>")
  map("n", "<A-p>", ":BufferLineTogglePin<CR>")
  map("n", "<A-,>", ":BufferLineCyclePrev<CR>")
  map("n", "<A-.>", ":BufferLineCycleNext<CR>")
  map("n", "<A-<>", ":BufferLineMovePrev<CR>")
  map("n", "<A->>", ":BufferLineMoveNext<CR>")
end

return {
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      bufferline_setup()
    end,
  },
  { "sainnhe/sonokai" },
  { "sainnhe/gruvbox-material" },
  "folke/tokyonight.nvim",
  { "catppuccin/nvim", as = "catppuccin" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      lualine_setup()
    end,
  },

  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      dashboard_setup()
    end,
  },


  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({})
    end,

    -- Examples
    -- TODO: What else?
    -- HACK: Weird code
    -- FIX: Needs fixing
    -- PERF: Fully optimised
    -- WARNING: Beware, coders...
    -- NOTE: Note to self
  },

}
