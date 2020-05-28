%%----------------------------------------------------------------------------------------------------------------------
%% Copyright (C) 2019 by Niko Strijbol
%%
%% This file may be distributed and/or modified under the conditions of the LaTeX Project Public License, either
%% version 1.3c of this license or (at your option) any later version. The latest version of this license is in:
%%
%%      http://www.latex-project.org/lppl.txt
%%
%% and version 1.3c or later is part of all distributions of LaTeX version 2006/05/20 or later.
%%----------------------------------------------------------------------------------------------------------------------
%%
%% Provides a shortcut for using articles in the house style of Ghent University. See the manual or the ugent2016
%% class for more details.
%%

\NeedsTeXFormat{LaTeX2e}[2017/01/01]
\ProvidesPackage{ugent2016-article}[2020/05/28 UGent2016 Article Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ugent2016}}
\ProcessOptions\relax

\LoadClass[type=notes]{ugent2016}
