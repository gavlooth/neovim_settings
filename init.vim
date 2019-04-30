"let g:python3_host_prog = '/usr/bin/python3.6'
set rtp+=~/.vim

call plug#begin('~/.vim/plugged')
"Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'vim-scripts/SpellChecker'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'justinmk/vim-sneak'
Plug 'haya14busa/incsearch.vim'
Plug 'tomtom/tcomment_vim'
Plug 'bling/vim-bufferline'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'Valloric/MatchTagAlways'
Plug 'vimlab/split-term.vim'
Plug 'lilydjwg/colorizer'
Plug 'roxma/vim-tmux-clipboard'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'lambdalisue/suda.vim'
Plug 'wakatime/vim-wakatime'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"ncm2

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
"Clojure
" Plug 'vim-scripts/paredit.vim'
" Plug 'tpope/vim-classpath'
Plug 'vim-syntastic/syntastic'
Plug 'aclaimant/syntastic-joker'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'luochen1990/rainbow'
Plug 'guns/vim-clojure-highlight'
Plug 'markwoodhall/vim-sayid'
Plug 'eraserhd/parinfer-rust', {'do':
      \  'cargo build --release'}

"Check
"Plug 'neomake/neomake'
"Plug 'SevereOverfl0w/clojure-check', {'do': './install'}
"Completion

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'clojure-vim/async-clj-omni'

"Themes
"Plug 'suan/vim-instant-markdown'
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-scripts/twilight'
Plug 'junegunn/seoul256.vim'
Plug 'mkarmona/colorsbox'
Plug 'joshdick/onedark.vim'
Plug 'jnurmine/Zenburn'
Plug 'romainl/Apprentice'
Plug 'jdsimcoe/abstract.vim'
Plug 'AlessandroYorba/Alduin'
Plug 'tlhr/anderson.vim'

"carp
Plug 'hellerve/carp-vim'


call plug#end()


"Set leader to spacebar
nnoremap <Space> <Nop>
nnoremap Q <Nop>
nnoremap s <Nop>
nnoremap S <Nop>


let mapleader= " "
let maplocalleader = ","  "optional local leader

set clipboard+=unnamedplus
"Vim sneak as vim easymotion
"let g:sneak#streak = 1
let g:sneak#label = 1
"Vim sneak one character sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T


"Max characters per line
set cc=80

"Font
" set guifont=Monaco:h18
set mouse=c
" Space Mono
" Many settings

set autochdir
set expandtab
set hidden
set notimeout
set noswapfile
set nowritebackup
set nowrap
set nofoldenable "disable folding
set lazyredraw
set expandtab           " Insert spaces when TAB is pressed.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set noshowmode
set modeline
set ruler "show the ruler line
set background=dark
set cursorline "show cursorline
set backspace=indent,eol,start
set laststatus=2
set clipboard=unnamedplus "default register is clipboard register
set wildmode=longest:full "cmdline full name on tba completion
set wildignorecase "make cmdline completion ignore case
set textwidth=0    " Hard-wrap long lines as you type them.

set scrolloff=8   "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5
set nocompatible


" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif


" More natural splits
    set splitbelow          " Horizontal split below current.
    set splitright          " Vertical split to right of current.

" Set hybrid togle line numbers
set number norelativenumber
"
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END



" Undo file
set undofile
set undodir=~/.vim/undo


"Enable completion

filetype plugin on
syntax enable

let g:deoplete#enable_at_startup = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#enable_smart_case = 1
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
let g:deoplete#complete_method='complete'

"Preview autocomplete
set completeopt-=preview

set completeopt=longest,menuone
"set formatoptions-=tc

"Resize splits
map + <C-w>>
map - <C-w><
map <leader>+ <C-w>+
map <leader>- <C-w>-

"Move throught splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>n <C-w>w

"parinfer

nnoremap ,, :ParinferToggleMode<CR>
nnoremap ,<leader> :ParinferOff<CR>

"Formt clj & cljs files
" command! Fmt  :w | silent !cljfmt  --edn=/home/heefoo/.config/nvim/cljfmt.edn  %

" autocmd BufWritePost *.clj* Fmt
" autocmd BufWritePost *.clj* e!
" autocmd BufWritePost *.edn Fmt
" autocmd BufWritePost *.edn e!

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif
"Format json
command! Fmjson  :%!jq .

let g:ctrlp_open_multiple_files = '1r'

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:base16_airline=1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
if !exists('g:airline_symbols')
 let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
 let g:airline_left_sep = ''
 let g:airline_left_alt_sep = ''
 let g:airline_right_sep = ''
 let g:airline_right_alt_sep = ''
 let g:airline_symbols.branch = ''
 let g:airline_symbols.readonly = ''
 let g:airline_symbols.linenr = ''

 " AirLine Theme
 let g:airline_theme = 'tender'
 let g:airline_left_sep='>'
 let g:airline_theme='badwolf'


