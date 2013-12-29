" ------------------
" 基本設定
" ------------------

" スペース . で~/.vimrcを開く
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>

set nu
syntax on
" 0 0x 0X はじまりの数値も10進数としてインクリメントできるように
set nrformats=

" colorschemeの設定
set t_Co=256
set background=dark
colorscheme molokai

" コードを整形する
nnoremap <F2> gg=G :%s/\t/  /g<CR>
set tabstop=2
set shiftwidth=2

" 画面分割
nnoremap <F9> :sp <CR>
nnoremap <F10> :vs <CR>

" 行末の空白文字を可視化
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

"statusline設定
set laststatus=2
set statusline=%y%<%t\ %m%r%h%w%=%{'['.(&fenc!=''?&fenc:&enc).'/'.&ff.']'}[%l/%L,%c]%V%6P

" - Ruby
" http://blog.livedoor.jp/sasata299/archives/51179057.html
" Rubyの文法チェック
autocmd FileType ruby :map <C-n> <ESC>:!ruby -cW %<CR>
" C-eでファイルタイプに合わせて実行
autocmd FileType ruby :map <C-e> <ESC>:!ruby %<CR>
autocmd FileType python :map <C-e> <ESC>:!python %<CR>
autocmd FileType sh :map <C-e> <ESC>:!bash %<CR>

" - Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" --------------------------------------
" Vundleで管理するプラグインを書いていく
" --------------------------------------
Bundle 'gmarik/vundle'
Bundle 'Shougo/neocomplcache'
Bundle "vim-ruby/vim-ruby"
Bundle 'Shougo/unite.vim'
"
" コメントアウト Ctrl + _
Bundle 'tomtom/tcomment_vim'

filetype plugin indent on
"filetype plugin on
"filetype on


" rubocopでファイル保存時にチェック
Bundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_quiet_warnings = 0


""
"" neocomplcache & neosnippet
""
"let g:neocomplcache_enable_at_startup = 1
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


"uniteの設定
""" unite.vim
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>Unite file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
" au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
let g:unite_enable_split_vertically = 1
let g:unite_winwidth = 40
" ESCキーを2回押すと終了する
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

