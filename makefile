slides = slides
handout = handout
slides_and_notes = dualscreen
slidefilename = haenel-best-practices-talk
git_sha_func = $(shell git describe --always --tags --dirty | tee git-sha)
git_sha = $(git_sha_func)
.DEFAULT_GOAL = default

all: $(slides).pdf $(handout).pdf $(slides_and_notes).pdf

default: $(slides).pdf

%.pdf: | %.tex $(slides).wiki.tex
	pdflatex -shell-escape "$(*)".tex
	pdflatex -shell-escape "$(*)".tex
	cp "$(*)".pdf "$(slidefilename)"-"$(*)"-"$(git_sha)".pdf

$(slides).wiki.tex: $(slides).wiki
	./wiki2beamer-0.9.2 $(slides).wiki > $(slides).wiki.tex

clean:
	-rm -vf $(addprefix $(slides).,toc snm log aux out nav pyg)
	-rm -vf $(addprefix $(handout).,toc snm log aux out nav pyg)
	-rm -vf $(addprefix $(slides_and_notes).,toc snm log aux out nav pyg)
	-rm -vf $(addprefix headers.,toc snm log aux out nav pyg)
	-rm -vf $(slides).pdf $(handout).pdf $(slides_and_notes).pdf $(slides).wiki.tex

distclean: clean
	-rm -vf "$(slidefilename)"-"$(slides)"-"$(git_sha)".pdf
	-rm -vf "$(slidefilename)"-"$(handout)"-"$(git_sha)".pdf
	-rm -vf "$(slidefilename)"-"$(slides_and_notes)"-"$(git_sha)".pdf
	-rm -vf git-sha
