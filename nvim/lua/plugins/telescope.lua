local function telescope_setup()
  require("telescope").setup()

  local builtin = require("telescope.builtin")
  local wk_ok, wk = pcall(require, "which-key")

  if not wk_ok then
    return
  end

  wk.register({
    f = {
      name = "Telescope",
      f = {
        function()
          builtin.find_files()
        end,
        "Find Files",
      },
      g = {
        function()
          builtin.live_grep()
        end,
        "Live Grep",
      },
      b = {
        function()
          builtin.buffers()
        end,
        "Buffers",
      },
      h = {
        function()
          builtin.help_tags()
        end,
        "Help Tags",
      },
    },
  }, { prefix = "<leader>" })
end

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    build = "sudo apt install ripgrep",
    config = function()
      telescope_setup()
    end,
  },
}
