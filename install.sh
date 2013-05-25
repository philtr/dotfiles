#!/bin/sh

# Setup
if [[ -z $HOMEDIR ]]
then
  export HOMEDIR=$HOME
fi

if [[ -z $DOTS ]]
then
  export DOTS="$HOMEDIR/.dotfiles"
fi

if [[ ! -d $DOTS ]]
then
  echo "Cloning dotfiles"
  mkdir -p $DOTS
  git clone --recursive git@bitbucket.org:philtr/dotfiles.git "$DOTS"
fi


# First install Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOMEDIR/.zprezto"

# Link zsh configuration files
ln -s $DOTS/zsh/zlogin            $HOMEDIR/.zlogin
ln -s $DOTS/zsh/zlogout           $HOMEDIR/.zlogout
ln -s $DOTS/zsh/zpreztorc         $HOMEDIR/.zpreztorc
ln -s $DOTS/zsh/zprofile          $HOMEDIR/.zprofile
ln -s $DOTS/zsh/zshenv            $HOMEDIR/.zshenv
ln -s $DOTS/zsh/zshrc             $HOMEDIR/.zshrc

# Link git configuration files
ln -s $DOTS/git/gitconfig         $HOMEDIR/.gitconfig
ln -s $DOTS/git/gitignore         $HOMEDIR/.gitignore

# Link ruby configuration
mkdir -p $HOMEDIR/.bundle
ln -s $DOTS/ruby/bundler          $HOMEDIR/.bundle/config
ln -s $DOTS/ruby/gemrc            $HOMEDIR/.gemrc
ln -s $DOTS/ruby/pryrc            $HOMEDIR/.pryrc

# Link vim configuration
ln -s $DOTS/vim/settings/vimrc    $HOMEDIR/.vimrc
ln -s $DOTS/vim/setting/gvimrc    $HOMEDIR/.gvimrc

# Link pow configuration
ln -s $DOTS/pow/powconfig         $HOMEDIR/.powrc

# Link middleman configuration
ln -s $DOTS/middleman             $HOMEDIR/.middleman

# Print Manual Instructions
echo "Further Instructions:\n"

# iTerm2
echo "  * Set iTerm configuration to load config"
echo "    - Open iTerm preferences"
echo "    - Check \"Load preferences from a user-defined folder or URL\""
echo "    - Put in $HOMEDIR/.dotfiles/iterm2"

