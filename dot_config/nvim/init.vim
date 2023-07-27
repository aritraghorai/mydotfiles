lua << EOF
require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.gitsigns"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.indentline"
require "user.alpha"
require "user.whichkey"
require "user.autocommands"
--require 'coc'
require 'user.battercolor'

EOF

set mouse=a



" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


"https://gist.github.com/zprhhs/9630dd6d666995236319afb35293a77b#file-init-vim-L197
" Use K to show documentation in preview window.
" nnoremap <silent> K :call ShowDocumentation()<CR>
" function! ShowDocumentation()
" if CocAction('hasProvider', 'hover')
" call CocActionAsync('doHover')
" else
" call feedkeys('K', 'in')
" endif
" endfunction
"
"
" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')


