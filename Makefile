.PHONY: vector raster all clean pdfs svgs pngs pngs_alpha dots

vector: pdfs svgs
raster: pngs pngs_alpha
all: vector raster

clean:
	git clean -fXd

dots:= $(basename $(wildcard *.dot.m4)) \
    paperclips-diagram-combined-all.dot \
    paperclips-diagram-combined-stage1.dot \
    paperclips-diagram-combined-stage23.dot \

pdfs: $(addprefix pdf/, $(addsuffix .pdf, $(basename $(dots))))
svgs: $(addprefix svg/, $(addsuffix .svg, $(basename $(dots))))
pngs: $(addprefix png/, $(addsuffix .png, $(basename $(dots))))
pngs_alpha: $(addprefix png-alpha/, $(addsuffix .alpha.png, $(basename $(dots))))

paperclips-diagram-stage2.dot: paperclips-diagram-stage2-include.dot

paperclips-diagram-stage2-include.dot: upc_prices.py
	python3 upc_prices.py > $@

paperclips-diagram-combined-all.dot: \
    paperclips-diagram-combined-stage1.dot \
    paperclips-diagram-stage2.dot \
    paperclips-diagram-stage3.dot \

	echo -n "" > $@
	echo "digraph {" >> $@
	sed "s/digraph/subgraph cluster_stage1/" paperclips-diagram-combined-stage1.dot >> $@
	sed "s/digraph/subgraph cluster_stage2/" paperclips-diagram-stage2.dot >> $@
	sed "s/digraph/subgraph cluster_stage3/" paperclips-diagram-stage3.dot >> $@
	echo "    project35 -> s2_project35" >> $@
	echo "    project46 -> s3_project46" >> $@
	echo "}" >> $@

paperclips-diagram-combined-stage1.dot: \
    paperclips-diagram-stage1a.dot \
    paperclips-diagram-stage1b.dot \

	echo -n "" > $@
	sed "/rank=sink/d; /^}/d" paperclips-diagram-stage1a.dot >> $@
	sed "/rank=source/d; /^digraph/d" paperclips-diagram-stage1b.dot >> $@

paperclips-diagram-combined-stage23.dot: \
    paperclips-diagram-stage2.dot \
    paperclips-diagram-stage3.dot \

	echo -n "" > $@
	echo "digraph {" >> $@
	sed "s/digraph/subgraph cluster_stage2/" paperclips-diagram-stage2.dot >> $@
	sed "s/digraph/subgraph cluster_stage3/" paperclips-diagram-stage3.dot >> $@
	echo "    project46 -> s3_project46" >> $@
	echo "}" >> $@

%.dot: %.dot.m4
	m4 common.m4 $< > $@

%.pdf: %.tex
	pdflatex $<

%.pdf: %.dot
	dot $< -Tpdf -o $@

%.png: %.dot
	dot $< -Tpng -o $@

%.svg: %.dot
	dot $< -Tsvg -o $@

%.alpha.png: %.png
	convert -fuzz 10% -transparent white $< $@

pdf/%.pdf: %.pdf
	mkdir -p pdf
	cp $< pdf/

svg/%.svg: %.svg
	mkdir -p svg
	cp $< svg/

png/%.png: %.png
	mkdir -p png
	cp $< png/

png-alpha/%.alpha.png: %.alpha.png
	mkdir -p png-alpha
	cp $< png-alpha/
