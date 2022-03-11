#!/bin/bash

if [ -z $1 ]
then
	echo "Директория не задана. Выбрана действующая директория"
	dir="."
else
	dir=$1
fi

if [ -z $filetype ]
then
	echo "Поиск всех файлов в директории"
	find $dir > temp
else
	echo "Поиск файлов формата .$filetype"
	find $dir -name "*.$filetype" > temp
fi

while read line
do
	file "$line"
done < temp

rm -f temp
