# The UGent2016 packages

Version: 0.1  
Date: 2019/05/19

## Description

Unofficial packages to create documents in the official Ghent University style. Three document classes are provided that work out of the box:

- `ugent2016-article`
- `ugent2016-book`
- `ugent2016-report`

These classes use the KOMA-Script classes behind the scenes. Most of the functionality (assets and front pages) are also available as separate packages for use with other document classes.

## Maintenance

The package is maintained at https://github.com/niknetniko/ugent2016. Issues can also be reported there.
Current maintainer(s):

- Niko Strijbol <strijbol.niko@gmail.com>

## Installation

1. Install the current version with the preferred package manager of your TeX distribution. A tds-zip file is available from the source repository.
2. Development versions might be available in the source repository. A makefile to produce tds compatible zips is also available.
3. Manual installation details:
    - Install all `*.cls` and `*.sty` files under `tex/latex/ugent2016`.
    - Copy the `/logo` directory to `tex/latex/ugent2016`. The result should be `tex/latex/ugent2016/logos/*`. You should include at least the pdf versions, but the eps version could also be useful.
    - Copy `ugent2016-nl.pdf` and `ugent2016-en.pdf` to `doc/latex/ugent2016`.
    - Copy `ugent2016-nl.tex` and `ugent2016-en.tex` to `source/latex/ugent2016`. If installing from CTAN, you can also add the `ugent2016.dtx` and `ugent2016.ins` files to this folder.

## Documentation

See the manual `ugent2016-[nl|en].pdf` for more information.

## License

All code is licensed under the LaTeX Project Public License, version 1.3c or later.

The license of the included images should be CC BY-SA 4.0 according to [Wikipedia](https://commons.wikimedia.org/wiki/File:Logo_UGent_NL_RGB_2400_kleur-op-wit.png), but I'm the process of verifying this.