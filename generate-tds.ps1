#
# Generate a zip file suitable for uploading to CTAN.
#

param(
    [Switch]$RemoveOut = $false
)

$out = "tdsout"
$in = "latex"

# We need the following files in the zip for ctan:
# - The class files
# - The style files
# - The docs (including the pdf versions)
# - The logos
# - The readme

$latex = "$out/tex/latex/ugent2016"
$doc = "$out/doc/latex/ugent2016"
$source = "$out/source/latex/ugent2016"

# First, create the output directory
New-Item -ItemType Directory -Force -Path $latex
New-Item -ItemType Directory -Force -Path $doc
New-Item -ItemType Directory -Force -Path $source

# Copy all latex files
Get-ChildItem -Path "$in/*" -File -Include *.cls,*.sty | ForEach-Object {
    $filename = "$($_.BaseName)$($_.Extension)"
    ((Get-Content $_) -join "`n") + "`n" | Set-Content -NoNewline "$latex/$filename"
}

# Copy all doc files
Get-ChildItem -Path "$in/*" -File -Include *.md | ForEach-Object {
    $filename = "$($_.BaseName)$($_.Extension)"
    ((Get-Content $_) -join "`n") + "`n" | Set-Content -NoNewline "$doc/$filename"
}

# Copy all source files
Get-ChildItem -Path "$in/*" -File -Include *.tex | ForEach-Object {
    $filename = "$($_.BaseName)$($_.Extension)"
    ((Get-Content $_) -join "`n") + "`n" | Set-Content -NoNewline "$source/$filename"
}

# Copy the logos to the output folder
Copy-Item "$in/logos" -Destination "$latex/logos" -Recurse

# Copy the documentation pdfs to the folder
Copy-Item "$in/ugent2016-nl.pdf" -Destination "$doc"
Copy-Item "$in/ugent2016-en.pdf" -Destination "$doc"

Compress-Archive -Path $out/* -DestinationPath ugent2016.tds.zip -Force

if ($RemoveOut) {
    Remove-Item $out -Recurse -Force
}