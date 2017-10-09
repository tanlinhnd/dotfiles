#!/bin/bash
CURRENT_DATE=$(date +%s)
echo "> Begin install dotfiles..."

echo "> Backup if any"
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.$CURRENT_DATE
    echo "- Backup file .zshrc to .zshrc$CURRENT_DATE"
fi
if [ -f ~/.tmux.conf ]; then
    mv ~/.tmux.conf ~/.tmux.conf.$CURRENT_DATE
    echo "- Backup file .tmux.conf to .tmux.conf$CURRENT_DATE"
fi
if [ -d ~/.config/nvim ]; then
    mv ~/.config/nvim ~/.config/nvim.$CURRENT_DATE
    echo "- Backup folder .nvim to .nvim$CURRENT_DATE"
fi
if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.$CURRENT_DATE
    echo "- Backup file .vimrc to .vimrc$CURRENT_DATE"
fi
if [ -f ~/.vimrc.bundles ]; then
    mv ~/.vimrc.bundles ~/.vimrc.bundles.$CURRENT_DATE
    echo "- Backup file .vimrc.bundles to .vimrc.bundles$CURRENT_DATE"
fi

echo "> Use symlink to install dotfiles..."
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/vimrc.bundles ~/.vimrc.bundles
ln -s $(pwd)/tmux.conf ~/.tmux.conf
ln -s $(pwd)/zshrc ~/.zshrc
cp -r ./nvim ~/.config/
ln -s $(pwd)/vimrc ~/.config/nvim/init.vim

echo "> Done. Have fun!"
echo "P/s: Open file ~/.vimrc.bundles then run :PlugInstall after this. TY!"
