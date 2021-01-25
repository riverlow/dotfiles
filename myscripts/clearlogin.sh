echo -n > /var/log/lastlog
echo -n > /var/log/wtmp
echo -n > /var/log/btmp

echo -n > $HOME/.zsh_history
echo -n > $HOME/.bash_history

# clear history cache in current shell
history -c
