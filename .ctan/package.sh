#!/bin/bash
# please exec the script under current direcotry

cd ../
if [ -d qyxf-book ]; then rm -r qyxf-book; fi
mkdir qyxf-book
mkdir qyxf-book/figure
cp demo.tex qyxf-book-doc.tex
latexmk -xelatex qyxf-book-doc.tex
mv qyxf-book-doc.tex qyxf-book-doc.pdf qyxf-book/
rm qyxf-book-doc.*
cp qyxf-book.cls LICENSE qyxf-book/
cp README.md qyxf-book/README.zh.md
cp README.en.md qyxf-book/README.md
cp -r figure/ qyxf-book/figure/
for file in $(ls qyxf-book); do dos2unix -o qyxf-book/$file; done
zip -r qyxf-book.zip qyxf-book/