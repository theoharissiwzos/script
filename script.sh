#! /bin/bash

echo "File name: "
read file

echo "Format [pdf/docx]: "
read format

if [ ${format} = "pdf" ]; then
	echo "Making ${file::len-3}.pdf..."
	pandoc -N --variable "geometry=margin=1.1in" --variable mainfont="OpenSans-Regular.ttf" --variable fontsize=13pt --variable version=2.0 ${file}  --pdf-engine=xelatex --toc -o ${file::len-3}.pdf
	echo "${file::len-3}.pdf done"
elif [ ${format} = "docx" ]; then
	echo "Making ${file::len-3}.docx..."
	pandoc -s ${file} -o ${file::len-3}.docx
	echo "${file::len-3}.docx done"
else
	echo "ERROR: Wrong format!"
fi



