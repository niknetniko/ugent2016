# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: latex/ugent2016-nl.pdf latex/ugent2016-en.pdf all

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: latex/ugent2016-nl.pdf latex/ugent2016-en.pdf

# CUSTOM BUILD RULES

# In case you didn't know, '$@' is a variable holding the name of the target,
# and '$<' is a variable holding the (first) dependency of a rule.
# "raw2tex" and "dat2tex" are just placeholders for whatever custom steps
# you might have.


#%.tex: %.raw
#        ./raw2tex $< > $@
#
#%.tex: %.dat
#        ./dat2tex $< > $@

# MAIN LATEXMK RULE

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

latex/ugent2016-nl.pdf: latex/ugent2016-nl.tex \
						latex/ugent2016-report-title.pdf \
						latex/ugent2016-course-title.pdf \
						latex/ugent2016-notes-title.pdf
	latexmk -cd -lualatex -interaction=nonstopmode -shell-escape -use-make $<

latex/ugent2016-en.pdf: latex/ugent2016-en.tex \
						latex/ugent2016-report-title.pdf \
						latex/ugent2016-course-title.pdf \
						latex/ugent2016-notes-title.pdf
	latexmk -cd -lualatex -interaction=nonstopmode -shell-escape -use-make $<

# Run from within the latex directory
latex/ugent2016-report-title.pdf: latex/ugent2016-report-title.tex
	latexmk -cd -lualatex -interaction=nonstopmode -use-make $<

# Run from within the latex directory
latex/ugent2016-course-title.pdf: latex/ugent2016-course-title.tex
	latexmk -cd -lualatex -interaction=nonstopmode -use-make $<

# Run from within the latex directory
latex/ugent2016-notes-title.pdf: latex/ugent2016-notes-title.tex
	latexmk -cd -lualatex -interaction=nonstopmode -use-make $<

# Create the example file
example.pdf: example.tex
	latexmk -cd lualatex -interaction=nontopmode -use-make $<
