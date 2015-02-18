#!/bin/bash
pageStart=1
pageEnd=721
mkdir output
cd input
for fileName in *.djvu; do
   fileExt=${fileName/*./''}
done
echo Конвертируем файл $fileName в рисунки tif...
for ((pageNum=$pageStart; pageNum <= $pageEnd ; pageNum++))
   do  
      echo Конвертируеся страница $pageNum из $pageEnd...
      ddjvu -format=tiff -page=$pageNum -quality=85 $fileName ../output/${fileName%.$fileExt}$pageNum.tif
   done
