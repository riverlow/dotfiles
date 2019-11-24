fontsdir=$HOME/myfonts

mkdir -p $fontsdir

git clone https://go.googlesource.com/image $fontsdir/gofonts

# https://github.com/powerline/fonts
git clone https://github.com/powerline/fonts.git --depth=1 $fontsdir/powerlinefonts
cd $fontsdir/powerlinefonts/
./install.sh
