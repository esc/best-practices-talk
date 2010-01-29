base = slides

all: $(base).pdf

$(base).pdf: $(base).tex $(base).wiki.tex
	pdflatex $(base).tex
	pdflatex $(base).tex

#$(base)-0?.tex: $(base)-0?.txt wiki2beamer/wiki2beamer.py
#	python wiki2beamer/wiki2beamer.py $(wildcard $(base)-0?.txt) > $(wildcard $(base)-0?.tex)

$(base).wiki.tex: $(base).wiki wiki2beamer
	./wiki2beamer/code/wiki2beamer $(base).wiki > $(base).wiki.tex

wiki2beamer:
	wget http://downloads.sourceforge.net/project/wiki2beamer/wiki2beamer/wiki2beamer-0.8.1/wiki2beamer-0.8.1.zip?use_mirror=mesh
	unzip wiki2beamer-0.8.1
	ln -s wiki2beamer-0.8.1 wiki2beamer

clean:
	-rm -vf *.{toc,snm,log,dvi,aux,out,nav,vrb}

distclean: clean
	-rm -vf $(base).pdf $(base)-*.tex