"Set Colorschemes

let g:seoul256_background = 235

 colorscheme apprentice
" colorscheme zenburn
" colorscheme twilight
" colorscheme jellybeans
" colorscheme colorsbox-stnight
" colorscheme seoul256
" colorscheme abstract
" colorscheme anderson
" colorscheme zenburn

 highlight Cursor guifg=white guibg= steelblue
 highlight iCursor guifg=white guibg= #DECAB0
 highlight CursorLine  ctermbg=black  guibg=#2B1B17
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10


let g:rainbow_active = 1

let g:clojure_fuzzy_indent=1
let g:clojure_align_multiline_strings = 1


"Control-P
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
 \ 'dir':  '\v[\/]\.(git|hg|svn|cljs_rhino_repl|)$',
 \ 'file': '\v\.(exe|so|dll|sw.)$',
 \ 'link': 'some_bad_symbolic_links',
 \ }


map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)




set hlsearch
let g:incsearch#auto_nohlsearch = 1

" For regular expressions turn magic on
set magic


" nnoremap / /\v
" vnoremap / /\v
" cnoremap %s/ %smagic/
" cnoremap \>s/ \>smagic/
" nnoremap :g/ :g/\v
" nnoremap :g// :g//



cnoreabbrev Prl  %!perl -pi -e

cnoreabbrev Prl1  !perl -pi -e


"
" " Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
"
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"
" Use spaces instead of tabs
set expandtab
vmap ,x :!tidy -q -i --show-errors 0<CR>


" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

set ai "Auto indent

"Always show the status line
"set laststatus=2
" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set backupdir=~/.tmp/backup,.,/tmp,/tmp
set dir=~/.tmp/swap,.,/tmp,/tmp

augroup filetypedetect
 au BufRead,BufNewFile *.mustache set filetype=html
 au BufRead,BufNewFile *.dst set filetype=clojure
augroup END


"Source init.vim
map <Leader>rv  :source ~/.config/nvim/init.vim<CR>


" "Copy to clipboard
" map <localLeader>c :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>

"Fireplace binding

map  <leader>e :Eval<CR>
nmap <leader>c cq
nmap <leader>q cqq


