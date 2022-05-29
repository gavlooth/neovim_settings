set rtp+=~/.vim

call plug#begin('~/.vim/plugged')

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction


function! Cc()
  let buffers = map(copy(getbufinfo()), 'v:val.bufnr')
  for bf in buffers
    let l:cnlog = bufname(bf)
    let matchs = matchstr(l:cnlog, ".*njure-log.*")
    if matchs == ''
    else
      let l:bufnr = bufnr('')
       execute 'noautocmd keepalt buffer' bf
       execute  'ColorHighlight'
       execute 'noautocmd keepalt buffer' l:bufnr
    endif
  endfor
endfunction


Plug 'quixotique/vim-delta'

" Plug 'vimwiki/vimwiki' , { 'branch': 'dev' }

Plug 'nvim-lua/plenary.nvim'
" Plug 'wlangstroth/vim-racket'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim'

Plug 'vim-syntastic/syntastic'
Plug 'aclaimant/syntastic-joker'
Plug 'rhysd/vim-grammarous'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'haya14busa/incsearch.vim'
Plug 'tomtom/tcomment_vim'
Plug 'bling/vim-bufferline'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'vimlab/split-term.vim'
" Plug 'chrisbra/Colorizer'
Plug 'powerman/vim-plugin-AnsiEsc'

" Plug 'Valloric/MatchTagAlways'
" Plug 'lilydjwg/colorizer'

Plug 'naegelejd/vim-swig'


Plug 'roxma/vim-tmux-clipboard'
Plug 'roxma/nvim-yarp'

Plug 'davidgranstrom/nvim-markdown-preview'
Plug 'lambdalisue/suda.vim'
Plug 'wakatime/vim-wakatime'

Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'airblade/vim-rooter'
Plug 'habamax/vim-asciidoctor'
Plug 'jiangmiao/auto-pairs'

Plug 'norcalli/nvim-terminal.lua'

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

" Plug 'rust-lang/rust.vim'

Plug 'pest-parser/pest.vim'

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'

Plug 'lervag/vimtex'
Plug 'Olical/conjure' , { 'branch': 'develop' }
Plug 'guns/vim-clojure-static'
Plug 'luochen1990/rainbow'
Plug 'guns/vim-clojure-highlight'
Plug 'eraserhd/parinfer-rust', {'do':
        \  'cargo build --release'}
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-scripts/twilight'

Plug 'vim-scripts/phd'
Plug 'junegunn/seoul256.vim'
Plug 'mkarmona/colorsbox'
Plug 'sheerun/vim-wombat-scheme'
Plug 'twerth/ir_black'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }



Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'
Plug 'jnurmine/Zenburn'
Plug 'romainl/Apprentice'
Plug 'jdsimcoe/abstract.vim'
Plug 'AlessandroYorba/Alduin'
Plug 'tlhr/anderson.vim'
Plug 'dylon/vim-antlr'




Plug 'hellerve/carp-vim'
"Haskell

Plug 'neovimhaskell/haskell-vim'
Plug 'owickstrom/neovim-ghci'

"Kotlin

Plug 'udalov/kotlin-vim'

Plug 'nvim-lua/popup.nvim'

"Rust
Plug 'simrat39/rust-tools.nvim'
Plug 'mfussenegger/nvim-dap'

"floating
Plug 'hood/popui.nvim'

"common lisp
Plug  'vlime/vlime', {'rtp': 'vim/'}

call plug#end()



" Markdown
let vim_markdown_preview_hotkey='<C-m>'

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    set shortmess+=c


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
set signcolumn=yes
set scrolloff=8   "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5
set nocompatible

set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
"
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500




set hlsearch
let g:incsearch#auto_nohlsearch = 1

autocmd FocusGained * checktime

" For regular expressions turn magic on
set magic


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
" set undofile
" set undodir=~/.vim/undo


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
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" nnoremap <leader>n <C-w>w

"parinfer




nnoremap <SPACE> <Nop>
nnoremap Q <Nop>
nnoremap s <Nop>
nnoremap S <Nop>


let mapleader=" "

let maplocalleader=" "

"Easier emmet vim
map <leader>, <C-y>,

"Open html files in chrome
nnoremap <F5> :update<Bar>silent !xdg-open %:p &<CR>

"Paste while in terminal with <C-R>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

"use escape to switch to normal mode in terminal
tnoremap <esc> <C-\><C-N>



