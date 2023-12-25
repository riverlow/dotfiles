if test (uname) = "Darwin";

    # bin_macos
    fish_add_path $HOME/myscripts/bin_macos

    # PATH
    fish_add_path /usr/local/opt/curl/bin /usr/local/opt/gawk/libexec/gnubin /usr/local/opt/iftop/sbin /usr/local/opt/unzip/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/findutils/libexec/gnubin /usr/local/opt/gnu-tar/libexec/gnubin /usr/local/opt/gnu-indent/libexec/gnubin /usr/local/opt/grep/libexec/gnubin /usr/local/opt/make/libexec/gnubin/ /usr/local/opt/libpcap/bin

    # homebrew
    set -gx HOMEBREW_FORCE_BREWED_CURL 1

    # Java
    fish_add_path '/usr/local/opt/openjdk/bin' 

    # c++
    fish_add_path  "/usr/local/opt/gettext/bin"

    # openssl
    fish_add_path '/usr/local/opt/openssl@3/bin'

    # llvm
    fish_add_path /usr/local/opt/llvm/bin

    # bison
    fish_add_path /usr/local/Cellar/bison/3.8.2/bin/

    # qt5
    fish_add_path /usr/local/opt/qt@5/bin

    # pyenv
    pyenv init - --no-rehash| source

    # wine
    set -gx WINEPREFIX ~/WINE_Library 
    set -gx DYLD_FALLBACK_LIBRARY_PATH $DYLD_FALLBACK_LIBRARY_PATH:/usr/lib:/usr/X11/lib

end

