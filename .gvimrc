set lines=999 columns=9999
set guifont=Monaco:h14

" disable bell
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

colorscheme vividchalk
highlight StatusLine guibg=darkred
highlight StatusLineNC guifg=purple
highlight Comment guifg=salmon