command! Crepl :Piggieback! (do (require 'figwheel-sidecar.repl-api) (figwheel-sidecar.repl-api/cljs-repl))

command! WeaselRepl :Piggieback (weasel.repl.websocket/repl-env :ip "0.0.0.0" :port 9001)

command! Frepl :Piggieback (do (require 'figwheel-sidecar.repl-api) (figwheel-sidecar.repl-api/repl-env))

"Matchtags always filetypes
let g:mta_filetypes = {
 \ 'html' : 1,
 \ 'xhtml' : 1,
 \ 'xml' : 1,
 \ 'mustache' : 1,
 \ 'jinja' : 1,
 \}


"autocmd BufEnter * EnableStripWhitespaceOnSave


" autocmd FileType java let b:dispatch = 'javac %'


highlight ExtraWhitespace ctermbg=yellow

highlight OverLength ctermbg=red ctermfg=white guibg=#592929

match OverLength /\%81v.\+/


"Spell Checking
set spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline

" Markdown
let vim_markdown_preview_hotkey='<C-m>'

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    set shortmess+=c

    " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    inoremap <c-c> <ESC>

    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new
    " line.

"tab  completion
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })


"Paredit remaps
"map <leader>l  <leader>>
"map <leader>h  <leader><
"map <localLeader>w  <leader>w(
"map <localLeader>{  <leader>w{
"map <localLeader>"  <leader>w"
"map <localLeader>[  <leader>w[
"map <leader>s  <leader>S
"map <leader>o  <leader>O
"map <leader><leader>h  <leader><Up>
"map <leader><leader>l  <leader><Down>

"Paredit Vars
"let g:paredit_smartjump=1



"NERDTree
nnoremap <F4> :NERDTreeToggle<CR>

"Easier emmet vim
map <leader>, <C-y>,

"Open html files in chrome
nnoremap <F5> :update<Bar>silent !xdg-open %:p &<CR>

"Paste while in terminal with <C-R>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

"use escape to switch to normal mode in terminal
tnoremap <esc> <C-\><C-N>


nmap ,se yab<C-w>wpi<CR><esc><C-w>w
nmap ,te yap<C-w>wpi<CR><esc><C-w>w
nmap ,fe ggyG<C-w>wpi<CR><esc><C-w>w

"switching buffers
nnoremap ,n :bnext<CR>
nnoremap ,p :bprevious<CR>

"Colorizer
let g:colorizer_maxlines=1000


"Clojure check
let g:neomake_clojure_enabled_makers = ['check']

"Carp
"let g:syntastic_carp_checkers = ['carp']
"

set virtualedit=all


"User defined functions


"Show parinfer modes in airline
if (exists('g:parinfer_airline_integration') ? g:parinfer_airline_integration : 1)
  function! ParinferAirline(...)
    if &filetype =~ '.*\(clojure\|scheme\|lisp\|racket\|hy\).*'
      let w:airline_section_a = g:airline_section_a . ' %{g:parinfer_mode}'
    endif
  endfunction
  try
    call airline#add_statusline_func('ParinferAirline')
  catch
  endtry
endif


" Use local perl to handle substitution
" Invoke via :S/pattern/replace/flags
function s:Substitute(line1, line2, sstring)
  let l:lines=getline(a:line1, a:line2)
  " Call perl using utf8.  #line etc makes error messages prettier
  let l:sysresult=system("perl -e 'use utf8;' -e '#line 1 \"perl substitution\"' -pe ".
        \shellescape("s".escape(a:sstring,"%!").";"), l:lines)
  if v:shell_error
    echo l:sysresult
    return
  endif
  let l:result=split(l:sysresult, "\n", 1)  " 1: don't drop blank lines
  " delete lines but don't put in register:
  execute a:line1.",".a:line2." normal \"_dd"
  call append(a:line1-1, l:result)  " add lines
  call cursor(a:line1, 1)  " back to starting place
  if a:line1 == a:line2
    echom "Substitution on line" a:line1
  else
    echom "Substitution on lines" a:line1 "to" a:line2
  endif
endfunction


command -range=% -nargs=* S <line1>,<line2>!perl -p -e  <args>

command -range=% -nargs=* Sp execute "normal mp" | <line1>,<line2>!perl -p -e  <args> | execute 'normal `p'

command -range -nargs=1 S1 call s:Substitute(<line1>, <line2>, <q-args>)


nnoremap ,, :ParinferToggleMode<CR>
nnoremap ,<leader> :ParinferOff<CR>

"highlights

highlight g1 guibg='#3EA055'

highlight g2 guibg=#FFF380

highlight g3 guibg=#737CA1
"Completion (ncm2)

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
"Language servers
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'clojure': ['bash', '-c', 'clojure-lsp'],
    \ }

nnoremap g<F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gK :call LanguageClient#textDocument_rename()<CR>
"better white space


let g:better_whitespace_ctermcolor='green'
let g:better_whitespace_guicolor='green'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0





if executable('fzf')

"FZF line search
nnoremap <silent> <leader>r :Rg<cr>

"FZF search files
nnoremap <silent> <leader>f :FZF  --reverse <cr>

" FZF for open buffers
  nnoremap <silent> <leader>b :Buffers<cr>

" FZF for MRU
  nnoremap <silent> <leader>m :History<cr>

" Use fuzzy completion relative filepaths across directory
  imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

" Better command history with q:
  command! CmdHist call fzf#vim#command_history({'right': '40'})
  nnoremap q: :CmdHist<CR>

" Better search history
  command! QHist call fzf#vim#search_history({'right': '40'})
  nnoremap q/ :QHist<CR>

  command! -bang -nargs=* Ack call fzf#vim#ag(<q-args>, {'down': '40%', 'options': --no-color'})

 nmap ,<tab> <plug>(fzf-maps-n)


end




" if executable('sk')
"
" "SKIM line earch
" nnoremap <silent> <leader>r :Rg<cr>
"
" "SKIM searchfiles
" nnoremap <silent> <leader>f :SK -m<cr>
"
" " SKIM for open buffers
"   nnoremap <silent> <leader>b :Buffers<cr>
"
" " SKIM for MRU
"   nnoremap <silent> <leader>m :History<cr>
"
" " Use fuzzy completion relative filepaths across directory
"   imap <expr> <c-x><c-f> skim#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')
"
" " Better command history with q:
"   command! CmdHist call skim#vim#command_history({'right': '40'})
"   nnoremap q: :CmdHist<CR>
"
" " Better search history
"   command! QHist call skim#vim#search_history({'right': '40'})
"   nnoremap q/ :QHist<CR>
"
"   command! -bang -nargs=* Ack call skim#vim#ag(<q-args>, {'down': '40%', 'options': --no-color'})
"
"  nmap ,<tab> <plug>(skim-maps-n)
"
"
" end

"Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_clojure_checkers = ['joker']

"Clojure filetypes

autocmd BufNewFile,BufRead *.joke set syntax=clojure
