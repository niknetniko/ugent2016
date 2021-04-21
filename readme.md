# UGent 2016 styles [![Build Status](https://travis-ci.com/niknetniko/ugent2016.svg?branch=master)](https://travis-ci.com/niknetniko/ugent2016)

Unofficial packages to create documents in the official Ghent University style. Three document classes are provided that work out of the box:

- `ugent2016-article`
- `ugent2016-book`
- `ugent2016-report`

These classes use the KOMA-Script classes behind the scenes. Most of the functionality (assets and front pages) are also available as separate packages for use with other document classes.

See the end of the readme for a quickstart section.

## Installation

See more details in the readme inside `/latex` or `/lyx`.

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

## Examples

A list of theses and documents using this package, with source available:

- https://github.com/niknetniko/universal-judge/tree/master/thesis (my thesis)

Feel free to add yourself.

## Warning

The packages are still in beta! Please report issues. The three main classes are considered stable, meaning they should continue to work (barring any serious issues that need resolving). Other packages and classes might change in the future.

## License

All files except those mentioned below are licensed under the LaTeX Project Public Licence, version 1.3c or later. See the `LICENSE` file.

The licence of the files in the folders `assets` and `latex/logos` is unclear. Wikipedia claims that the UGent logo (main one) is CC BY-SA 4.0; but the legal department disagreed when I contacted them.
