.PHONY: default all pdfs svgs pngs pngs_alpha sources

default: pdfs svgs
all: pdfs svgs pngs pngs_alpha

sources:= $(wildcard *.tex *.dot) \
    paperclips-diagram-all.dot \
    paperclips-diagram-stage1-combined.dot \
    paperclips-diagram-stage2plus3.dot \

pdfs: $(addsuffix .pdf, $(basename $(sources)))
svgs: $(addsuffix .svg, $(basename $(sources)))
pngs: $(addsuffix .png, $(basename $(sources)))
pngs_alpha: $(addsuffix .alpha.png, $(basename $(sources)))

paperclips-diagram-all.dot: \
    paperclips-diagram-stage1.dot \
    paperclips-diagram-stage2.dot \
    paperclips-diagram-stage3.dot \

	echo -n "" > $@
	echo "digraph {" >> $@
	sed "s/digraph/subgraph cluster_stage1/" paperclips-diagram-stage1.dot >> $@
	sed "s/digraph/subgraph cluster_stage2/" paperclips-diagram-stage2.dot >> $@
	sed "s/digraph/subgraph cluster_stage3/" paperclips-diagram-stage3.dot >> $@
	echo "    project35 -> s2_project35" >> $@
	echo "    project46 -> space_flag" >> $@
	echo "}" >> $@

paperclips-diagram-stage1-combined.dot: \
    paperclips-diagram-stage1-part1.dot \
    paperclips-diagram-stage1-part2.dot \

	echo -n "" > $@
	sed "/rank=sink/d; /^}/d" paperclips-diagram-stage1-part1.dot >> $@
	sed "/rank=source/d; /^digraph/d" paperclips-diagram-stage1-part2.dot >> $@

paperclips-diagram-stage2plus3.dot: \
    paperclips-diagram-stage2.dot \
    paperclips-diagram-stage3.dot \

	echo -n "" > $@
	echo "digraph {" >> $@
	sed "s/digraph/subgraph cluster_stage2/" paperclips-diagram-stage2.dot >> $@
	sed "s/digraph/subgraph cluster_stage3/" paperclips-diagram-stage3.dot >> $@
	echo "    project46 -> space_flag" >> $@
	echo "}" >> $@

%.pdf: %.tex
	pdflatex $^

%.pdf: %.dot
	dot $^ -Tpdf -o $@

%.png: %.dot
	dot $^ -Tpng -o $@

%.svg: %.dot
	dot $^ -Tsvg -o $@

%.alpha.png: %.png
	convert -fuzz 10% -transparent white $^ $@
