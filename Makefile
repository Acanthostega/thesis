comp = pdflatex #-interaction=batchmode
bib = bibtex -terse

SRC=$(wildcard memoire.tex)

PDF=$(SRC:.tex=.pdf)

CHAP= intro.tex algo.tex SDSS.tex morphology.tex analytical.tex simul.tex appendix.tex

all: $(PDF)

%.pdf: %.tex $(CHAP)
	@$(comp) $<
	@$(bib) $*
	@$(comp) $<
	@$(comp) $<
#	@rm -f *.toc *.cb *.cb2 *.log *.out *.log *.blg *.aux *.bak

clean:
	@rm -f *.toc *.cb *.cb2 *.bbl *.log *.out *.log *.blg *.aux *.bak

