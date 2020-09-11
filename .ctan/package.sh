#!/bin/bash
# package.sh
# NOTE: 本脚本用于生成发布到 CTAN 上的模板压缩包，一般用户请忽略
# NOTE: please exec the script under current direcotry
# @author-by: xjtu-blacksmith
# @create-on: 2020/9/11

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