nnoremap ,n :bnext<CR>
nnoremap ,p :bprevious<CR>

"Colorizer
let g:colorizer_maxlines=1000


"Clojure check
let g:neomake_clojure_enabled_makers = ['check']


set virtualedit=all


"User defined functions


"Show parinfer modes in airline
"
"

"
if (exists('g:parinfer_airline_integration') ? g:parinfer_airline_integration : 1)
  function! ParinferAirline(...)
    if &filetype =~ '.*\(clojure\|scheme\|lisp\|hy\).*'
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


function ParinferToggleMode()
  if  g:parinfer_mode  == "smart"
    let g:parinfer_mode = "indent"
  elseif  g:parinfer_mode  == "indent"
    let g:parinfer_mode = "insert"
  elseif  g:parinfer_mode  == "insert"
    let g:parinfer_mode = "off"
  else
    let g:parinfer_mode = "smart"
  endif
  echo "Mode is now : " g:parinfer_mode
endfunction


nnoremap ,<leader> :call ParinferToggleMode()<CR>

highlight g1 guibg='#3EA055'

highlight g2 guibg=#FFF380

highlight g3 guibg=#737CA1


set completeopt=noinsert,menuone,noselect



" Or map each action separately
"better white space

let g:better_whitespace_ctermcolor='green'
let g:better_whitespace_guicolor='green'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0



if executable('fzf')

"FZF line search
nnoremap <silent> ,r :Rg<cr>

"FZF search files
nnoremap <silent> ,f :FZF  --reverse <cr>

" FZF for open buffers
  nnoremap <silent> ,b :Buffers<cr>

" FZF for MRU
  nnoremap <silent> ,m :History<cr>

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


"Syntastic


 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*

 let g:syntastic_always_populate_loc_list = 0
 let g:syntastic_auto_loc_list = 0
 let g:syntastic_check_on_open = 1
 let g:syntastic_check_on_wq = 0


"  let g:syntastic_loc_list_height = 0

 let g:syntastic_clojure_checkers =['joker']

autocmd BufNewFile,BufRead *.joke set syntax=clojure


filetype plugin on

set completeopt=noinsert,menuone,noselect


inoremap <c-c> <ESC>

let g:conjure_log_direction = "horizontal"
let g:conjure_log_blacklist = ["up", "ret", "ret-multiline", "load-file",]


" command! Req :%ConjureEval
command! Sl :ConjureConnect 7888
command!  Cj execute "ConjureConnect" . system("cat " . FindRootDirectory() .  "/.nrepl-port")

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! Expand(exp) abort
    let l:result = expand(a:exp)
    return l:result ==# '' ? '' : "file://" . l:result
endfunction


" Transparent floating windows
set pumblend=10
hi PmenuSel blend=0



" asciidoctor
" let g:asciidoctor_executable = 'asciidoctor'
"
" let g:asciidoctor_extensions = ['asciidoctor-mathematical' ,'asciidoctor-diagram', 'asciidoctor-rouge']


"let g:conjure_config = {"log.hud.enabled?": v:false}`
let g:AutoPairsShortcutToggle = ',a'

augroup filetypedetect
 au BufRead,BufNewFile *.mustache set filetype=html
 au BufRead,BufNewFile *.dst set filetype=clojure
"  au BufRead,BufNewFile *.rkt set filetype=racket

 au BufRead,BufNewFile *.kts set filetype=kotlin
"  autocmd BufReadPost *.kts setlocal filetype=kotlin

" au Filetype clojure let g:AutoPairs = {}
au Filetype clojure let g:AutoPairs = {}
au Filetype lisp let g:AutoPairs = {}

function! GetNreplPort()

endfunction


if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif


 " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    set shortmess+=c

    " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    inoremap <c-c> <ESC>

    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new
    " line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

    " Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


    " enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect

highlight Comment ctermfg=green guifg=#905724


let g:colorizer_auto_color = 1
let g:colorizer_auto_filetype='clojure,css,html'
let g:colorizer_disable_bufleave = 1




map + <C-w>>
map - <C-w><

" colorscheme jellybeans
colorscheme zenburn
" colorscheme nord

" colorscheme tender
set expandtab
vmap ,x :!tidy -q -i --show-errors 0<CR>





command! Fmjson  :%!jq .

command! Today :r!echo $(date +\%A\%t\%m\%t\%Y)

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


