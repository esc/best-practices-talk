base = slides
slidefilename = haenel-best-practices


all: $(base).pdf

git-sha:
	echo `git describe --tags` > git-sha

$(base).pdf: $(base).tex $(base).wiki.tex
	make git-sha
	pdflatex $(base).tex
	pdflatex $(base).tex
	cp slides.pdf "$(slidefilename)"`cat git-sha`.pdf

$(base).wiki.tex: $(base).wiki
	wiki2beamer $(base).wiki > $(base).wiki.tex

clean:
	-rm -vf $(addprefix $(base).,toc snm log aux out nav)

distclean: clean
	-rm -vf $(base).pdf $(base).wiki.tex "$(slidefilename)"`cat git-sha`.pdf git-sha
