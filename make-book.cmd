@echo off
setlocal
cd /D %~dp0
::set local path to the portable version of miktek
pandoc --version
del markdown.pdf
echo Generating LaTeX files from markdown...
::PANDOC "%~dp0markdown.md" -s --listings --highlight-style kate -o "markdown.tex"

echo Generating PDF
PANDOC "%~dp0markdown.md" -o "markdown.pdf" -s --listings --highlight-style kate --pdf-engine xelatex --template "%~dp0default.tex" 
pause