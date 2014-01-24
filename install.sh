#!/bin/bash

cp -r ~/.vim ~/.vim_bak

cp ~/.vimrc ~/.vimrc_bak

rm -rf ~/.vim ~/.vimrc

cp -r vimfiles  ~/.vim 

cp _vimrc  ~/.vimrc 
