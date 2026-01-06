local ts = require 'telescope'
local themes = require 'telescope.themes'
local actions = require 'telescope.actions'
local builtin = require 'telescope.builtin'
local leaderNmap = require 'utils'.leader_nmap
local batchMap = require 'utils'.batch_map

local global_keymaps = {
  ['<C-b>'] = actions.delete_buffer,
  ['<C-s>'] = actions.select_horizontal
}

local ts_mappings = {
  { '?',        builtin.oldfiles,                                 '[?] Find recently opened files' },
  { '<leader>', function() builtin.buffers(themes.get_ivy()) end, '[ ] Find existing buffers' },
  { '/', function()
    builtin.current_buffer_fuzzy_find(themes.get_dropdown {
      previewer = true,
      winblend = 10,
      layout_config = {
        prompt_position = "top",
      }
    })
  end, '[/] Fuzzily search in current buffer' },
  { 'sF', function() builtin.find_files { hidden = true, } end,                             '[s]earch All [F]iles (including hidden)' },
  { 'sf', builtin.find_files,                                                               '[s]earch [f]iles' },
  { 'sh', builtin.help_tags,                                                                '[s]earch [h]elp' },
  { 'sH', builtin.search_history,                                                           '[s]earch [H]istory' },
  { 'sg', builtin.live_grep,                                                                '[s]earch by [g]rep' },
  { 'sr', builtin.resume,                                                                   '[s]earch [r]esume' },
  { 'sR', builtin.registers,                                                                '[s]earch [R]egisters' },
  { 'sS', function() builtin.spell_suggest(themes.get_cursor { border = true }) end,        "[s]earch [S]pelling" },
  { 'sk', builtin.keymaps,                                                                  '[s]earch [k]eymaps' },
  { 'sw', builtin.grep_string,                                                              '[s]earch current [w]ord' },
  { 'C',  function() builtin.find_files(themes.get_ivy { cwd = "~/.config/nvim/lua" }) end, '[S]earch [C]onfiguration' }
}

local opts = {
  defaults = {
    winblend = 17,
    layout_strategy = 'horizontal',
    layout_config = {
      prompt_position = 'bottom',
    },
    mappings = {
      n = global_keymaps,
      i = global_keymaps,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  }
}

ts.setup(opts)
-- ts.load_extension 'fzf'


batchMap(ts_mappings, leaderNmap)
