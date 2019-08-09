#!/usr/bin/env bash

#
# Generate a zip file suitable for uploading to CTAN.
#
# This script relies on the TDS directory having been made.
#

REMOVE_OUT=false
EXCLUDE_TDS=false

while getopts 'abf:v' flag; do
  case "${flag}" in
    RemoveOut) REMOVE_OUT=true ;;
    ExcludeTds) EXCLUDE_TDS=true ;;
    *) break ;;
  esac
done

in="tdsout"
out="ctanout"

# We need the following files in the zip for ctan:
# - The class files
# - The style files
# - The docs (including the pdf versions)
# - The logos
# - The readme

# First, create the output directory
mkdir -p "$out/ugent2016"

find ${in} -type f -exec cp "{}" "$out/ugent2016" ";"

# Add tds-compliant zip file if necessary
if [[ ${EXCLUDE_TDS} = false ]]; then
    cp ugent2016.tds.zip ${out}
fi

zip --filesync -r ugent2016.zip $out/*

if [[ "$REMOVE_OUT" = true ]]; then
    rm -rf ${out}
fi