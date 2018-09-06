all: pdfs pngs

pdfs: $(addsuffix .pdf, $(basename $(wildcard *.tex)))
pngs: $(addsuffix .png, $(basename $(wildcard *.tex)))

%.pdf: %.tex
	pdflatex $^

%.png: %.pdf
	convert -density 125 -alpha remove $^ $@
