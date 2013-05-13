\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{these}[02/11/2011 Classe pour les mémoires de thèse, V1.0]

% classe de départ pour réaliser ma classe de mémoire de thèse
\LoadClassWithOptions{book}

\RequirePackage[english]{babel}    %{francais}
\RequirePackage[T1]{fontenc}        %(accents)
\RequirePackage{ucs}
\RequirePackage[utf8]{inputenc}
\RequirePackage{amssymb}            % amstex math
\RequirePackage{amsmath}            % amstex math
\RequirePackage{amscd}              % amstex math
\RequirePackage{amsfonts}           % amstex math
\RequirePackage{amssymb}            % amstex math
\RequirePackage{amsthm}             %
\RequirePackage{graphics}           % couleur ....
\RequirePackage{color}              % couleur
\RequirePackage{fullpage}           % pour avoir le texte en pleine page et pas des marges décalées (mais pas l'air de marcher)
\RequirePackage[linktocpage]{hyperref} % pour avoir les liens cliquables dans le document
\RequirePackage{float}              % pour des figures flottantes placées au bon endroit
%\RequirePackage{morefloats}              % pour des figures flottantes placées au bon endroit
\RequirePackage{fancyhdr}           % gérer les en-têtes et pieds de page
\RequirePackage{graphicx}           %pour avoir l'affichage des figures
\RequirePackage{verbatim}           % commande verbatim ????? ne marche pas
\RequirePackage{epsf}               % pour mettre des figures en eps (mais pas sûr que cela marche)
\RequirePackage{caption}            % pour redéfinir simplement les styles des captions (LIRE LA DOC CA A L'AIR COOL!!!)
\RequirePackage[dvipsnames, table]{xcolor}  % pour les couleurs (VOIR LA DOC)
\RequirePackage{colortbl}           % colorier cases tableau
\RequirePackage{array}              % pour de nouveaux styles de centrage des tableaux
\RequirePackage[squaren]{SIunits}   % pour des commandes sur les unités SI
\RequirePackage{sistyle}            % permet utilisation de \num et autres commandes pour les unités SI aussi
\RequirePackage{journals}           % un package à moi pour définir les journaux avec les commandes de bibtex ADS
\RequirePackage[square,numbers]{natbib}    % utiliser \citet ou \citep   (VOIR LA DOC CAR PEUT FAIRE MIEUX!!!)
%\RequirePackage{draftwatermark}     % pour mettre des fifligranes dans le document
\RequirePackage{subfig}             % pour mettre des sous figure dans un fig
\RequirePackage{fancybox}           % pour redéfinir les styles des boîtes
\RequirePackage{commperso}          % mon package de commandes persos et de raccourcis
\RequirePackage{xspace}             % pour bien gérer les espaces après les commandes ajoutant du texte
\RequirePackage[francais]{layout}   % pour avoir les descriptions des tailles des commandes de longueurs
\RequirePackage{lastpage}           % pour avoir la dernière page où autre chose
\RequirePackage{sectsty}
\RequirePackage{eso-pic}            % pour de jolies marges
\RequirePackage{pgf,tikz}
\RequirePackage{fix-cm}             % outrepasse les limites de tailles des font de types cmr
\RequirePackage{ifthen}
\RequirePackage[a4paper]{geometry}
\RequirePackage[colorinlistoftodos,shadow]{todonotes}
%\RequirePackage{figure}

% redéfinition des marges pour être équilibrées sur chaque bord

% numerotation des equations et des sections
\numberwithin{equation}{section}

\setlength\arrayrulewidth{1.5pt}
%\addtolength{\textwidth}{2cm}
\chapterfont{\color{part}{}}%\fontfamily{}\fontseries{}\fontshape{}\selectfont}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
\renewcommand{\chaptermark}[1]{\markright{#1}}


\hypersetup{                  % paramétrage des hyperliens
    colorlinks=true,          % colorise les liens
    breaklinks=false,         % permet les retours à la ligne pour les liens trop longs
    urlcolor= blue,           % couleur des hyperliens
    linkcolor= vior,          % couleur des liens internes aux documents (index, figures, tableaux, équations,...)
    citecolor= bleuf,         % couleur des liens vers les références bibliographiques
    %pdfpagemode = FullScreen,% afficher le pdf en plein écran
    pdfauthor   = {Manuel Duarte},%
    pdftitle    = {Mémoire de thèse},%
    pdfsubject  = {Mémoire de thèse},%
    pdfkeywords = {Mémoire de thèse},%
    pdfcreator  = {PDFLaTeX},%
    pdfproducer = {PDFLaTeX}%
}

\makeatletter
\renewcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \color{\parttoccolor}\def\@linkcolor{\parttoccolor}%
       \large\bfseries{\mathversion{bold}#1}\hfil
       \hb@xt@\@pnumwidth{\hss
       \def\@linkcolor{\parttoccolor}\color{\parttoccolor}#2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      \def\@linkcolor{\chaptertoccolor}%
      \color{\chaptertoccolor}{\mathversion{bold}#1}\nobreak\
       \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfil\nobreak\hb@xt@\@pnumwidth{\hss
        \def\@linkcolor{\chaptertoccolor}%
        \color{\chaptertoccolor}#2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont #5}%
     \par}%
  \fi}
\renewcommand*\l@section{\color{\sectiontoccolor}\def\@linkcolor{\sectiontoccolor}\@dottedtocline{1}{1.5em}{2.3em}}
\renewcommand*\l@subsection{\color{\subsectiontoccolor}\def\@linkcolor{\subsectiontoccolor}\@dottedtocline{1}{4em}{2.3em}}
\def\contentsline#1#2#3#4{%
  \ifx\\#4\\%
    \csname l@#1\endcsname{#2}{#3}%
  \else
      \csname l@#1\endcsname{\hyper@linkstart{link}{#4}{#2}\hyper@linkend}{%
        \hyper@linkstart{link}{#4}{#3}\hyper@linkend
      }%
  \fi
}
\makeatother
%
% commande pour générer le titre du document
\newcommand{\titre}[1]{\noindent{\cvert{\begin{center}\rule{\textwidth}{0.13cm}
\huge{\bfseries{{#1}\xspace}}
\rule{\textwidth}{0.13cm}\end{center}}}}
