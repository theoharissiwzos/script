#!/bin/bash

fullbuild(){
	cd pages
	mkdir templates
	mkdir styles
	touch styles/styles.css
	for file in post-*.md
	do
		pandoc -s -f markdown ${file} --metadata title="${file%.md}" --css=styles/styles.css -o templates/${file%.md}.html
	done
}

build(){
	pandoc -s -f markdown ${file} --metadata title="${file%.md}" --css=styles/styles.css -o templates/${file%.md}.html
}

echo "Do you want full build?(yes/no):	"
read yn
if [ ${yn} = "yes" ]
then
	fullbuild
elif [ ${yn} = "no" ]
then
	echo "	What file:	"
	read file
	build ${file}
else
	echo "	Error."
fi

