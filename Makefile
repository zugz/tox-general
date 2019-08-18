%.tex: %.beamer.md
	pandoc -s -t beamer $< -V colortheme:seagull -o $@

%.pdf: %.beamer.md
	pandoc -t beamer $< -V colortheme:seagull -o $@




#%.pdf: %.md
#	pandoc $< -o $@
#
#%.html: %.md
#	pandoc $< -o $@
#
#
#%.pdf: %.tex %.bbl
#	pdflatex $<
#	pdflatex $<
#
#%.aux: %.tex
#	pdflatex $<
#
#%.bbl: %.bib %.aux
#	bibtex $(<:%.bib=%)
