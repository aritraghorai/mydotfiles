call plug#begin()
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'preservim/nerdtree' "Nerd tree
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors

Plug 'preservim/tagbar' "Show all tag bar

Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)




Plug 'vimlab/split-term.vim'
Plug 'ayu-theme/ayu-vim' 
" Plug 'morhetz/gruvbox'
Plug 'projekt0n/github-nvim-theme'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'

Plug 'airblade/vim-gitgutter'


" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

if exists(':terminal')
    if has('nvim-0.4.0') || has('patch-8.2.191')
        Plug 'chengzeyi/multiterm.vim'
    endif
endif



call plug#end()


