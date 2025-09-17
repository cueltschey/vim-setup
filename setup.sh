#!/bin/bash

if [ $EUID -eq 0]; then
	echo "This script should not be run as root!"
	exit 0
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cat << EOF > ~/.vimrc
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf.vim'

Plug 'jremmen/vim-ripgrep'

call plug#end()

set number
set complete=.,w,b,u,t

nnoremap <Space><Space> :Files<CR>
nnoremap <Space>sg :Rg<Space>

nnoremap H :bprevious<CR>
nnoremap L :bnext<CR>

nnoremap <C-/> :terminal bash<CR>
tnoremap <C-/> <C-\><C-n>:bd!<CR>

set clipboard=unnamedplus


colorscheme habamax
EOF

echo "Install Complete"

