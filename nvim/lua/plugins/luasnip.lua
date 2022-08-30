local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix

vim.cmd [[ 
  imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
  inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
  snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
  snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
  imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
  smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]]


--- Snippets

-- Go
local function go_appender(_, parent, _)
  v = parent.snippet.env.POSTFIX_MATCH
  return v .. " = append(" .. v .. ", "
end

ls.add_snippets("all", {
  postfix(".append", {
    f(go_appender, {}), i(1), t(")"),
  }),

  -- For APIPLUS Core 
  s("err-gen", {
    t("apierror.Common.GenericError(apierror.GenericErrorArg{AdditionalInfo: err.Error()}).GraphError()")
  }),

  s("err-notfound", {
    t({'apierror.Common.NotFound(apierror.NotFoundArg{'}),
    t({'','  ObjField: []string{"'}), i(1), t('"},'),
    t({'','  ObjID:    '}), i(2), t(','),
    t({'','}).GraphError()'}),
  }),

  s("atomic-run", {
    t({
      'err = r.AtomicProcess.Run(ctx, func(c context.Context) error {',
      '  panic("not implemented")',
      '  return nil',
      '})',
      'if err != nil {',
      '  zap.S().Error(err.Error())',
      '	 return nil, apierror.Common.GenericError(',
      '		apierror.GenericErrorArg{',
      '		  AdditionalInfo: err.Error(),',
      '		},',
      '	).GraphError()',
      '}',
    }),
  })
})

