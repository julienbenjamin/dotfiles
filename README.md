# dotfiles

Just the collection of my personal dotfiles, more concentrated than organized (for now, at least).

## Stow refresher

1. Create a `dotfiles` directory in your home (e.g. `~/dotfiles`).
2. Create a directory structure inside it as if it was to the home root.
3. Move existing files into the dotfiles directory. (e.g. `mv ~/.config/i3/* ~/dotfiles/i3/.config/i3/`).
4. Use `stow i3` to create the symlink(s).

```
dotfiles
|- i3
    |- .config
        |- i3
            |- config

```


