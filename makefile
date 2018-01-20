# Makefile for my resume and coverletter
#
# author: Connor Henley, @thatging3rkid

# rule for building all pdfs
all: resume.pdf coverletter.pdf

# rule for building the (unofficial) resume pdf
resume.pdf: resume.tex
	latexmk resume.tex -pdf

# rule for building the (unofficial) cover letter pdf
coverletter.pdf: coverletter.tex
	latexmk coverletter.tex -pdf

# rule to run spell check
spell:
	aspell --lang=en --mode=tex check resume.tex
	aspell --lang=en --mode=tex check coverletter.tex

# just spell check one resume
spell-resume:
	aspell --lang=en --mode=tex check resume.tex

# just spell check the cover letter
spell-coverletter:
	aspell --lang=en --mode=tex check coverletter.tex

# rule for building a full resume and coverletter (with proper header):
full: chenley-resume.pdf chenley-coverletter.pdf

# rule for building a full resume
chenley-resume.pdf:
	python3 fullmake.py resume.tex header.txt chenley-resume.temp.tex
	latexmk chenley-resume.temp.tex -pdf
	mv chenley-resume.temp.pdf chenley-resume.pdf
	rm chenley-resume.temp*

# rule for building a full cover letter
chenley-coverletter.pdf:
	python3 fullmake.py coverletter.tex header.txt chenley-coverletter.temp.tex
	latexmk chenley-coverletter.temp.tex -pdf
	mv chenley-coverletter.temp.pdf chenley-coverletter.pdf
	rm chenley-coverletter.temp*

clean:
	rm *.aux
	rm *.dvi
	rm *.log
