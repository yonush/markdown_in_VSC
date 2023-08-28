@echo off
setlocal
cd /D %~dp0
::set local path to the portable version of miktek
pandoc --version
del "%~dp0markdown.epub"
echo Generating ePUB
PANDOC "%~dp0markdown.md" -o "markdown.epub" --number-sections --toc --toc-depth=2 -t epub+smart --css epub.css epub_title.txt
pause