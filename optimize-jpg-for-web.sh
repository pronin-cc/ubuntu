#!/bin/bash

# TRANSLIT FILENAMES
find -type f|while read name; do en=`echo $name|sed 'y/абвгджзийклмнопрстуфхыэе/abvgdjzijklmnoprstufhyee/'|sed 's/[ьъ]//g; s/ё/yo/g; s/ц/ts/g; s/ч/ch/g; s/ш/sh/g; s/щ/sh/g; s/ю/yu/g; s/я/ya/'`; if [ "$name" != "$en" ]; then echo "mv $name $en "; fi; done|bash


# FIXING FILE NAMES
for i in *.JPG; do mv $i $(basename $i .JPG).jpg; done


# CREATING OUTPUT DIRECTORY
mkdir output orig


# JPG OPTIMISATION
echo "Optimizing JPG"
for image in *.jpg; do
	echo "Optimisation $image"
	jpegtran -progressive $image > output/$image
	mv $image orig/$image
done
