" set nu
syntax on
" 0 0x 0X はじまりの数値も10進数としてインクリメントできるように
set nrformats=

" コードを整形する
nnoremap <F2> gg=G :%s/\t/  /g<CR>
set tabstop=2
set shiftwidth=2

" 画面分割
nnoremap <F9> :sp <CR>
nnoremap <F10> :vs <CR>

" - Ruby
" http://blog.livedoor.jp/sasata299/archives/51179057.html
autocmd FileType ruby :map <C-n> <ESC>:!ruby -cW %<CR>
autocmd FileType ruby :map <C-e> <ESC>:!ruby %<CR>
autocmd FileType text :map <C-s> <ESC>:!make html %<CR>

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



""
"" neocomplcache & neosnippet
""
let g:neocomplcache_enable_at_startup = 1


"uniteの設定
""" unite.vim
" 入力モードで開始する
" let g:unite_enable_start_insert=1
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
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" 行末の空白文字を可視化
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

"statusline設定
set laststatus=2
set statusline=%y%<%t\ %m%r%h%w%=%{'['.(&fenc!=''?&fenc:&enc).'/'.&ff.']'}[%l/%L,%c]%V%6P


"colorscheme molokai

" Vimでesc押したら強制的に半角英数
" http://r7kamura.hatenablog.com/entry/20110217/1297910068


"##########################
"# backup http://blog.blueblack.net/item_147
"##########################
"savevers.vimを動作させるためパッチモードへ移行(savevers.vim)
"set patchmode=.clean
"バージョン管理ファイルを保存するディレクトリ
"let savevers_dirs = &backupdir
"パッチモードでバージョン管理する最大数(なぜか反映されず)
"let savevers_max = 10
":Purgeでカレントファイルの全てのバックアップを削除
"let savevers_purge = 0
"Diff表示の際にウィンドウをリサイズしない
"let versdiff_no_resize = 1
"<F5>でひとつ前のバックアップと比較
"nmap <silent> <F5> :VersDiff -<CR>
"<F6>でひとつ後のバックアップと比較
"nmap <silent> <F6> :VersDiff +<CR>
"<Leader>vqでVersDiffから抜ける
"nmap <silent> <Leader>vq :VersDiff -c<CR>


