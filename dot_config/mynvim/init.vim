:set number
":set relativenumber
:set autoindent
:set backspace=2
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set noswapfile

"All Plugin Config
source $HOME/.config/nvim/aritra/plugin.vim
"All Plugin Confis


lua << EOF
-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF



" coc config
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-tsserver',
\ 'coc-eslint', 
\ 'coc-prettier', 
\ 'coc-json', 
\ 'coc-java',
\ 'coc-react-refactor',
\  'coc-vimlsp'
\ ]




set encoding=UTF-8


nnoremap <C-t> :NvimTreeToggle<CR>
nnoremap <C-T> :NERDTreeToggle<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

"colorscheme jellybeans
"colorscheme gruvbox
colorscheme github_dark
"set termguicolors     " enable true colors support
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme


let g:airline_theme='ayu'



"My KeyMaps
map <C-A> ggvG
map jk <Esc>

set clipboard=unnamed

" Don't backup orignal files
set nobackup
set nowritebackup

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Split windows
"imap <C-H> :split<CR>
nnoremap ,h :split<CR>
nnoremap ,v :vsplit<CR>

nnoremap ,t :VTerm<CR>

map <C-w>q :close<CR>



" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" to proper woek enter
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"






" Put the following lines in your configuration file to map <F12> to use Multiterm
nmap <F12> <Plug>(Multiterm)
nmap <C-`> <Plug>(Multiterm)
xmap <C-`> <Plug>(Multiterm)
" In terminal mode `count` is impossible to press, but you can still use <F12>
" to close the current floating terminal window without specifying its tag
tmap <F12> <Plug>(Multiterm)
tmap <C-`> <Plug>(Multiterm)
imap <C-`> <Plug>(Multiterm)
" If you want to toggle in insert mode and visual mode
imap <F12> <Plug>(Multiterm)
xmap <F12> <Plug>(Multiterm)



nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)



"Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


