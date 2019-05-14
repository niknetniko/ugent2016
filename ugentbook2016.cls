%%
%% CLASS_NAME ugentbook2016
%% Author: Niko Strijbol
%% 15/02/2019
%%
%%
%% Provides a class that extends scrbook, but adds UGent styles.
%% See the manual for more information.

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{ugentbook2016}[2019/02/15 UGent2016 Book Class]

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    prefix=ugentcls@
}

% Some options we pass to the underlying style package.
\DeclareStringOption[course]{ugentstyle}{\PassOptionsToPackage{\CurrentOption}{ugentstyle2016}}
\DeclareStringOption{faculty}{\PassOptionsToPackage{\CurrentOption}{ugentstyle2016}}
\DeclareStringOption{campus}{\PassOptionsToPackage{\CurrentOption}{ugentstyle2016}}

% How much of the document we want to style.
% none -> margins -> colours -> titlestyle -> titlefont -> all
\DeclareStringOption[none]{layout}
\DeclareBoolOption{footer}

% Other options are passed to the underlying class, allowing it to be configured as well.
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessKeyvalOptions*

\LoadClass{scrbook}

\input{ugentcommon2016}