" au User Ncm2Plugin call ncm2#register_source({
"         \ 'name' : 'css',
"         \ 'priority': 9,
"         \ 'subscope_enable': 1,
"         \ 'scope': ['css','scss'],
"         \ 'mark': 'css',
"         \ 'word_pattern': '[\w\-]+',
"         \ 'complete_pattern': ':\s*',
"         \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
"         \ })

cnoreabbrev Prl  %!perl -pi -e

cnoreabbrev Prl1  !perl -pi -e

set laststatus=0

command! Sh :ConjureShadowSelect app


" Required for operations modifying multiple buffers like rename.
set hidden

" Automatically start language servers.
let g:LanguageClient_autoStart = 1



 

dig l;         0955
" dig L;         0923
" dig e;         0949
" dig b;         0946
" dig g;         0947
" dig d;         0948
" dig y;         0951
" dig h;         0951
"
" dig 8;         0952
"
" dig h;         0942
" dig k;         0954
" dig m;         0956
" dig p;         0960
" dig r;         0961
" dig s;         0963
" dig t;         0964
" dig f;         0966
" dig q;         0968

nnoremap + :res +5<CR>
nnoremap - :res -5<CR>
let  g:AutoPairs= {'(':')', '[':']', '{':'}','"':'"',  '```':'```', '"""':'"""', "'''":"'''" }




let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }


highlight Conceal ctermfg=77

highlight SpellBad ctermfg=224   ctermbg='NONE' gui=underline guibg='NONE' guisp=Red

set conceallevel=0



lua << EOF
local coq = require "coq" -- add this

require'lspconfig'.clojure_lsp.setup{ coq.lsp_ensure_capabilities{} }
require'lspconfig'.texlab.setup{ coq.lsp_ensure_capabilities{} }
require'lspconfig'.pyright.setup{ coq.lsp_ensure_capabilities{} }
require'lspconfig'.ccls.setup{ coq.lsp_ensure_capabilities{} }
require'lspconfig'.rust_analyzer.setup{coq.lsp_ensure_capabilities{}}

EOF



lua << EOF
local nvim_lsp = require('lspconfig')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clojure_lsp' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
     coq.lsp_ensure_capabilities{} ,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

vim.cmd([[COQnow]])


EOF


lua << EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {"clojure", "lua", "rust",  "java",  "kotlin"}  ,

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {  },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {  },

    additional_vim_regex_highlighting = false,
  },
}
EOF

" let  g:conjure#client#racket#stdio#command = "racket -I axe"


let g:vimtex_view_method = 'zathura'

let g:syntastic_tex_checkers = ['lacheck']

