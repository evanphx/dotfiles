require('neogit').setup {
  disable_signs = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = false,
  -- customize displayed signs
  signs = {
    -- { CLOSED, OPENED }
    section = { ">", "v" },
    item = { ">", "v" },
    hunk = { "", "" },
  },
  integrations = {
    -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
    -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
    --
    -- Requires you to have `sindrets/diffview.nvim` installed.
    -- use { 
    --   'TimUntersberger/neogit', 
    --   requires = { 
    --     'nvim-lua/plenary.nvim',
    --     'sindrets/diffview.nvim' 
    --   }
    -- }
    --
    diffview = false  
  },
  -- override/add mappings
  mappings = {
    -- modify status buffer mappings
    status = {
      -- Adds a mapping with "B" as key that does the "BranchPopup" command
      ["B"] = "BranchPopup",
      -- Removes the default mapping of "s"
      ["s"] = "",
    }
  }
}


-- Telescope

local actions = require('telescope.actions')
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
  buffers = {
    sort_lastused = true,
    theme = "dropdown",
    mappings = {
      i = {
        ["<c-d>"] = require("telescope.actions").delete_buffer,
        -- or right hand side can also be a the name of the action as string
        ["<c-d>"] = "delete_buffer",
      },
      n = {
        ["<c-d>"] = require("telescope.actions").delete_buffer,
      }
    }
  },
}

require('gitsigns').setup()

-- Galaxyline config
--
--
local gl = require('galaxyline')
local colorUtil = require('galaxyline.colors')
local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local extension = require('galaxyline.provider_extensions')

local function u(code)
  if type(code) == 'string' then
    code = tonumber('0x' .. code)
  end
  local c = string.char
  if code <= 0x7f then
    return c(code)
  end
  local t = {}
  if code <= 0x07ff then
    t[1] = c(bit.bor(0xc0, bit.rshift(code, 6)))
    t[2] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  elseif code <= 0xffff then
    t[1] = c(bit.bor(0xe0, bit.rshift(code, 12)))
    t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
    t[3] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  else
    t[1] = c(bit.bor(0xf0, bit.rshift(code, 18)))
    t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 12), 0x3f)))
    t[3] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
    t[4] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  end
  return table.concat(t)
end

local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui','packer'}

local colors = {
  bg = "NONE",
  -- bg = "#2E3440",
  fg = "#81A1C1",
  -- line_bg = "NONE",
  lbg = "NONE",
  line_bg = "#3B4252",
  fg_green = "#8FBCBB",
  yellow = "#EBCB8B",
  cyan = "#A3BE8C",
  darkblue = "#81A1C1",
  green = "#8FBCBB",
  orange = "#D08770",
  purple = "#B48EAD",
  magenta = "#BF616A",
  gray = "#616E88",
  blue = "#5E81AC",
  red = "#BF616A"
}

colors.bg = '#282a2e'

gls.left = {
  {
    RainbowRed = {
      provider = function() return '▊ ' end,
      highlight = {colors.blue,colors.line_bg}
    },
  },
  {
    ViMode = {
      provider = function()
        -- auto change color according the vim mode
        local mode_color = {n = colors.red, i = colors.green,v=colors.blue,
                            [''] = colors.blue,V=colors.blue,
                            c = colors.magenta,no = colors.red,s = colors.orange,
                            S=colors.orange,[''] = colors.orange,
                            ic = colors.yellow,R = colors.violet,Rv = colors.violet,
                            cv = colors.red,ce=colors.red, r = colors.cyan,
                            rm = colors.cyan, ['r?'] = colors.cyan,
                            ['!']  = colors.red,t = colors.red}
        vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
        return '  '
      end,
      highlight = {colors.red,colors.line_bg,'bold'},
    },
  },
  {
    FilePath = {
      provider = function() return vim.fn.expand("%:h") end,
      condition = condition.buffer_not_empty,
      highlight = {colors.gray,colors.line_bg}
    }
  },
  {
    FileSep = {
      provider = function() return "/" end,
      condition = condition.buffer_not_empty,
      highlight = {colors.gray,colors.line_bg,"bold"}
    }
  },
  {
    FileName = {
      provider = 'FileName',
      condition = condition.buffer_not_empty,
      highlight = {colors.purple,colors.line_bg,'bold'}
    }
  },
  {
    FileIcon = {
      provider = 'FileIcon',
      condition = condition.buffer_not_empty,
      highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.line_bg},
    },
  },
  {
    DiagnosticError = {
      provider = 'DiagnosticError',
      icon = '  ',
      highlight = {colors.red, colors.line_bg}
    }
  },
  {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = '  ',
      highlight = {colors.yellow, colors.line_bg},
    }
  },
  {
    DiagnosticHint = {
      provider = 'DiagnosticHint',
      icon = '  ',
      highlight = {colors.cyan, colors.line_bg},
    }
  },
  {
    DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      icon = '  ',
      highlight = {colors.blue, colors.line_bg},
    }
  },
  {
    VistaName = {
      provider = extension.vista_nearest,
      icon = ' ',
      highlight = {colors.blue,colors.line_bg},
    }
  },
}

