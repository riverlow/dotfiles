if test (uname) = "Darwin";

# PATH
set -U fish_user_paths  /usr/local/bin /usr/local/sbin /usr/local/opt/iftop/sbin /usr/local/opt/unzip/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/findutils/libexec/gnubin /usr/local/opt/gnu-tar/libexec/gnubin /usr/local/opt/gnu-indent/libexec/gnubin /usr/local/opt/grep/libexec/gnubin 

# alias
alias ls="ls --color=auto";

# python
fish_add_path $HOME/Library/Python/3.11/bin

# Java
fish_add_path '/usr/local/opt/openjdk/bin' 
# For compilers to find openjdk you may need to set:
set -gx CPPFLAGS "-I/usr/local/opt/openjdk/include"
# If you need to have openjdk first in your PATH, run:

# c++
fish_add_path  "/usr/local/opt/gettext/bin"
set -gx LDFLAGS "-L/usr/local/opt/gettext/lib"
set -gx CPPFLAGS "-I/usr/local/opt/gettext/include"

# openssl
fish_add_path '/usr/local/opt/openssl@3/bin'
set -gx CPPFLAGS "-I/usr/local/opt/openssl@3/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl@3/lib/pkgconfig"

# llvm
fish_add_path /usr/local/opt/llvm/bin
# To use the bundled libc++ please add the following LDFLAGS:
# LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
set -gx CPPFLAGS "-I/usr/local/opt/llvm/include"

# curl
fish_add_path /usr/local/opt/curl/bin

set -gx CPPFLAGS "-I/usr/local/opt/curl/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/curl/lib/pkgconfig"

# libgstreamer
set -gx LDFLAGS ""
set -gx CPPFLAGS "-I/usr/local/Cellar/gstreamer/1.20.1/include -I/usr/local/Cellar/gst-plugins-base//1.20.1/lib/include"

# qt5
fish_add_path /usr/local/opt/qt@5/bin

set -gx LDFLAGS "-L/usr/local/opt/qt@5/lib"
set -gx CPPFLAGS "-I/usr/local/opt/qt@5/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/qt@5/lib/pkgconfig"

end

