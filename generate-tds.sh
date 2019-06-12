#!/usr/bin/env bash

#
# Generate a TDS compliant zip
#

REMOVE_OUT=false

while getopts 'abf:v' flag; do
  case "${flag}" in
    RemoveOut) REMOVE_OUT=true ;;
    *) break ;;
  esac
done

out="tdsout"
in="latex"


latex="$out/tex/latex/ugent2016"
doc="$out/doc/latex/ugent2016"
source="$out/source/latex/ugent2016"

mkdir -p ${latex}
mkdir -p ${doc}
mkdir -p ${source}

# Copy all latex files
find ${in} -name '*.cls' -o -name '*.sty' -exec cp "{}" ${latex} ";"

# Copy all doc files
find ${in} -name '*.md' -exec cp "{}" ${doc} ";"

# Copy all source files
find ${in} -name '*.tex' -exec cp "{}" ${source} ";"

# Convert all line endings
find ${out} -type f -print0 | xargs -0 dos2unix

# Copy logos
find ${in} -name 'ugent2016-logo-*.pdf' -exec cp "{}" ${latex} ";"

# Copy the documentation pdfs to the folder
cp "$in/ugent2016-nl.pdf" ${doc}
cp "$in/ugent2016-en.pdf" ${doc}

# Fix all permissions
find ${out} -type f -exec chmod 644 "{}" ";"

cd ${out}
zip --filesync -r ../ugent2016.tds.zip *

chmod 644 ../ugent2016.tds.zip

if [[ "$REMOVE_OUT" = true ]]; then
    rm -rf ${out}
fi