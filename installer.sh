#!/bin/bash

wget https://github.com/cismet/html5-scaffolding/tarball/t1 -O scaffolding.tar.gz
tar xzf scaffolding.tar.gz

cp -R ./cismet-html5-scaffolding-*/example/* .

echo -n "What's the name of the new project? (myAngularApp): "
read name

if [ "$name" != 'myAngularApp' -a "$name" != '' ]; then
	sed -i.bak s/myAngularApp/$name/g bower.json	
	sed -i.bak s/myAngularApp/$name/g package.json
	sed -i.bak s/myAngularApp/$name/g nbproject/project.properties	
	sed -i.bak s/myAngularApp/$name/g nbproject/project.xml
	echo "$name\n===\n" > README.md

	rm *.bak nbproject/*.bak
fi

rm -rf ./cismet-html5-scaffolding-* installer.sh
