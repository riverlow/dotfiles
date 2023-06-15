#!/user/bin/bash
#
rsync -av ~/.dotfiles_linux/username/ ~

rsync -av ~/Library/Rime/{default,zhengma}.custom.yaml ~/.local/share/fcitx5/rime/
