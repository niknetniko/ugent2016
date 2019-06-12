#
# Generate a zip file suitable for uploading to CTAN.
#
# This script relies on the TDS directory having been made.
#

param(
    [Switch]$ExcludeTds = $false,
    [Switch]$RemoveOut = $false
)

$in = "tdsout"
$out = "ugent2016"

# We need the following files in the zip for ctan:
# - The class files
# - The style files
# - The docs (including the pdf versions)
# - The logos
# - The readme

# First, create the output directory
New-Item -ItemType Directory -Force -Path $out

Get-ChildItem $in -Recurse -File -Depth 3 | ForEach-Object {
    $filename = "$($_.BaseName)$($_.Extension)"
    Write-Host $_.FullName
    Copy-Item $_.FullName -Destination $out/$filename
}

# Copy logos
Copy-Item "$in/tex/latex/ugent2016/logos" -Destination "$out/logos" -Recurse

# Add tds-compliant zip file if necessary
if (!$ExcludeTds) {
    Copy-Item ugent2016.tds.zip -Destination $out
}

Compress-Archive -Path $out -DestinationPath ugent2016.zip -Force

if ($RemoveOut) {
    Remove-Item $out -Recurse -Force
}