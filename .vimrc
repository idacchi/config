set nu
syntax on

" - Ruby
" http://blog.livedoor.jp/sasata299/archives/51179057.html
autocmd FileType ruby :map <C-n> <ESC>:!ruby -cW %<CR>
autocmd FileType ruby :map <C-e> <ESC>:!ruby %<CR>

" - Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundleで管理するプラグインを書いていく
Bundle 'gmarik/vundle'
Bundle 'Shougo/neocomplcache'
Bundle "vim-ruby/vim-ruby"

filetype plugin indent on



""
"" neocomplcache & neosnippet
""
let g:neocomplcache_enable_at_startup = 1


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
