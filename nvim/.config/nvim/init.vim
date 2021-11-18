let mapleader = "\<Space>"

" =============================================================================
"  PLUGINS
" =============================================================================
call plug#begin()

" UI
Plug 'itchyny/lightline.vim' " Statusline
Plug 'gcavallanti/vim-noscrollbar' " Statusline psudo-scrollbar

" Workspace
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" LSP/Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'nanotee/nvim-lsp-basics'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Language
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'rhysd/vim-clang-format'

" Debugging
Plug 'puremourning/vimspector'

call plug#end()

" Initialize and configure autocomplete
luafile ~/.config/nvim/lua/autocomplete.lua

" =============================================================================
"  STATUSLINE
" =============================================================================

" Customize statusline. Integrate vim-noscrollbar and combine
" file modified indicator into filename component
let g:lightline = {
    \   'colorscheme': 'darcula',
    \   'active': {
    \       'right': [
    \           [ 'lineinfo', 'scrollbar' ],
    \           [ 'percent' ],
    \           [ 'fileformat', 'fileencoding', 'filetype' ]
    \       ],
    \       'left':  [
    \           [ 'mode', 'paste'],
    \           [ 'readonly', 'filename' ]
    \       ],
    \   },
    \   'component_function': {
    \       'filename': 'LightlineFilename',
    \       'scrollbar': 'noscrollbar#statusline',
    \   }
    \}

" Function for combining modified indicator with filename
function! LightlineFilename()
	let filename = expand('%:F') !=# '' ? expand('%:F') : '[No Name]'
	let modified = &modified ? ' +' : ''
	return filename . modified
endfunction

" =============================================================================
"  SETTINGS
" =============================================================================

" This option allows showing effects of some commands incrementally
" as they are being typed, such as :substitute
if has('nvim')
	set inccommand=nosplit
end

" Merge signcolumn and linenumber if feature is available
" otherwise have it always available
if has("nvim-0.5.0") || has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
end

" Color
set termguicolors

" Improve Coc Error Popup readability
hi Pmenu guibg=#6466d

set background=dark
syntax on
set showcmd " Show partial command letters in status line
set shortmess+=I " Disable the default Vim startup message.
set number relativenumber " Show relative line numbers.
set softtabstop=4 shiftwidth=4 expandtab " Shorter tabstops please
set ignorecase smartcase incsearch " Smarter searching
set noerrorbells visualbell t_vb= " Disable audible bell
set mouse+=a " Enable mouse support.
set splitright splitbelow " Invert normal split behavior
set foldmethod=syntax foldlevelstart=99 " code folding
set completeopt=menu,menuone,noselect " Completion menu behavior

" Auto RustFmt
let g:rustfmt_autosave = 1

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'CodeLLDB' ]

" =============================================================================
"  MAPPINGS
" =============================================================================

" Unbind Ex mode
nmap Q <Nop> 

" Swap J and K to be more colemak friendly
noremap j k|noremap k j
noremap gj gk|noremap gk gj

" Copy to clipboard
xnoremap <silent> <leader>y <esc>:'<,'>:w !xclip -selection clipboard<CR>

" Quicksave
nmap <leader>w :w<CR>

" Centered search results
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Stop searching
nmap <C-h> :nohlsearch<CR>
vmap <C-h> :nohlsearch<CR>

" Open Files
map <C-p> :Files<CR>
map <leader>o :Buffers<CR>

" Debugging
nmap <leader>dl :call vimspector#Launch()<CR>
nmap <leader>dq :VimspectorReset<CR>

" Semantic Navigation
nmap gd :LspDefinition<CR>
nmap gt :LspTypeDefinition<CR>
nmap gi :LspImplemntation<CR>
nmap gr :LspIncomingCalls<CR>
nmap gs :LspDocumentSymbol<CR>
nmap gS :LspWorkspaceSymbol<CR>

nmap <leader>cr :LspRename<CR>
nmap <leader>ca :LspCodeAction<CR>

nmap <leader>sd :LspHover<CR>
nmap <leader>ss :LspSignatureHelp<CR>
