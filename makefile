slides = slides
handout = handout
slides_and_notes = dualscreen
slidefilename = haenel-best-practices
.DEFAULT_GOAL = default

all: $(slides).pdf $(handout).pdf $(slides_and_notes).pdf

default: $(slides).pdf

git-sha:
	echo `git describe --always --tags` > git-sha

$(slides).pdf: | git-sha $(slides).tex $(slides).wiki.tex
	pdflatex -shell-escape "$(slides)".tex
	pdflatex -shell-escape "$(slides)".tex
	cp "$(slides)".pdf "$(slidefilename)"-"$(slides)"-`cat git-sha`.pdf

$(handout).pdf: | git-sha $(handout).tex $(slides).wiki.tex
	pdflatex -shell-escape "$(handout)".tex
	pdflatex -shell-escape "$(handout)".tex
	cp "$(handout)".pdf "$(slidefilename)"-"$(handout)"-`cat git-sha`.pdf

$(slides_and_notes).pdf: | git-sha $(slides_and_notes).tex $(slides).wiki.tex
	pdflatex -shell-escape "$(slides_and_notes)".tex
	pdflatex -shell-escape "$(slides_and_notes)".tex
	cp "$(slides_and_notes)".pdf "$(slidefilename)"-"$(slides_and_notes)"-`cat git-sha`.pdf

$(slides).wiki.tex: $(slides).wiki
	./wiki2beamer-0.9.2 $(slides).wiki > $(slides).wiki.tex

clean:
	-rm -vf $(addprefix $(slides).,toc snm log aux out nav pyg)
	-rm -vf $(addprefix $(handout).,toc snm log aux out nav pyg)
	-rm -vf $(addprefix $(slides_and_notes).,toc snm log aux out nav pyg)
	-rm -vf $(addprefix headers.,toc snm log aux out nav pyg)
	-rm -vf $(slides).pdf $(handout).pdf $(slides_and_notes).pdf $(slides).wiki.tex

distclean: clean
	-rm -vf "$(slidefilename)"-"$(slides)"-`cat git-sha`.pdf
	-rm -vf "$(slidefilename)"-"$(handout)"-`cat git-sha`.pdf
	-rm -vf "$(slidefilename)"-"$(slides_and_notes)"-`cat git-sha`.pdf
	-rm -vf git-sha
