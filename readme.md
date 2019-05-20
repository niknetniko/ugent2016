# UGent 2016 styles

Unofficial packages to create documents in the official Ghent University style. Three document classes are provided that work out of the box:

- `ugent2016-article`
- `ugent2016-book`
- `ugent2016-report`

These classes use the KOMA-Script classes behind the scenes. Most of the functionality (assets and front pages) are also available as separate packages for use with other document classes.

See the end of the readme for a quickstart section.

## Installation

You should install the folder `/latex` it as any other package, meaning you should copy it to the correct folders in your TeX installation. Google is your friend!

## Documentation

All options, packages and classes are documented in the manual (Dutch only for now).

To build the documentation, you can use the makefile. It will build the Dutch docs by default.

## Quickstart

Use the following MWE (use LuaLaTeX and have the Panno font installed):
```latex

\documentclass[11pt]{ugent2016-report}
\usepackage[dutch]{babel}

\author{Jan Janssens}
\title{Discrete algoritmen VII}
\subtitle{Zeer discrete doch krachtig}

\begin{document}

\maketitle

Hallo.

\end{document}

```

## Warning

The packages are still in beta! Please report issues. The three main classes are considered stable, meaning they should continue to work (barring any serious issues that need resolving). Other packages and classes might change in the future.

## License

All code is licensed under the LaTeX Project Public License, version 1.3c or later.

The license of the included images is unclear at the moment (I'm working on this).