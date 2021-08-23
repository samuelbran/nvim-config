syntax enable
set cursorline
set background=dark
set termguicolors
set lazyredraw
set synmaxcol=300
set cindent
set number relativenumber
set hidden
set smarttab
set expandtab
set nowrap
set noswapfile
set nobackup
set nowritebackup
set noerrorbells
set incsearch
set smartcase
set wildmenu
set encoding=utf-8
set nofoldenable
set tabstop=2
set softtabstop=2
set shiftwidth=2
set signcolumn=yes
set colorcolumn=80
set numberwidth=4
set path+=**
set wildignore+=**/node_modules/**
set updatetime=300
set cmdheight=2
set shortmess+=c
set splitbelow
set splitright
set clipboard=unnamedplus
set noshowmode
set modifiable
let mapleader = " "
let g:vim_json_conceal=0

call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'airblade/vim-gitgutter'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'sainnhe/gruvbox-material'
  Plug 'moll/vim-bbye'
  Plug 'psliwka/vim-smoothie'
  Plug 'arcticicestudio/nord-vim'
  Plug 'jackguo380/vim-lsp-cxx-highlight'
  Plug 'vim-syntastic/syntastic'
  Plug 'digitaltoad/vim-pug'
  Plug 'ayu-theme/ayu-vim'
  Plug 'Jorengarenar/vim-darkness'
  Plug 'neoclide/jsonc.vim'
  " Plug 'tpope/vim-fugitive'
  " Plug 'rhysd/vim-clang-format'
  " Plug 'rainglow/vim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'rakr/vim-two-firewatch'
  " Plug 'tpope/vim-repeat'
  " Plug 'tpope/vim-fugitive'
  " Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline-themes'
  " Plug 'aserebryakov/vim-todo-lists'
call plug#end()

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Comment'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Colorscheme
" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_palette = 'material'
" colorscheme gruvbox-material
" let ayucolor="mirage"
colorscheme two-firewatch

" Airline
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
" let g:airline_left_sep=""
" let g:airline_right_sep=""

"FZF
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }

" Custom Colors
highlight ColorColumn guibg=#2E333B
highlight CursorLine guibg=#2E333B
highlight SignColumn guibg=#282C34
highlight LineNR guifg=#707A8E
highlight CursorLineNR gui=bold guifg=#D8DEE9
highlight VertSplit guifg=#2D333E

highlight GitGutterAdd guifg=#2ed285 guibg=#282C34
highlight GitGutterChange guifg=#fabd2f guibg=#282C34
highlight GitGutterDelete guifg=#fb4934 guibg=#282C34
highlight GitGutterChangeDelete guifg=#fe8019 guibg=#2E333B

" highlight CocFloating guifg=#CBCCC6 guibg=#242B38
highlight CocFloating guifg=#CBCCC6 guibg=#2E333B
highlight CocErrorSign guifg=#F28779 guibg=#282C34
highlight CocHintSign guifg=#458588 guibg=#282C34
highlight CocInfoSign guifg=#fabd2f guibg=#282C34
highlight CocWarningSign guifg=#fe8019 guibg=#2E333B
highlight CocExplorerNormalFloatBorder guifg=#A5AEBF guibg=#212733
highlight CocExplorerNormalFloat guibg=#212733
highlight CocExplorerSelectUI guibg=#2F3542
highlight CocExplorerFileDirectory guifg=#D8DEE9
highlight CocExplorerFileDirectoryExpanded guibg=#242B38
highlight CocExplorerGitContentChange guifg=#FFD580
highlight CocExplorerGitDeleted guifg=#fe8019
highlight CocExplorerGitUntracked guifg=#5ccfe6
highlight CocExplorerGitAdded guifg=#bae67e
" highlight Normal guibg=none
" highlight NonText guibg=none
set fillchars+=vert:\▏

nmap <space>E :CocCommand explorer --position left<CR>

" Use alt + hjkl to resize windows
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

nmap <space>e :Files<CR>
nnoremap <silent> <leader>f :Ag<CR>

nmap <leader>z za
imap jk <Esc>
imap jj <Esc>

command! C let @/=""

" Folds
set foldmethod=manual

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
