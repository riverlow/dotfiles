DEST=${HOME}/offline/

# cause option '-R', must let pwd to be $HOME
cd $HOME
rsync -avR .local/share/nvim/site/autoload/plug.vim $DEST
rsync -avR .vim/plugged $DEST
rsync -avR .fzf $DEST
rsync -avR .tmux/plugins $DEST
