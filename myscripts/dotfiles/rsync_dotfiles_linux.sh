#!/user/bin/bash
#
rsync -av ~/.dotfiles_linux/username/ ~
rsync -av ~/.dotfiles_linux/etc/ /etc/

rsync -av ~/Library/Rime/{zhengma.*,default.*} ~/.local/share/fcitx5/rime/
