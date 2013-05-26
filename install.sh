#!/bin/sh

echo '
                  _      _
      |          | | o  | |
    __|   __ _|_ | |    | |  _   ,
   /  |  /  \_|  |/  |  |/  |/  / \_
   \_/|_/\__/ |_/|__/|_/|__/|__/ \/
                 |\  P H I L T R
                 |/

Setting up dotfiles. If the ~/.dotfiles folder does not exist,
it will be cloned down from http://git.spt.la/dotfiles. These
dotfiles use ZShell and the Prezto framework, so if either of
those are not yet set up properly, they will be configured
at this time.
'

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
  echo "Cloning dotfiles.."
  mkdir -p $DOTS
  git clone --recursive git@bitbucket.org:philtr/dotfiles.git "$DOTS"
fi


# First install Prezto
if [[ ! -d $HOMEDIR/.zprezto ]]
then
  echo "Installing Prezto (https://github.com/sorin-ionescu/prezto)..."
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOMEDIR/.zprezto"
fi

# Link zsh configuration files
echo "Linking ZSH configuration files..."
ln -s $DOTS/zsh/zlogin            $HOMEDIR/.zlogin
ln -s $DOTS/zsh/zlogout           $HOMEDIR/.zlogout
ln -s $DOTS/zsh/zpreztorc         $HOMEDIR/.zpreztorc
ln -s $DOTS/zsh/zprofile          $HOMEDIR/.zprofile
ln -s $DOTS/zsh/zshenv            $HOMEDIR/.zshenv
ln -s $DOTS/zsh/zshrc             $HOMEDIR/.zshrc

# Link git configuration files
echo "Linking Git configuration files..."
ln -s $DOTS/git/gitconfig         $HOMEDIR/.gitconfig
ln -s $DOTS/git/gitignore         $HOMEDIR/.gitignore

# Link ruby configuration
echo "Linking Ruby-related configurations..."
mkdir -p $HOMEDIR/.bundle
ln -s $DOTS/ruby/bundler          $HOMEDIR/.bundle/config
ln -s $DOTS/ruby/gemrc            $HOMEDIR/.gemrc
ln -s $DOTS/ruby/pryrc            $HOMEDIR/.pryrc
ln -s $DOTS/pow/powconfig         $HOMEDIR/.powrc
ln -s $DOTS/middleman             $HOMEDIR/.middleman

# Link vim configuration
echo "Linking vim configuration files"
ln -s $DOTS/vim                   $HOMEDIR/.vim
ln -s $DOTS/vim/settings/vimrc    $HOMEDIR/.vimrc
ln -s $DOTS/vim/setting/gvimrc    $HOMEDIR/.gvimrc

# Print Manual Instructions
echo "\n\nATTENTION! Further Instructions:\n"

# iTerm2
echo "  * Set iTerm configuration to load config"
echo "    - Open iTerm preferences"
echo "    - Check \"Load preferences from a user-defined folder or URL\""
echo "    - Put in $HOMEDIR/.dotfiles/iterm2"

