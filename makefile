# Makefile for my resume and coverletter
#
# author: Connor Henley, @thatging3rkid

# latex compiler defines
LATEXC = latexmk
LATEXC_FLAGS = -pdf

RM_COMMAND = rm -f

# rule for building all pdfs
all: resume.pdf coverletter.pdf

# rule for building the (unofficial) resume pdf
resume.pdf: resume.tex
	$(LATEXC) resume.tex $(LATEXC_FLAGS)

# rule for building the (unofficial) cover letter pdf
coverletter.pdf: coverletter.tex
	$(LATEXC) coverletter.tex $(LATEXC_FLAGS)

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
chenley-resume.pdf: resume.tex
	python3 fullmake.py resume.tex header.txt chenley-resume.temp.tex
	$(LATEXC) chenley-resume.temp.tex $(LATEXC_FLAGS)
	mv chenley-resume.temp.pdf chenley-resume.pdf
	$(RM_COMMAND) chenley-resume.temp*

# rule for building a full cover letter
chenley-coverletter.pdf: coverletter.tex
	python3 fullmake.py coverletter.tex header.txt chenley-coverletter.temp.tex
	$(LATEXC) chenley-coverletter.temp.tex $(LATEXC_FLAGS)
	mv chenley-coverletter.temp.pdf chenley-coverletter.pdf
	$(RM_COMMAND) chenley-coverletter.temp*

clean:
	#$(RM_COMMAND) *.aux
	#$(RM_COMMAND) *.log
	#$(RM_COMMAND) *.bbl
	#$(RM_COMMAND) *.blg
	#$(RM_COMMAND) *.fls
	#$(RM_COMMAND) *.fdb_latexmk
	#$(RM_COMMAND) *.pdf
	latexmk -C
