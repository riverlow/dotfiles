#!/usr/local/bin/bash

cd ~/dl/
git clone https://github.com/Diolinux/PhotoGIMP.git
cd PhotoGIMP/
mv ~/Library/Application\ Support/GIMP/2.10{,bak}
cp -r .var/app/org.gimp.GIMP/config/GIMP/2.10/ ~/Library/Application\ Support/GIMP/
