return {
  'Mofiqul/vscode.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    style = 'dark',
    group_overrides = {
      -- Variables
      ['@variable'] = { fg = '#bdbdbd' },
      ['@variable.c_sharp'] = { link = '@variable' },
      ['@variable.member.c_sharp'] = { fg = '#65c3cc' },
      ['@variable.parameter'] = { fg = '#ed8796' },
      ['@variable.parameter.c_sharp'] = { link = '@variable.parameter' },

      -- ALL Keywords - more comprehensive targeting
      ['@keyword'] = { fg = '#6c95eb', italic = false },
      ['@keyword.repeat'] = { fg = '#6c95eb', bold = true },
      ['@keyword.repeat.c_sharp'] = { link = '@keyword.repeat' },
      ['@keyword.conditional'] = { fg = '#6c95eb', italic = false },
      ['@keyword.conditional.c_sharp'] = { link = '@keyword.conditional' },
      ['@keyword.return'] = { fg = '#6c95eb' },
      ['@keyword.return.c_sharp'] = { link = '@keyword.return' },

      -- C++ specific keywords that I can see in your screenshot
      ['@storageclass'] = { fg = '#6c95eb' }, -- static, const, etc.
      ['@storageclass.cpp'] = { fg = '#6c95eb' },
      ['@type.qualifier'] = { fg = '#6c95eb' }, -- const, static
      ['@type.qualifier.cpp'] = { fg = '#6c95eb' },

      -- Target specific keywords by name
      ['@keyword.storage'] = { fg = '#6c95eb' },
      ['@keyword.modifier'] = { fg = '#6c95eb' },
      ['@keyword.operator'] = { fg = '#6c95eb' },

      -- Generic treesitter groups
      ['Keyword'] = { fg = '#6c95eb' },
      ['StorageClass'] = { fg = '#6c95eb' },
      ['Type'] = { fg = '#6c95eb' },

      -- Boolean
      ['@boolean'] = { fg = '#6c95eb', italic = true },
      ['@boolean.c_sharp'] = { link = '@boolean' },

      -- Functions/Methods
      ['@function.method'] = { fg = '#38c596', bold = true },
      ['@function.method.call'] = { link = '@function.method' },
      ['@function.method.call.c_sharp'] = { link = '@function.method' },
      ['@lsp.type.extensionMethodName.cs'] = { link = '@function.method' },

      -- Classes
      ['@type_'] = { fg = '#c191ff', bold = true },
      ['@lsp.type.class.cs'] = { link = '@type_' },
      ['@lsp.type.namespace.cs'] = { link = '@type_' },

      -- Numbers
      ['@number'] = { fg = '#e791bc', bold = true },
      ['@number.c_sharp'] = { link = '@number' },

      -- Comments
      ['Comment'] = { fg = '#84c26b', italic = true },

      -- c++, lsp: clangd
      -- keywords
      ['Exception'] = { link = 'Keyword' },
      ['Inspect'] = { link = 'Keyword' },
      ['Label'] = { link = 'Keyword' },
      ['Conditional'] = { link = 'Keyword' },
      ['Repeat'] = { link = 'Keyword' },
      ['Statement'] = { link = 'Keyword' },
      ['cBlock'] = { link = 'Keyword' },
      ['cInclude'] = { link = 'Keyword' },
      ['Macro'] = { link = 'Keyword' },
      ['cppStructure'] = { link = 'Keyword' },

      ['@lsp.type.function'] = { link = '@function.method' },

      ['@lsp.type.namespace.cpp'] = { link = '@type_' },
      ['@lsp.type.typeParameter.cpp'] = { link = '@type_' },
    },
  },
  config = function(_, opts)
    require('vscode').setup(opts)
    vim.cmd.colorscheme 'vscode'
  end,
}