lua <<EOF
require('telescope').setup {
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')

 -- these are all the default values


EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>



autocmd BufNewFile,BufRead *.rkt let g:conjure#log#hud#enabled = v:false

autocmd BufNewFile,BufRead *.rkt let g:conjure#log#trim#to = 100

let g:conjure#log#jump_to_latest#enabled = v:true



augroup ConjureLog
  au! BufRead,BufNewFile,BufEnter conjure-log-*.* exe "resize " . (winheight(0) * 3/7)
augroup END


for i in range(65,90)
        let c= nr2char(i)
        execute 'inoremap    ,,' . c . ' ' .  '<c-k>'  . '*' .  c  . ' '
        execute 'inoremap    ,,' . tolower(c)  . ' ' .  '<c-k>'  . '*' .  tolower(c)   . ' '
endfor


let g:conjure#log#trim#to = 500
let g:conjure#log#trim#at = 100


let g:vimwiki_list = [{'path': '~/.local/share/vimwiki/'}]

 " 🐓 Coq completion settings
"
 " Set recommended to false
 let g:coq_settings = { "keymap.recommended": v:false }

 " Keybindings
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"



" sbcl --eval '(load #P"~/.quicklisp/setup.lisp")' --eval '(ql:quickload :swank)'  --eval '(swank:create-server :dont-close t)'

lua <<EOF
require('rust-tools').setup({})
EOF

let g:conjure#filetypes = ['clojure', 'fennel', 'janet', 'hy', 'racket', 'scheme', 'lua']





augroup LocalVlimeKeys
    autocmd!
     autocmd FileType lisp nnoremap <silent> <buffer> <Leader>ee
         \ :call vlime#plugin#SendToREPL(vlime#ui#CurExprOrAtom())<cr>
    
augroup end


        let g:vlime_window_settings = {
                \ "sldb": {
                    \ "pos": "botright",
                    \ "size": 15,
                    \ "vertical": v:true
                \ },
                \ "server": {  "size" : 10 },
                \ "repl" : { -> {"pos": "belowright", "size": winheight(".") / 5}} ,
                \ }



        "sldb"      The debugger window.
        "repl"      The REPL window.
        "inspector" The inspector window.
        "xref"      The cross reference window.
        "notes"     The compiler notes window.
        "threads"   The threads window.
        "preview"   The preview window.
        "arglist"   The arglist window.
        "input"     The input buffer window.
        "server"    The server output window.
        "trace"     The trace dialog window.
        "mrepl"     The MREPL window.

" g:vlime_window_settings                      *g:vlime_window_settings*
"     A |dict| to specify window positions and sizes. Vlime will consult
"     this variable when creating a new window. The keys should be
"     Vlime window types, and the values should be |dict|s containing
"     "pos", "size", and "vertical" parameters. For example:


    " These settings will cause the debugger window to be created
    " on the right, vertically.
    "
    " You can also replace the window parameters dict with a |Funcref|
    " or a |lambda| expression to generate the parameters dynamically:
    "
    "     let g:vlime_window_settings = {
    "             \ "sldb": { -> {"pos": "belowright", "size": winheight(".") / 3}}
    "         \ }
    "
    " With this setting, the debugger window will be one third of the
    " current window size.
    "
    "                                               *vlime-window-types*
    " Available window types:

        "sldb"      The debugger window.
        "repl"      The REPL window.
        "inspector" The inspector window.
        "xref"      The cross reference window.
        "notes"     The compiler notes window.
        "threads"   The threads window.
        "preview"   The preview window.
        "arglist"   The arglist window.
        "input"     The input buffer window.
        "server"    The server output window.
        "trace"     The trace dialog window.
        "mrepl"     The MREPL window.

    " Legal values for the parameters:
    "
    "     "pos":
    "         "aboveleft", "belowright", "topleft", "botright".
    "         (See |aboveleft| and the alike to get explanations of
    "         these positions)
    "     "size":
    "         Any positive integer, or v:null to tell Vlime not to
    "         resize the window.
    "     "vertical":
    "         v:true or v:false.



" nnoremap <C-h> <C-w>h

" 4.3.1 CL Source File Mappings                  *vlime-mappings-source*
"
" Key mappings available in lisp source files:
"
"     Connection Management                        *vlime-mappings-conn*
"         <LocalLeader>cc                       *vlime-mappings-conn-cc*
"             Connect to Vlime server.
"         <LocalLeader>cs                       *vlime-mappings-conn-cs*
"             Switch Vlime connections. This command shows a list of
"             connections, and the current connection will be marked
"             with an asterisk "*" at the end.
"         <LocalLeader>cd
"             Disconnect.
"         <LocalLeader>cR
"             Rename the current connection.
"
"     Server Management                   *vlime-mappings-invoke-server*
"         <LocalLeader>rr              *vlime-mappings-invoke-server-rr*
"             Run a new Vlime server and connect to it. To customize the
"             server, see |g:vlime_cl_impl|.
"         <LocalLeader>rv
"             View the console output of the current server.
"         <LocalLeader>rV
"             Show a list of Vlime servers and view the console output of the chosen one.
"         <LocalLeader>rs              *vlime-mappings-invoke-server-rs*
"             Stop the current server.
"         <LocalLeader>rS
"             Show a list of Vlime servers and stop the chosen one.
"         <LocalLeader>rR
"             Rename a server.
"
"     Sending Stuff To The REPL                    *vlime-mappings-send*
"         <LocalLeader>ss                       *vlime-mappings-send-ss*
"             If there's an s-expression under the cursor, send it to
"             the REPL, else send the atom under the cursor, if any.
"         <LocalLeader>se
"             Send the s-expression under the cursor to the REPL.
"         <LocalLeader>st
"             Send the top-level s-expression under the cursor to the
"             REPL.
"         <LocalLeader>sa
"             Send the atom under the cursor to the REPL.
"         <LocalLeader>si
"             Open an input buffer and compose a snippet to send to the
"             REPL. See |vlime-input-buffer|.
"         <LocalLeader>s
"             (In visual mode) Send the current selection to the REPL.
"
"     Expanding Macros                    *vlime-mappings-expand-macros*
"         <LocalLeader>mm
"             Expand the macro under the cursor.
"         <LocalLeader>m1
"             Expand the macro under the cursor once.
"         <LocalLeader>ma
"             Expand the macro under the cursor and all nested macros.
"
"     Compiling                                 *vlime-mappings-compile*
"         <LocalLeader>oe
"             Compile the form under the cursor.
"         <LocalLeader>ot
"             Compile the top-level form under the cursor.
"         <LocalLeader>of
"             Compile the current file.
"         <LocalLeader>o
"             (In visual mode) Compile the current selection.
"
"     Cross References (xref)               *vlime-mappings-invoke-xref*
"         <LocalLeader>xc                *vlime-mappings-invoke-xref-xc*
"             Show callers of the function under the cursor.
"         <LocalLeader>xC
"             Show callees of the function under the cursor.
"         <LocalLeader>xr
"             Show references of the variable under the cursor.
"         <LocalLeader>xb
"             Show bindings of the variable under the cursor.
"         <LocalLeader>xs
"             Show who sets the value of the variable under the cursor.
"         <LocalLeader>xe
"             Show who expands the macro under the cursor.
"         <LocalLeader>xm
"             Show specialized methods for the class under the cursor.
"         <LocalLeader>xd
"             Show the definition for the name under the cursor.
"         <LocalLeader>xi
"             Interactively prompt for the symbol to search. A menu will
"             pop up, to let you choose from xref types. You can prepend
"             a count to skip this menu, e.g. "8<LocalLeader>xi" would
"             look for definitions. See |vlime-input-buffer|.
"
"     Describing Things                        *vlime-mappings-describe*
"         <LocalLeader>do
"             Describe the "operator" of the s-expression under the
"             cursor.
"         <LocalLeader>da
"             Describe the atom under the cursor.
"         <LocalLeader>di
"             Prompt for the symbol to describe. See
"             |vlime-input-buffer|.
"         <LocalLeader>ds
"             Apropos search. An input buffer would pop up, prompting
"             for the search pattern. See |vlime-input-buffer|.
"         <LocalLeader>ddo
"             Show the documentation for the "operator" of the
"             s-expression under the cursor.
"         <LocalLeader>dda
"             Show the documentation for the atom under the cursor.
"         <LocalLeader>ddi
"             Show the documentation for the symbol entered in an input
"             buffer. See |vlime-input-buffer|.
"         <LocalLeader>dr
"             Show the arglist for the s-expression under the cursor.
"
"     Undefining Things
"         <LocalLeader>uf
"             Undefine the function under the cursor.
"         <LocalLeader>us
"             Unintern the symbol under the cursor.
"         <LocalLeader>ui
"             Interactively prompt for the function/symbol to
"             undefine/unintern. A menu will pop up, to let you choose
"             what to do. You can prepend a count to skip this menu,
"             e.g. "2<LocalLeader>ui" would unintern a symbol. See
"             |vlime-input-buffer|.
"
"     Inspection                       *vlime-mappings-invoke-inspector*
"         <LocalLeader>II           *vlime-mappings-invoke-inspector-II*
"             If there's an s-expression under the cursor, evaluate it,
"             else evaluate the atom under the cursor, if any. The
"             evaluation result is then shown in the inspector.
"         <LocalLeader>Ii
"             Same as <LocalLeader>II
"         <LocalLeader>IE
"             Evaluate and inspect the s-expression under the cursor.
"         <LocalLeader>Ie
"             Same as <LocalLeader>IE
"         <LocalLeader>IT
"             Evaluate and inspect the top-level s-expression under the
"             cursor.
"         <LocalLeader>It
"             Same as <LocalLeader>It
"         <LocalLeader>IA
"             Evaluate and inspect the atom under the cursor.
"         <LocalLeader>Ia
"             Same as <LocalLeader>IA
"         <LocalLeader>IN
"             Prompt for the expression to inspect. See
"             |vlime-input-buffer|.
"         <LocalLeader>In
"             Same as <LocalLeader>IN
"         <LocalLeader>I
"             (In visual mode) Evaluate and inspect the current
"             selection.
"
"     Invoking The Trace Dialog     *vlime-mappings-invoke-trace-dialog*
"         <LocalLeader>TD        *vlime-mappings-invoke-trace-dialog-TD*
"             Show the trace dialog.
"         <LocalLeader>Td
"             Same as <LocalLeader>TD
"         <LocalLeader>TT
"             Toggle the traced state of the function name under the
"             cursor.
"         <LocalLeader>Tt
"             Same as <LocalLeader>TT
"         <LocalLeader>TI
"             Show an input buffer, and prompt for the name of the
"             function to be traced. See |vlime-input-buffer|. You can
"             also trace setf expanders by specifying "(setf <name>)".
"         <LocalLeader>Ti
"             Same as <LocalLeader>TI
"
"     Closing Windows                      *vlime-mappings-close-window*
"         <LocalLeader>wp
"             Close all visible preview windows.
"         <LocalLeader>wr
"             Close all visible arglist windows.
"         <LocalLeader>wn
"             Close all visible compiler notes windows.
"         <LocalLeader>wR
"             Close all visible REPL windows.
"         <LocalLeader>wA
"             Close all Vlime windows.
"         <LocalLeader>wl
"             Show a list of visible Vlime windows, and choose which to
"             close.
"
"     Other Stuff                                  *vlime-mappings-misc*
"         <LocalLeader>i                         *vlime-mappings-misc-i*
"             Interaction Mode. See |vlime-interaction-mode|.
"         <LocalLeader>l
"             Load the current file.
"         <LocalLeader>a
"             Disassemble the form under the cursor.
"         <LocalLeader>p                         *vlime-mappings-misc-p*
"             Specify the package for the current buffer. An input
"             buffer would pop up for this. See |vlime-input-buffer|.
"         <LocalLeader>b
"             Set a breakpoint at entry to a function. An input buffer
"             would pop up, prompting for the function name. See
"             |vlime-input-buffer|.
"         <LocalLeader>t                         *vlime-mappings-misc-t*
"             Show a list of the running threads. See
"             |vlime-thread-list|.
"
" ......................................................................
" 4.3.2 REPL Buffer Mappings                       *vlime-mappings-repl*
"
" Key mappings avaialble in the REPL buffer:
"
"     CTRL-c
"         Interrupt the REPL thread.
"     <LocalLeader>ls
"         Inspect the evaluation result under the cursor.
"     <LocalLeader>y                             *vlime-mappings-repl-y*
"         Yank the evaluation result under the cursor into the default
"         register |quotequote|. Note that this yanked value is an
"         expression to be evaluated in the same REPL session. It is
"         meaningless in other contexts.
"     <LocalLeader>C
"         Clear the REPL buffer.
"     <Tab>
"         Move the cursor to the next prensented object.
"     CTRL-n
"         Same as <Tab>.
"     CTRL-p
"         Move the cursor to the previous presented object.
"
" ......................................................................
" 4.3.3 Debugger Mappings                      *vlime-mappings-debugger*
"
" Key mappings available in the debugger:
"
"     <CR>
"         Choose a restart.
"     d
"         Show the details (local variables and source location etc.)
"         of the frame under the cursor.
"     S
"         Jump to the source code for the frame under the cursor. If the
"         source file is already opened in a window, simply move the
"         cursor to that window. Otherwise, this command opens the
"         source file in the current window by default. A count can be
"         prepended to specify which window to use. For example, "2S"
"         would open the source file in the second visible window.
"     T
"         Like "S", but open the source file in a new tab, if it's not
"         yet opened in any window. To always create a new tab, prepend
"         an arbitrary count, such as "1T".
"     r
"         Restart the frame under the cursor.
"     s
"         Start stepping in the frame under the cursor.
"     x
"         Step over the current function call.
"     o
"         Step out of the current function.
"     c
"         Invoke the restart labeled CONTINUE.
"     a
"         Invoke the restart labeled ABORT.
"     C
"         Inspect the current condition object.
"     i                                      *vlime-mappings-debugger-i*
"         Evaluate and inspect an expression in the frame under the
"         cursor. An input buffer would pop up, prompting for the
"         expression. See |vlime-input-buffer|.
"     e
"         Evaluate an expression in the frame under the cursor. An input
"         buffer would pop up, prompting for the expression. See
"         |vlime-input-buffer|.
"     E
"         Evaluate an expression in the frame under the cursor, and then
"         send the result to the REPL, so that you can yank the value
"         with |vlime-mappings-repl-y| and further manipulate it. An
"         input buffer would pop up, prompting for the expression. See
"         |vlime-input-buffer|.
"     D
"         Disassemble the frame under the cursor.
"     R
"         Return a manually specified result from the frame under the
"         cursor. An input buffer would pop up, prompting for the
"         expression that would generate the result. See
"         |vlime-input-buffer|.
"
" ......................................................................
" 4.3.4 Inspector Mappings                    *vlime-mappings-inspector*
"
" Key mappings avaialble in the inspector:
"
"     <CR>
"         Activate the interactable field/button under the cursor.
"     <Space>
"         Same as <CR>
"     s
"         Send the value of the field under the cursor to the REPL.
"     S
"         Send the value being inspected to the REPL.
"     <Tab>
"         Select the next interactable field/button.
"     CTRL-n
"         Same as <Tab>
"     CTRL-p
"         Select the previous interactable field/button.
"     p
"         Return to the previous inspected object.
"     P
"         Move to the next inspected object.
"     R
"         Refresh the inspector.
"
" ......................................................................
" 4.3.5 XRef List & Compiler Notes Mappings
"                                                  *vlime-mappings-xref*
"                                        *vlime-mappings-compiler-notes*
"
" Key mappings avaialble in the cross reference list and the compiler
" notes window:
"
"     <CR>
"         Jump to the selected source location. If the source file is
"         already opened, simply move the cursor to the window
"         containing that file. Otherwise, open the source file in the
"         window where the xref command was initiated. A count can be
"         prepended to specify which window to use. For example, "2<CR>"
"         would show the source file in the second visible window.
"     t
"         Like <CR>, but open the source file in a new tab, if it's not
"         yet opened in any window. To always create a new tab, prepend
"         an arbitrary count, such as "1t".
"     s
"         Open the selected source location in a horizontal split
"         window. A count can be prepended to specify which window to
"         split.
"     S
"         Like "s", but open a vertical split window.
"
" ......................................................................
" 4.3.6 Thread List Mappings                *vlime-mappings-thread-list*
"
" Key mappings avaialble in the thread list:
"
"     CTRL-c
"         Interrupt the thread under the cursor. The debugger will be
"         activated.
"     K
"         Kill the thread under the cursor.
"     D
"         Invoke the debugger in the thread under the cursor.
"     r
"         Refresh the thread list.
"
" ......................................................................
" 4.3.7 Server Output Buffer Mappings            *vlime-mappings-server*
"
" Key mappings avaialble in the server output buffer:
"
"     <LocalLeader>c                           *vlime-mappings-server-c*
"         Connect to this server.
"     <LocalLeader>s
"         Stop this server.
"
" ......................................................................
" 4.3.8 Input Buffer Mappings                     *vlime-mappings-input*
"
" Key mappings avaialble in the input buffer:
"
"     CTRL-p or Shift-Tab
"         Show the previous item in input history.
"     CTRL-n or Tab
"         Show the next item in input history.
"
" ......................................................................
" 4.3.9 Trace Dialog Mappings              *vlime-mappings-trace-dialog*
"
" Key mappings avaialble in the trace dialog:
"
"     <CR>
"         Activate the interactable field/button under the cursor.
"     <Space>
"         Same as <CR>.
"     s
"         Send the value of the field under the cursor to the REPL.
"     i
"         Inspect the value of the field under the cursor.
"     <Tab>
"         Select the next interactable field/button.
"     CTRL-n
"         Same as <Tab>.
"     CTRL-p
"         Select the previous interactable field/button.
"     R
"         Refresh the trace dialog.
"
" ......................................................................
" 4.3.10 MREPL Buffer Mappings                    *vlime-mappings-mrepl*
"
" Key mappings avaialble in the MREPL buffer:
"
"     <CR>
"         (In insert mode) Submit the text snippet between the last
"         prompt and EOF to the REPL.
"     CTRL-j
"         (In insert mode) Insert a newline.
"     <Tab>
"         (In insert mode) Trigger omni-completion.
"     CTRL-c
"         (In insert mode) Interrupt the MREPL thread.
"     <LocalLeader>C
"         Clear the MREPL buffer.
"     <LocalLeader>D
"         Disconnect from this REPL.
"
" ----------------------------------------------------------------------
"
"

highlight clear SpellBad
highlight SpellBad ctermfg=009 ctermbg=011 guifg=#ff0000 guibg=#ffff00
