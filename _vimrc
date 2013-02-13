set nu
"�J���[�X�L�[�}��ݒ�
"colorscheme molokai
colorscheme proton
"colorscheme pyte
set hlsearch
syntax on




" utf-8�D��ȈՔ�
"let &fileencodings=substitute(substitute(&fileencodings, ',\?utf-8', '', 'g'), 'cp932', 'utf-8,cp932', '')
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin
highlight zenkakuda ctermbg=7
call matchadd("zenkakuda", '\%u3000')

"set tabstop=2

"nrformats�I�v�V��������ɐݒ肷��
set nrformats=

" �}�����[�h�I������IME��Ԃ�ۑ����Ȃ�
"inoremap <silent> <ESC> <ESC>
"inoremap <silent> <C-[> <ESC>

"�@�u���{����͌Œ胂�[�h�v�؂�ւ��L�[
"inoremap <silent> <C-j> <C-^>

"set guifont=MS_Gothic:h14:cSHIFTJIS
set guifont=Osaka�|����:h12:cSHIFTJIS

""" unite.vim
" ���̓��[�h�ŊJ�n����
" let g:unite_enable_start_insert=1
" �o�b�t�@�ꗗ
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" �t�@�C���ꗗ
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ���W�X�^�ꗗ
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" �ŋߎg�p�����t�@�C���ꗗ
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" ��p�Z�b�g
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" �S���悹
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" �E�B���h�E�𕪊����ĊJ��
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" �E�B���h�E���c�ɕ������ĊJ��
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESC�L�[��2�񉟂��ƏI������
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" XML��ǂ݂��ނƂ��̐��`
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

set wrap
