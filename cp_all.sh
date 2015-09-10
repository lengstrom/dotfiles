#!/bin/bash
for i in ~/.zshrc ~/.vimrc ~/.emacs.d
do
    cp -r $i .
done
