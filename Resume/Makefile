all: resume.tex 
	#latex resume.tex
	#dvipdf resume.dvi
	latexmk -pdflatex='pdflatex -file-line-error -synctex=1' -pdf -r /home/chris/.latexmkrc
	
view: all
	latexmk -pvc -pdflatex='pdflatex -file-line-error -synctex=1' -pdf -r /home/chris/.latexmkrc

clean: 
	rm resume.aux
	rm resume.dvi
	rm resume.log
	rm resume.pdf
