
![DOTFILES by philtr](./.images/dotfiles.png)

## Bare Repo

These dotfiles use the bare repo method described in [this Atlassian blog
post][blog post]. This has the advantage of not requiring symlinks for all the
files, everything is right where they belong. Git commands are accessed through
an function (`dots` in my case) that specifies a different git dir.

[blog post]: https://www.atlassian.com/git/tutorials/dotfiles

## Installation:

First, make a bare clone of this repo:

```sh
$ git clone --bare git@github.com:philtr/dotfiles.git $HOME/.dotfiles.git
```

Then, make a temporary alias to be able to checkout these dotfiles:

```sh
$ alias dots='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
$ dots checkout
```

If `dots checkout` fails due to existing files, backup and remove the
conflicting files and run the `dots checkout` again.

Finally, set the local git config to hide untracked files:

```sh
$ dots config --local status.showUntrackedFiles no
```

## Post-installation:

* Set iTerm configuration to load config
  - Open iTerm preferences
  - Check "Load preferences from a user-defined folder or URL"
  - Put in `$HOME/.config/iterm2` (replacing `$HOME` with the full path of the
    home folder, e.g. `/Users/philtr`)

## Using

Keeping things committed is easy. Simply use the `dots` command from the home
directory to add, commit, and pull changes.
