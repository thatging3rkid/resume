all: CCulpepper-Resume.tex 
	#latex resume.tex
	#dvipdf resume.dvi
	latexmk -pdflatex='pdflatex -file-line-error -synctex=1' -pdf -r /home/chris/.latexmkrc
	
view: all
	latexmk -pvc -pdflatex='pdflatex -file-line-error -synctex=1' -pdf -r /home/chris/.latexmkrc

clean: 
	rm CCulpepper-Resume.aux
	rm CCulpepper-Resume.dvi
	rm CCulpepper-Resume.log
	rm CCulpepper-Resume.pdf
