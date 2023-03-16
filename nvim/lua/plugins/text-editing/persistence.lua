require("persistence").setup()

require("which-key").register({
  q = {
    name = "persistence",
    s = { "<cmd>lua require('persistence').load()<cr>", "Load session" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Load last session" },
    d = { "<cmd>lua require('persistence').stop()<cr>", "Stop persistence" },
  },
}, { prefix = "<leader>" })
