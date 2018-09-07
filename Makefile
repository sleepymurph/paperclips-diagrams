.PHONY: all pdfs pngs

all: pdfs pngs

pdfs: $(addsuffix .pdf, $(basename $(wildcard *.tex *.dot)))
pngs: $(addsuffix .png, $(basename $(wildcard *.tex *.dot)))

%.pdf: %.tex
	pdflatex $^

%.pdf: %.dot
	dot $^ -Tpdf -o $@

%.png: %.pdf
	convert -density 125 -alpha remove $^ $@