gls.right = {
  {
    GitIcon = {
      provider = function() return '  ' end,
      condition = condition.check_git_workspace,
      separator = ' ',
      separator_highlight = {colors.line_bg, colors.line_bg},
      highlight = {colors.orange, colors.line_bg, 'bold'},
    }
  },
  {
    GitBranch = {
      provider = 'GitBranch',
      condition = false, condition.check_git_workspace,
      highlight = {colors.orange, colors.line_bg, 'bold'},
    }
  },
  {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = condition.hide_in_width,
      icon = '  ',
      separator = ' ',
      separator_highlight = {"NONE", colors.line_bg},
      highlight = {colors.green, colors.line_bg},
    }
  },
  {
    DiffModified = {
      provider = 'DiffModified',
      condition = condition.hide_in_width,
      icon = ' 柳',
      highlight = {colors.yellow, colors.line_bg},
    }
  },
  {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = condition.hide_in_width,
      icon = '  ',
      highlight = {colors.red, colors.line_bg},
    }
  },
  {
    LspStatus = {
      provider = function()
        local connected = not vim.tbl_isempty(vim.lsp.buf_get_clients(0))
        if connected then
          return ' ' .. u 'f076' .. ' '
          -- return ' ' .. u 'f817' .. ' '
        else
          return ''
        end
      end,
      highlight = {colors.cyan, colors.line_bg},
      separator = ' ',
      separator_highlight = {colors.blue, colors.line_bg},
    },
  },
  {
    LineInfo = {
      provider = 'LineColumn',
      highlight = {colors.gray,colors.line_bg},
    },
  },
}

gls.short_line_left = {
  {
    RainbowGray = {
      provider = function() return '▊ ' end,
      highlight = {colors.gray,colors.line_bg}
    },
  },
  {
    BufferType = {
      provider = "FileIcon",
      separator = " ",
      separator_highlight = {"NONE", colors.line_bg},
      highlight = {colors.blue, colors.line_bg, "bold"}
    }
  },
  {
    SFileName = {
      provider = function()
        for _, v in ipairs(gl.short_line_list) do
          if v == vim.bo.filetype then
            return ""
          end
        end
        return vim.fn.expand("%")
      end,

      condition = condition.buffer_not_empty,
      highlight = {colors.gray, colors.line_bg,'bold'}
    }
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.line_bg}
  }
}


local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<CR>"
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Extra Tree Sitter setup

local pc = require "nvim-treesitter.parsers".get_parser_configs()

pc.protobuf = {
  install_info = {
    url = "https://github.com/mitchellh/tree-sitter-proto", -- local path or git repo
    files = {"src/parser.c"},
    branch = "main",
  },
  filetype = "proto", -- if filetype does not agrees with parser name
  -- used_by = {"bar", "baz"} -- additional filetypes that use this parser
}

pc.hcl = {
  install_info = {
    url = "~/git/tree-sitter-hcl", -- local path or git repo
    files = {"src/parser.c", "src/scanner.cc"},
    branch = "main",
  },
  filetype = "hcl",
  used_by = {"tf"}
}
