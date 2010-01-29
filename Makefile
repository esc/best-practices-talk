base = slides

all: $(base).pdf

$(base).pdf: $(base).tex $(base).wiki.tex
	pdflatex $(base).tex
	pdflatex $(base).tex

#$(base)-0?.tex: $(base)-0?.txt wiki2beamer/wiki2beamer.py
#	python wiki2beamer/wiki2beamer.py $(wildcard $(base)-0?.txt) > $(wildcard $(base)-0?.tex)

$(base).wiki.tex: $(base).wiki wiki2beamer/wiki2beamer.py
	python wiki2beamer/wiki2beamer.py $(base).wiki > $(base).wiki.tex
	

clean:
	-rm -vf *.{toc,snm,log,dvi,aux,out,nav,vrb}

distclean: clean
	-rm -vf $(base).pdf $(base)-*.tex
