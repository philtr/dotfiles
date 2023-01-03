
![DOTFILES by philtr](./.images/dotfiles.png)

## Bare Repo

These dotfiles use the bare repo method described in [this Atlassian blog
post][blog post]. This has the advantage of not requiring symlinks for all the
files, everything is right where they belong. Git commands are accessed through
an function (`dot` in my case) that specifies a different git dir.

[blog post]: https://www.atlassian.com/git/tutorials/dotfiles

## Installation:

**:warning: Don't run scripts downloaded from the internet sight unseen!**
Take a look at [the install script] and understand what it is going to do
before you run it.

To run the installer, paste the following command into a zsh terminal:

```zsh
eval "$(curl -L https://philtr.dev/dotfiles.zsh)"
```

If `dot::install::checkout` fails due to existing files, backup and remove the
conflicting files and run `dot::install::checkout` again (or use
`dot::install::checkout -f`)

[the install script]: .local/dotfiles/lib/dot.zsh

## Post-installation:

* Set iTerm configuration to load config
  - Open iTerm preferences
  - Check "Load preferences from a user-defined folder or URL"
  - Put in `$HOME/.config/iterm2` (replacing `$HOME` with the full path of the
    home folder, e.g. `/Users/philtr`)

## Using

Keeping things committed is easy. Simply use the `dot` command from the home
directory to add, commit, and pull changes.
