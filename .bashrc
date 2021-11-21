# .bashrc

# load files from .bashrc.d folder
if [ -d ~/.dotfiles/.bashrc.d ]; then
    for rc in ~/.dotfiles/.bashrc.d/*; do
        if [ -f "$rc"]; then
            . "$rc"
        fi
    done
fi

unset rc
