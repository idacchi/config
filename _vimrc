set nu
"カラースキーマを設定
"colorscheme molokai
colorscheme proton
"colorscheme pyte
set hlsearch
syntax on




" utf-8優先簡易版
"let &fileencodings=substitute(substitute(&fileencodings, ',\?utf-8', '', 'g'), 'cp932', 'utf-8,cp932', '')
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin
highlight zenkakuda ctermbg=7
call matchadd("zenkakuda", '\%u3000')

"set tabstop=2

"nrformatsオプションを空に設定する
set nrformats=

" 挿入モード終了時にIME状態を保存しない
"inoremap <silent> <ESC> <ESC>
"inoremap <silent> <C-[> <ESC>

"　「日本語入力固定モード」切り替えキー
"inoremap <silent> <C-j> <C-^>

"set guifont=MS_Gothic:h14:cSHIFTJIS
set guifont=Osaka－等幅:h12:cSHIFTJIS

""" unite.vim
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
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
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" XMLを読みこむときの整形
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

set wrap
