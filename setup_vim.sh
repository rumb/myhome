#!/bin/bash

mkdir -p ~/.vim/swap
mkdir -p ~/.vim/backup

## install bandle
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
