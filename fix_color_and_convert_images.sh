#!/bin/bash

echo "CMYK to sRGB"
for image in *.tif; do 
	convert $image -colorspace cmyk -colorspace srgb $(basename $i .tif).tif; 
done

echo "Correcting color profile of images"
for image in *.tif; do
	convert $image -profile "/usr/share/color/icc/colord/AdobeRGB1998.icc" -profile "/usr/share/color/icc/colord/sRGB.icc" $(basename $image .tif).tif;
done

echo "TIF to JPG"
for image in *.tif; do
	convert $image $(basename $image .tif).jpg;
done

mkdir output

echo "Optimizing JPG"
for image in *.jpg; do
        jpegtran -progressive $image > output/$image
done

#echo "TIF to PNG"
#for image in *.tif; do
#        convert $image $(basename $image .tif).png;
#done

#echo "Optimizing PNG"
#for image in *.jpg; do
#	optipng -o7 *.png
#done
