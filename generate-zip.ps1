#
# Generate a zip file suitable for uploading to CTAN.
#

$out = "ctanout"
$in = "latex"

# Create directory if it does not exist.
New-Item -ItemType Directory -Force -Path $out

Get-ChildItem -Path "$in/*" -File -Include *.cls,*.tex,*.sty | ForEach-Object {
    Write-Host "Including" + $_.BaseName
    ((Get-Content $_) -join "`n") + "`n" | Set-Content -NoNewline $out/$_.BaseName
}