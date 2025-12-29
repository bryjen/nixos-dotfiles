return {
  'Civitasv/cmake-tools.nvim',
  opts = {},
  config = function()
    local osys = require 'cmake-tools.osys'
    local config_dir = vim.fn.stdpath 'config'
    local cmake_kits_file_path = config_dir .. '/cmake/cmake_kits.json'

    vim.cmd 'cabbrev cmor CMakeOpenRunner'
    vim.cmd 'cabbrev cmcr CMakeCloseRunner'
    vim.cmd 'cabbrev cmoe CMakeOpenExecutor'
    vim.cmd 'cabbrev cmce CMakeCloseExecutor'

    vim.cmd 'cabbrev cmg CMakeGenerate'
    vim.cmd 'cabbrev cmb CMakeBuild'
    vim.cmd 'cabbrev cmr CMakeRun'

    vim.keymap.set('n', '<leader>co', ':CMakeOpenRunner<CR>', { silent = true })
    vim.keymap.set('n', '<leader>cp', ':CMakeCloseRunner<CR>', { silent = true })

    require('cmake-tools').setup {
      cmake_command = 'cmake',
      ctest_command = 'ctest',
      cmake_use_preset = true,
      cmake_regenerate_on_save = true,
      cmake_generate_options = {
        '-DCMAKE_EXPORT_COMPILE_COMMANDS=ON',
      },
      cmake_build_options = {},

      cmake_build_directory = function()
        if osys.iswin32 then
          return 'out\\${variant:buildType}'
        end
        return 'out/${variant:buildType}'
      end,
      -- cmake_soft_link_compile_commands = true,
      -- cmake_compile_commands_from_lsp = false,
      cmake_kits_path = nil,
      cmake_variants_message = {
        short = { show = true },
        long = { show = true, max_length = 40 },
      },

      cmake_dap_configuration = {
        name = 'cpp',
        type = 'codelldb',
        request = 'launch',
        stopOnEntry = false,
        runInTerminal = true,
        console = 'integratedTerminal',
      },
      cmake_executor = {
        name = 'quickfix',
        opts = {},
        default_opts = {
          quickfix = {
            show = 'always',
            position = 'belowright',
            size = 10,
            encoding = 'utf-8',
            auto_close_when_success = true,
          },
          toggleterm = {
            direction = 'float',
            close_on_exit = false,
            auto_scroll = true,
            singleton = true,
            start_in_insert = false, -- This is key
            on_open = function(term)
              -- Ensure we're in normal mode for navigation
              vim.cmd 'stopinsert'
              vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
            end,
          },
          overseer = {
            new_task_opts = {
              strategy = {
                'toggleterm',
                open_on_start = true,
                focus = false,
                quit_on_exit = 'never',
                start_insert = false, -- Don't start in insert mode
              },
            },
            on_new_task = function(task)
              require('overseer').open { enter = false }

              -- Force normal mode after task starts
              vim.schedule(function()
                local wins = vim.api.nvim_list_wins()
                for _, win in ipairs(wins) do
                  local buf = vim.api.nvim_win_get_buf(win)
                  if vim.bo[buf].buftype == 'terminal' then
                    vim.api.nvim_set_current_win(win)
                    vim.cmd 'stopinsert'
                    break
                  end
                end
              end)
            end,
          },
          terminal = {
            name = 'Main Terminal',
            prefix_name = '[CMakeTools]: ',
            split_direction = 'horizontal',
            split_size = 11,
            single_terminal_per_instance = true,
            single_terminal_per_tab = true,
            keep_terminal_static_location = true,
            auto_resize = true,
            start_insert = false,
            focus = false,
            do_not_add_newline = false,
          },
        },
      },
      cmake_runner = {
        name = 'toggleterm',
        opts = {},
        default_opts = {
          quickfix = {
            show = 'always',
            position = 'belowright',
            size = 10,
            encoding = 'utf-8',
            auto_close_when_success = true,
          },
          toggleterm = {
            direction = 'float',
            close_on_exit = false,
            auto_scroll = true,
            singleton = true,
          },
          overseer = {
            new_task_opts = {
              strategy = {
                'toggleterm',
                direction = 'horizontal',
                autos_croll = true,
                quit_on_exit = 'success',
              },
            },
            on_new_task = function(task) end,
          },
          terminal = {
            name = 'Main Terminal',
            prefix_name = '[CMakeTools]: ',
            split_direction = 'horizontal',
            split_size = 11,
            single_terminal_per_instance = true,
            single_terminal_per_tab = true,
            keep_terminal_static_location = true,
            auto_resize = true,
            start_insert = false,
            focus = false,
            do_not_add_newline = false,
          },
        },
      },
      cmake_notifications = {
        runner = { enabled = true },
        executor = { enabled = true },
        spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
        refresh_rate_ms = 100,
      },
      cmake_virtual_text_support = true,
      cmake_use_scratch_buffer = false,
    }
  end,
}
