all: CCulpepper-Resume.pdf CCulpepper-CoverLetter.pdf

CCulpepper-Resume.pdf: CCulpepper-Resume.tex
	#latex resume.tex
	#dvipdf resume.dvi
	latexmk -pdflatex='pdflatex -file-line-error -synctex=1' -pdf -r /home/chris/.latexmkrc CCulpepper-Resume.tex
	
CCulpepper-CoverLetter.pdf: CCulpepper-CoverLetter.tex
	#latex resume.tex
	#dvipdf resume.dvi
	latexmk -pdflatex='pdflatex -file-line-error -synctex=1' -pdf -r /home/chris/.latexmkrc CCulpepper-CoverLetter.tex

viewResume: CCulpepper-Resume.tex
	latexmk -pvc -pdflatex='pdflatex -file-line-error -synctex=1' -pdf -r /home/chris/.latexmkrc CCulpepper-Resume.tex

viewLetter: CCulpepper-CoverLetter.tex
	latexmk -pvc -pdflatex='pdflatex -file-line-error -synctex=1' -pdf -r /home/chris/.latexmkrc CCulpepper-CoverLetter.tex

clean: 
	- rm *.pdf
	- rm *.aux
	- rm *.dvi 
	- rm *.log
