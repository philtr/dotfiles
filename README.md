# Dotfiles

```
                  _      _
      |          | | o  | |
    __|   __ _|_ | |    | |  _   ,
   /  |  /  \_|  |/  |  |/  |/  / \_
   \_/|_/\__/ |_/|__/|_/|__/|__/ \/
                 |\  P H I L T R
                 |/
```

## Preview

![Preview](preview.png)

## Before installing Dotfiles

### Required Prerequisites

  * [Git][git]
  * [ZShell][zsh]

  [git]: https://git-scm.com
  [zsh]: http://www.zsh.org

### Recommended Prerequisites

  * [iTerm2][iterm2]
  * [TMux][tmux]
  * [Vim][vim]
  * [RBEnv][rbenv] with [Ruby-Build][rb-b] and a [recent Ruby version][rb]
  * [The Silver Searcher (Ag)][ag]

  [iterm2]: https://iterm2.com
  [tmux]:   https://tmux.github.io
  [vim]:    http://www.vim.org
  [rbenv]:  https://github.com/rbenv/rbenv
  [rb-b]:   https://github.com/rbenv/ruby-build
  [rb]:     https://www.ruby-lang.org/en/news/
  [ag]:     https://github.com/ggreer/the_silver_searcher

## Installation:

```sh
curl https://raw.githubusercontent.com/philtr/dotfiles/master/install.sh | /bin/zsh
```

## Post-installation:

### iTerm 2

Follow on-screen instructions for changing your login shell to `/bin/zsh` and setting up iTerm2 settings.

### Vim Plugins

To install Vim plugins (managed using [plug.vim](https://github.com/junegunn/vim-plug)):

  * Open Vim
  * Run `:PlugInstall`
  * Restart Vim

