%%
%% CLASS_NAME ugentreport2016
%% Author: Niko Strijbol
%% 15/02/2019
%%
%%
%% Provides a class that extends scrreprt, but adds UGent styles.
%% See the manual for more information.

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{ugentreport2016}[2019/02/15 UGent2016 Report Class]

\RequirePackage{kvoptions}
\RequirePackage{translations}

\SetupKeyvalOptions{
    prefix=ugentcls@
}

% Some options we pass to the underlying style package.
\DeclareStringOption[report]{ugentstyle}{\PassOptionsToPackage{\CurrentOption}{ugentstyle2016}}
\DeclareStringOption{faculty}{\PassOptionsToPackage{\CurrentOption}{ugentstyle2016}}
\DeclareStringOption{campus}{\PassOptionsToPackage{\CurrentOption}{ugentstyle2016}}

% How much of the document we want to style.
% none -> margins -> colours -> titlestyle -> titlefont -> all
\DeclareStringOption[none]{layout}
\DeclareBoolOption{footer}

% Other options are passed to the underlying class, allowing it to be configured as well.
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessKeyvalOptions*

\LoadClass{scrreprt}

\input{ugentcommon2016}