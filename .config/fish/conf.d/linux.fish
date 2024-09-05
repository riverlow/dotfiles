if test (uname) = "Linux";

    # alias
    alias sl     systemctl
    alias rl     resolvectl

    # fzf
    function fish_user_key_bindings
	fzf_key_bindings
    end

end

