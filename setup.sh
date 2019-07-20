#!/bin/bash

[ $(pwd) = "$HOME/.dotfiles" ] || ln -sfn "$(pwd)" "$HOME/.dotfiles"

for file in home/*; do
dotfile="$(basename "$file")"
    case "${dotfile}" in
        Makefile|*.md|LICENSE|setup.sh)
            # NOOP
            ;;
        *)
            # link the file with a leading dot
            echo "ln -sf $(echo "$(pwd)/${file}" | sed "s:^$HOME:~:") ~/.${dotfile}"
            ln -sf "$(pwd)/${file}" "$HOME/.${dotfile}"
            ;;
    esac
done

# mac defaults
./macdefaults.sh

# vim stuff
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/swap
