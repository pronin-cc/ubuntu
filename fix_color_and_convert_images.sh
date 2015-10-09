#!/bin/bash

# FIXING NAMES

for i in *.TIF; do mv $i $(basename $i .TIF).tif; done
for i in *.TIFF; do mv $i $(basename $i .TIFF).tif; done
for i in *.tiff; do mv $i $(basename $i .tiff).tif; done

# Convert CMYK to sRGB
echo "CMYK to sRGB"
for image in *.tif; do 
	convert $image -colorspace cmyk -colorspace srgb $(basename $i .tif).tif; 
done

# Convert AdobeRGB1998 to sRGB
echo "Correcting color profile of images"
for image in *.tif; do
	convert $image -profile "/usr/share/color/icc/colord/AdobeRGB1998.icc" -profile "/usr/share/color/icc/colord/sRGB.icc" $(basename $image .tif).tif;
done

# Convert TIFF to JPG
echo "TIF to JPG"
for image in *.tif; do
	convert $image $(basename $image .tif).jpg;
done

# Creating output directory
mkdir output

# JPG optimisation
echo "Optimizing JPG"
for image in *.jpg; do
        jpegtran -progressive $image > output/$image
done

# Convert TIF to PNG
#echo "TIF to PNG"
#for image in *.tif; do
#        convert $image $(basename $image .tif).png;
#done

# PNG optimisation
#echo "Optimizing PNG"
#for image in *.jpg; do
#	optipng -o7 *.png
#done
