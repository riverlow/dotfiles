if test (uname) = "Darwin";

    # bin_macos
    fish_add_path $HOME/myscripts/bin_macos

    # PATH
    fish_add_path /usr/local/opt/curl/bin /usr/local/opt/gawk/libexec/gnubin /usr/local/opt/iftop/sbin /usr/local/opt/unzip/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/findutils/libexec/gnubin /usr/local/opt/gnu-tar/libexec/gnubin /usr/local/opt/gnu-indent/libexec/gnubin /usr/local/opt/grep/libexec/gnubin 

    # Java
    fish_add_path '/usr/local/opt/openjdk/bin' 

    # c++
    fish_add_path  "/usr/local/opt/gettext/bin"

    # openssl
    fish_add_path '/usr/local/opt/openssl@3/bin'

    # llvm
    fish_add_path /usr/local/opt/llvm/bin

    # qt5
    fish_add_path /usr/local/opt/qt@5/bin

end

