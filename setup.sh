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

colorscheme habamax
EOF

echo "Install Complete"

