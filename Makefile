base = slides
slidefilename = haenel-best-practices.pdf

all: $(base).pdf

$(base).pdf: $(base).tex $(base).wiki.tex
	pdflatex $(base).tex
	pdflatex $(base).tex
	cp slides.pdf $(slidefilename)

$(base).wiki.tex: $(base).wiki
	wiki2beamer $(base).wiki > $(base).wiki.tex

clean:
	-rm -vf $(base).{toc,snm,log,aux,out,nav}

distclean: clean
	-rm -vf $(base).pdf $(base).wiki.tex $(slidefilename)
