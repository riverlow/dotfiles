#!/user/bin/bash
#
rsync -av ~/.dotfiles_linux/username/ ~

RIME_DIR="~/.local/share/fcitx5/rime'
mkdir -p  "${RIME_DIR}" && rsync -av ~/myscripts/Rime/ "${RIME_DIR}"


sudo rsync -av ~/.dotfiles_linux/etc/ /etc
