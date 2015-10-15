#!/bin/bash

## config

INSTALL_PATH=~/

## config end

DIR=$(cd $(dirname $0) && pwd)

cp ${DIR}/.vimrc ${INSTALL_PATH}
cp -r ${DIR}/.vim ${INSTALL_PATH}

mkdir -p ${INSTALL_PATH}/.vim/backup
mkdir -p ${INSTALL_PATH}/.vim/swap

## install bandle
mkdir -p ${INSTALL_PATH}/.vim/bundle
cd ${INSTALL_PATH}/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ${INSTALL_PATH}/.vim/bundle/neobundle.vim
