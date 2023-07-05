#!/user/bin/bash
#
rsync -av ~/.dotfiles_linux/username/ ~

rsync -av ~/Library/Rime/{zhengma.*,default.*} ~/.local/share/fcitx5/rime/
