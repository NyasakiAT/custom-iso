#!/bin/bash
SCRIPT_PATH=$1

add(){
	git clone $1 ./tmp
	cd ./tmp

	makepkg -sr 1> /dev/null
	mv *.pkg.tar.zst ..

	cd ..
	sudo rm -R ./tmp
}

build_repo () {
	for pkg in *.pkg.tar.zst; do
		echo "Adding " $pkg
		repo-add $SCRIPT_PATH/archlive/custom-repo/custom.db.tar.gz $f
	done
}

echo "Building custom repo"
cd $SCRIPT_PATH/archlive/custom-repo

add "https://aur.archlinux.org/berry.git"
add "https://aur.archlinux.org/ungoogled-chromium-bin.git"

build_repo

echo "Building ISO"
cd $SCRIPT_PATH
sudo mkarchiso -v -w $SCRIPT_PATH/work -o $SCRIPT_PATH $SCRIPT_PATH/archlive

echo "Publish ISO"
sudo cp $SCRIPT_PATH/*.iso /var/www/files/

echo "Cleaning up"
sudo rm $SCRIPT_PATH/*.iso
sudo rm -R $SCRIPT_PATH/work/*
