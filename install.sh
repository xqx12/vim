#!/bin/bash

cp ~/.vim ~/.vim_bak

cp ~/.vimrc ~/.vimrc_bak

rm -rf ~/.vim ~/.vimrc

cp vimfiles  ~/.vim 

cp _vimrc  ~/.vimrc 
