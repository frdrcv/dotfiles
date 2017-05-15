#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="oh-my-zsh config/termite aliasrc bashrc vim zshrc Xresources config/qutebrowser config/base16-shell config/buku_run config/cmus config/git gitconfig config/nvim config/ranger config/rofi-surfraw config/surfraw config/zathura config/i3 config/polybar config/rtv config/compton.conf mutt mpdconf tmux.conf fonts fehbg xinitrc antidote fzf newsbeuter weechat fzf.bash fzf.zsh shell_prompt.sh"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
