#!/bin/bash

export KEEP_ZSHRC=yes 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
mkdir $HOME/.oh-my-zsh/custom/plugins

git clone https://github.com/Aloxaf/fzf-tab $ZSH_CUSTOM/plugins/fzf-tab
git clone https://github.com/chitoku-k/fzf-zsh-completions $ZSH_CUSTOM/plugins/fzf-zsh-completions

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
