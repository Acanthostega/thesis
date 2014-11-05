\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{bart}[21/02/2014 Class for the thesis]

% the base class is the book class and all options passed too the
% bart thesis class will be passed to book
\LoadClassWithOptions{book}
%
\RequirePackage[english]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage{ucs}
\RequirePackage[utf8x]{inputenc}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amscd}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage[dvipsnames, table]{xcolor}
\RequirePackage[sort]{natbib}
\RequirePackage{subfig}
\RequirePackage{fancybox}
\RequirePackage{eso-pic}
\RequirePackage{pgf,tikz}
\RequirePackage{fix-cm}
\RequirePackage{ifthen}
\RequirePackage[a4paper]{geometry}
\RequirePackage{minted}%
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{wrapfig}
\RequirePackage{relsize}
\RequirePackage{hyphenat}
\RequirePackage[framemethod=Tikz]{mdframed}
\RequirePackage{newfloat}
\RequirePackage[linktocpage]{hyperref}
\usetikzlibrary{calc}
\usetikzlibrary{fit,backgrounds}
\usetikzlibrary{shadows}
%
% To define all commands relative to the bart theme for thesis
%
% Don't touch here, dummy variables used in the rest of the theme
\newlength{\barttemp}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% commands for fancy caption
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{caption}{RGB}{245,222,179}
\captionsetup[figure]{box=colorbox,boxcolor=caption,slc=off}
\let\oldcaption=\caption%
\renewcommand{\caption}[1]{{\oldcaption{\footnotesize#1}}}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% useful commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\ifempty}[3]{\ifx#1\empty#2\else#3\fi}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% commands for the color of the different part of the
% thesis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\thebartchaptercolor}{}
\newcommand{\bartchaptercolor}[1]{\renewcommand*{\thebartchaptercolor}{#1}}
\newcommand{\thebartsectioncolor}{}
\newcommand{\bartsectioncolor}[1]{\renewcommand*{\thebartsectioncolor}{#1}}
\newcommand{\thebartsubsectioncolor}{}
\newcommand{\bartsubsectioncolor}[1]{\renewcommand*{\thebartsubsectioncolor}{#1}}
\newcommand{\thebartsubsubsectioncolor}{}
\newcommand{\bartsubsubsectioncolor}[1]{\renewcommand*{\thebartsubsubsectioncolor}{#1}}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define the geometry of the thesis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength\thebartinner
\newlength\thebartouter
\newlength\thebarttop
\newlength\thebartbottom
\setlength\thebartouter{2.75cm}
\setlength\thebartinner{2cm}
\setlength\thebarttop{4cm}
\setlength\thebartbottom{2cm}
\newcommand\bartinner[1]{\renewcommand*{\thebartinner}{#1}}
\newcommand\bartouter[1]{\renewcommand*{\thebartouter}{#1}}
\newcommand\bartbottom[1]{\renewcommand*{\thebartbottom}{#1}}
\newcommand\barttop[1]{\renewcommand*{\thebarttop}{#1}}
\geometry{includefoot=true}
\geometry{headsep=0cm, headheight=53pt}
\geometry{footskip=0cm}
\setlength\evensidemargin{\thebartouter - 1in - \hoffset}
\setlength\oddsidemargin{\thebartinner - 1in - \hoffset}
\setlength\textwidth{\paperwidth - \thebartouter -\thebartinner}
\setlength\topmargin{\thebarttop - 1in -\voffset -\headheight - \headsep}
\setlength\textheight{\paperheight -\footskip -\thebartbottom -\thebarttop}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Put an image at the start of chapter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First start by defining a command with title of chapter
% in argument to create the chapter
% The user has just to use the command \bartchapterimage with the path
% to the image to put it as title for the chapter
\newlength{\barttitlelabel}
\newlength{\thechapterinnerlabelx}
\newlength{\thechapterinnerlabely}
\newlength{\thechaptertitlelabelx}
\newlength{\thechaptertitlelabely}
\newlength\thechaptertitleblank
\newlength\thechapterlength
\setlength\thechapterinnerlabelx{15pt}
\setlength\thechapterinnerlabely{10pt}
\setlength\thechaptertitlelabelx{15pt}
\setlength\thechaptertitlelabely{10pt}
\setlength\thechaptertitleblank{2cm}
\setlength\thechapterlength{\paperwidth}
\addtolength\thechapterlength{-\thechaptertitleblank}
\addtolength\thechapterlength{-2\thechapterinnerlabelx}
\tikzset{bartchaptertitle/.style={%
    rectangle,
    draw,
    color=white,
    fill=white,
    opacity=0.7,
    rounded corners=0.75cm
}}
\tikzset{bartchapterlabel/.style={%
    rectangle,
    draw,
    color=white,
    fill=white,
    opacity=0.7,
    rounded corners=0.25cm
}}
\newcommand{\thechapterimage}{}
\newcommand{\thechapterheadfont}{\fontfamily{ugq}\fontsize{24pt}{30pt}\selectfont}
\newcommand{\thechapterstyle}{\color{red!60!black}}
\newcommand{\bartchapterimage}[1]{\renewcommand*{\thechapterimage}{#1}}
\newcommand{\bartchapterheadfont}[1]{\renewcommand*{\thechapterheadfont}{#1}}
\newcommand{\bartchapterstyle}[1]{\renewcommand*{\thechapterstyle}{#1}}
\newcommand{\bartchapter}[1]{%
    \thispagestyle{empty}
    \def\thebartchapterlabel{\thechapterheadfont\chaptertitlename~\chapterlabel}
    \settowidth\barttemp{\thebartchapterlabel}
    \setlength{\barttitlelabel}{-\barttemp}
    \addtolength\barttitlelabel{-2\thechapterinnerlabelx}
    \addtolength\barttitlelabel{\paperwidth}
    \begin{tikzpicture}[overlay,remember picture]
        \begin{scope}
            \clip(current page.north west) rectangle ($ (current page.north east) + (0cm,-9cm)$);
            \fill[black!20] (current page.north west) rectangle
            ($ (current page.north east) + (0cm,-9cm)$);
            \node[below=-0.35cm] (block) at (current page.north)
            {\ifempty{\thechapterimage}{}{\includegraphics[height=9cm, width=\paperwidth]{\thechapterimage}}};
        \end{scope}
        \begin{scope}
            % for the text of the chapter title
            \node[
                right=\thechaptertitleblank,
                inner ysep=\thechaptertitlelabely,
                inner xsep=\thechaptertitlelabelx,
                bartchaptertitle
            ] at ($ (current page.north west) + (0cm,-7cm)$)
            {%
                    \thechapterheadfont\phantom{%
                        \begin{minipage}{\thechapterlength}
                            {\thechapterheadfont\thechapterstyle#1}
                        \end{minipage}
                    }
                    \hspace{\thechapterlength}\null
            };
            \node[
                right=\thechaptertitleblank,
                inner ysep=\thechaptertitlelabely,
                inner xsep=\thechaptertitlelabelx,
            ] at ($ (current page.north west) + (0cm,-7cm)$)
            {%
                \begin{minipage}{\thechapterlength}
                    {\thechapterheadfont\thechapterstyle#1}
                \end{minipage}
            };

            % the text for the label and number of the title
            \ifempty{\chapterlabel}{}
            {%
                \node[
                    left=\barttitlelabel,
                    inner ysep=\thechapterinnerlabely,
                    inner xsep=\thechapterinnerlabelx,
                    bartchapterlabel
                ] at ($ (current page.north east) + (0cm,-1cm)$)
                {\thechapterheadfont\phantom{\chapterlabel}\hspace{5.5cm}\null};
                \node[
                    left=\barttitlelabel,
                    inner ysep=\thechapterinnerlabely,
                    inner xsep=\thechapterinnerlabelx,
                ] at ($ (current page.north east) + (0cm,-1cm)$)
                {\thechapterstyle\thebartchapterlabel};
            }
        \end{scope}
    \end{tikzpicture}
}
% now specify format
\titleformat{\chapter}
    {\gdef\chapterlabel{}}
    {\gdef\chapterlabel{\thechapter.\ }}
    {0pt}
    {\bartchapter}
    {}
\titlespacing*{\chapter}{0pt}{0pt}{5cm}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% the definition for the section
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\titleformat{\section}
{\color{\thebartsectioncolor}\normalfont\Large\bfseries}
{\color{\thebartsectioncolor}\thesection}
{1em}
{}
\titleformat{\subsection}
{\color{\thebartsubsectioncolor}\normalfont\large\bfseries}
{\color{\thebartsubsectioncolor}\thesubsection}
{1em}
{}
\titleformat{\subsubsection}
{\color{\thebartsubsubsectioncolor}\normalfont\normalsize\bfseries}
{\color{\thebartsubsubsectioncolor}\thesubsubsection}
{1em}
{}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% To place the page number according to the parity of the page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The user has just to set the command \bartthumb to the path for the
% thumbnail image he wants has background for the page number.
\newlength{\bartsquare}% square length
\setlength{\bartsquare}{\marginparwidth}% impose square length
\makeatletter%
\newcommand{\thethumbnail}{}
\newcommand{\thepagenumberfont}{\fontfamily{ugq}\fontsize{24pt}{30pt}\selectfont}
\newcommand{\bartpagenumberfont}[1]{\renewcommand*{\thepagenumberfont}{#1}}
\newcommand{\thepagenumberstyle}{\thepagenumberfont\color{red!60!black}}
\newcommand{\bartthumb}[1]{\renewcommand*{\thethumbnail}{#1}}
\newcommand{\bartpagenumber}{%
    \begin{tikzpicture}[overlay,remember picture]
        \begin{scope}
        \ifodd\c@page{%
            \foreach \myi/\op in {0/1.,1/0.8,2/0.6,3/0.4,4/0.2} {%
                \node[opacity=\op] at ($ (current page.north east) + ( -0.5\bartsquare-\myi\bartsquare, -0.5\bartsquare ) $)
                {\ifempty{\thethumbnail}{}{\includegraphics[height=\bartsquare, width=\bartsquare]{\thethumbnail}}};
                \node[opacity=\op] at ($ (current page.north east) + ( -0.5\bartsquare-\myi\bartsquare, -0.5\bartsquare ) $)
                {\thepagenumberstyle\thepage};
            }%
        }%
        \else{%
            \foreach \myi/\op in {0/1.,1/0.8,2/0.6,3/0.4,4/0.2} {%
                \node[opacity=\op] at ($ (current page.north west) + ( 0.5\bartsquare+\myi\bartsquare, -0.5\bartsquare ) $)
                {\ifempty{\thethumbnail}{}{\includegraphics[height=\bartsquare, width=\bartsquare]{\thethumbnail}}};
                \node[opacity=\op] at ($ (current page.north west) + ( 0.5\bartsquare+\myi\bartsquare, -0.5\bartsquare ) $)
                {\thepagenumberstyle\thepage};
            }%
        }\fi
        \end{scope}
    \end{tikzpicture}
}%
\makeatother%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% To set the filigran of the thesis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter%
\newlength{\barthhl}
\newlength{\bartwwl}
\newlength{\barthhr}
\newlength{\bartwwr}
\newcommand{\thefiligranleft}{}
\newcommand{\thefiligranright}{}
\newcommand{\thefiligrancolor}{}
\newcommand\thefiligranfontsize{\fontsize{3.5cm}{3.5cm}\bf}
\newcommand{\bartfiligranleft}[1]{\renewcommand*{\thefiligranleft}{#1}}
\newcommand{\bartfiligranright}[1]{\renewcommand*{\thefiligranright}{#1}}
\newcommand{\bartfiligrancolor}[1]{\renewcommand*{\thefiligrancolor}{#1}}
\newcommand{\bartfiligranfontsize}[1]{\renewcommand*{\thefiligranfontsize}{#1}}
\newcommand{\bartfiligran}{%
    % The text for the number to appear
    \settoheight{\barthhr}{{\thefiligranfontsize\color{\thefiligrancolor}\thefiligranright}}
    \settowidth{\bartwwr}{{\thefiligranfontsize\color{\thefiligrancolor}\thefiligranright}}
    \settoheight{\barthhl}{{\thefiligranfontsize\color{\thefiligrancolor}\thefiligranleft}}
    \settowidth{\bartwwl}{{\thefiligranfontsize\color{\thefiligrancolor}\thefiligranleft}}
    \begin{tikzpicture}[overlay,remember picture]
        \begin{scope}
        \ifodd\c@page{%
            \node[shift={(-0.49\barthhr,0.51\bartwwr)},rotate=90] at
            ($ (current page.south east) $)
            {{\thefiligranfontsize\color{black!25}\thefiligranright}};
            \node[opacity=1,shift={(-0.5\barthhr,0.5\bartwwr)},rotate=90] at
            ($ (current page.south east) $)
            {{\thefiligranfontsize\color{\thefiligrancolor!35!white}\thefiligranright}};
        }%
        \else{%
            \node[shift={(0.49\barthhl,0.49\bartwwl)},rotate=-90] at
            ($ (current page.south west) $)
            {{\thefiligranfontsize\color{black!25}\thefiligranleft}};
            \node[opacity=1,shift={(0.5\barthhl,0.5\bartwwl)},rotate=-90] at
            ($ (current page.south west) $)
            {{\thefiligranfontsize\color{\thefiligrancolor!35!white}\thefiligranleft}};
        }\fi
        \end{scope}
    \end{tikzpicture}
}%
\makeatother
% apply it on all pages with this command
\newcommand{\bartsetfiligran}
{%
    \AddToShipoutPicture{%
        \bartfiligran%
    }%
}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A box for the title
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Box at right position
\newlength\thebartrboxinnerx
\newlength\thebartrboxinnery
\newlength\thebartrboxgapx
\setlength\thebartrboxinnerx{10pt}
\setlength\thebartrboxinnery{20pt}
\setlength\thebartrboxgapx{0.8cm}
\newcommand{\thebartrboxfont}{\bfseries}
\newcommand{\bartrboxfont}[1]{\renewcommand*{\thebartrboxfont}{#1}}
\tikzstyle{bartrbox} = [draw=black!50, fill=black!90, thick,
rectangle, inner sep=\thebartrboxinnerx, inner ysep=\thebartrboxinnery,
text=orange, opacity=0.5, font=\relsize{4}, text opacity=1]
\newcommand\bartrbox[4]{
    \begin{tikzpicture}[overlay, remember picture]
        \node[bartrbox, #4](box) at ($ (current page.north east) +
        (-0.5 #2 -\thebartrboxgapx, -#3) + (-\thebartrboxinnerx, 0) $){
            \begin{minipage}{#2}
                \thebartrboxfont\nohyphens{#1}
            \end{minipage}
        };
    \end{tikzpicture}
}%
%
% Box at left position
\newlength\thebartlboxinnerx
\newlength\thebartlboxinnery
\newlength\thebartlboxgapx
\setlength\thebartlboxinnerx{10pt}
\setlength\thebartlboxinnery{20pt}
\setlength\thebartlboxgapx{1.5cm}
\newcommand{\thebartlboxfont}{}
\newcommand{\bartlboxfont}[1]{\renewcommand*{\thebartlboxfont}{#1}}
\tikzstyle{bartlbox} = [draw=black!50, fill=black!90, thick,
rectangle, inner xsep=\thebartlboxinnerx, inner ysep=\thebartlboxinnery,
text=orange, opacity=0.5, text opacity=1]
\newcommand\bartlbox[4]{
    \begin{tikzpicture}[overlay, remember picture]
        \node[bartlbox, #4](box) at ($ (current page.north west) +
        (0.5 #2 + \thebartlboxgapx, -#3) + (\thebartlboxinnerx, 0) $){
            \begin{minipage}{#2}
                \thebartlboxfont\nohyphens{#1}
            \end{minipage}
        };
    \end{tikzpicture}
}%
%
% Commands for the title of the thesis
\newlength\thebartthesistitlegapy
\newlength\thebartthesistitlewidth
\setlength\thebartthesistitlegapy{10cm}
\setlength\thebartthesistitlewidth{12cm}
\newcommand{\bartthesistitle}[1]{\renewcommand*{\thebartthesistitle}{#1}}
\newcommand{\thebartthesistitle}{}
\newcommand{\bartthesistitlefont}[1]{\renewcommand*{\thebartrboxfont}{#1}}
\tikzstyle{bartthesistitle} = []
\newcommand{\bartthesistitletikzstyle}[1]{\tikzstyle{bartthesistitle}=[#1]}
% Commands for the administration part
\newlength\thebartadministrationgapy
\newlength\thebartadministrationwidth
\setlength\thebartadministrationgapy{1cm}
\setlength\thebartadministrationwidth{10cm}
\newcommand{\thebartadministration}{}
\newcommand{\bartadministration}[1]{\renewcommand*{\thebartadministration}{#1}}
\newcommand{\bartadministrationboxfont}[1]{\renewcommand*{\thebartlboxfont}{#1}}
\tikzstyle{bartadministration} = []
\newcommand{\bartadministrationtikzstyle}[1]{\tikzstyle{bartadministration}=[#1]}
% commands for the author of the thesis
\newcommand{\thebartauthor}{}
\newcommand{\bartauthor}[1]{\renewcommand*{\thebartauthor}{#1}}
% commands for the director of the thesis
\newcommand{\thebartdirector}{}
\newcommand{\bartdirector}[1]{\renewcommand*{\thebartdirector}{#1}}
% commands for the school
\newcommand{\thebartschool}{}
\newcommand{\bartschool}[1]{\renewcommand*{\thebartschool}{#1}}
% commands for the PhD thesis
\newcommand{\thebartphdthesis}{}
\newcommand{\bartphdthesis}[1]{\renewcommand*{\thebartphdthesis}{#1}}
% commands for the jury
\newcommand{\thebartjury}{}
\newcommand{\bartjury}[1]{\renewcommand*{\thebartjury}{#1}}
% commands for the box for other administration
\newlength\thebartschoolgapy
\newlength\thebartschoolwidth
\setlength\thebartschoolgapy{16cm}
\setlength\thebartschoolwidth{14cm}
\tikzstyle{bartschool} = []
\newcommand{\bartschooltikzstyle}[1]{\tikzstyle{bartschool}=[#1]}
\newcommand{\bartschoolboxtext}{%
    \thebartschool\\
    \noindent\rule{\linewidth}{1pt}\\
    \textbf{PhD thesis}\\
    \thebartphdthesis%
}
\newcommand{\bartschoolboxfont}[1]{\renewcommand*{\thebartlboxfont}{#1}}
% commands for peoples
\newlength\thebartpeoplegapy
\newlength\thebartpeoplewidth
\setlength\thebartpeoplegapy{20cm}
% \setlength\thebartpeoplewidth{14cm}
\tikzstyle{bartpeople}=[]
\newcommand{\bartpeopletikzstyle}[1]{\tikzstyle{bartpeople}=[#1]}
\newcommand{\bartpeopleboxtext}{%
    {\bfseries\thebartauthor}\\
    \noindent\rule{\linewidth}{1pt}\\
    \textbf{Director:}\\
    \thebartdirector\\
    \noindent\rule{\linewidth}{1pt}\\
    \textbf{Jury:}\\
    \thebartjury%
    \\
    \\
    \small
    Last modified: \today
}
\newcommand{\bartpeopleboxfont}[1]{\renewcommand*{\thebartlboxfont}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define the background for titlepage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\tikzset{barttitlebackground/.style={opacity=0.7,very thick,yellow!35!black,fill=#1}}
\newcommand{\barttitlebackground}[2]{%
    \begin{tikzpicture}[overlay, remember picture]
        \begin{scope}
            \clip(current page.north west) rectangle ($ (current page.north east) + (\paperwidth,-\paperheight)$);
            \fill[#1] (current page.north west) rectangle
            ($ (current page.north east) + (\paperwidth,-\paperheight)$);
        \end{scope}
        \begin{scope}
            \draw[barttitlebackground]
            (current page.south west) grid[step=#2]
            (current page.north east);
        \end{scope}
    \end{tikzpicture}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% To place random words into the background
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\tikzset{
    distort/.style={
        rotate=rand*10,
        yslant=rand/3,
        xslant=rand/3,
        xscale=1+rand/4,
        yscale=1+rand/4,
        %execute at begin node={%
            %\pgfmathrandomitem{\newfont}{fonts}\newfont%
        %}
    }
}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A random  background for text and formulas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [1]: the number of text to place at random
% [2]: the list of words to place at random
% [3]: the seed used for the random generation and selection
\newcommand{\thebartbackgroundnumber}{50}
\newcommand{\thebartbackgroundseed}{10}
\newcommand{\thebartbackgroundlist}{}
\newcommand{\bartbackgroundlist}[1]{\renewcommand*{\thebartbackgroundlist}{#1}}
\newcommand{\bartbackgroundseed}[1]{\renewcommand*{\thebartbackgroundseed}{#1}}
\newcommand{\bartbackgroundnumber}[1]{\renewcommand*{\thebartbackgroundnumber}{#1}}
\newcommand{\bartbackground}{%
    \begin{tikzpicture}[overlay,remember picture]
        \begin{scope}
            \pgfmathsetseed{\thebartbackgroundseed}%
            \pgfmathdeclarerandomlist{words}{\thebartbackgroundlist}%
            \pgfmathdeclarerandomlist{fonts}{{\bf}{\tt}{\rm}{\sf}{\bf}{\tt}{\rm}{\sf}{\bf}{\tt}{\rm}{\sf}}
            \foreach \a in {1,...,\thebartbackgroundnumber}{%
                \pgfmathrandomitem{\mywd}{words}
                \pgfmathrandomitem{\newfont}{fonts}
                \pgfmathsetmacro{\x}{0.5*rand}%
                \pgfmathsetmacro{\y}{0.5*rand}%
                \pgfmathsetmacro{\opacity}{0.5+0.5*(0.5*rand+0.5)}%
                \pgfmathrandominteger{\b}{40}{80}
                \pgfmathrandominteger{\c}{40}{80}
                \pgfmathrandominteger{\d}{0}{100}
                \node[color=red!\d!yellow,
                    opacity=\opacity,
                    distort
                ] at ($(current page.center)+(\x\paperwidth, \y\paperheight)$)
                    {\newfont\fontsize{\b}{\c}\selectfont\mywd};
            }
        \end{scope}
    \end{tikzpicture}
}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% To place a text for title at left
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength\thebarttitlerightinnerx
\newlength\thebarttitlerightinnery
\newlength\thebarttitle
\setlength\thebarttitlerightinnerx{10pt}
\setlength\thebarttitlerightinnery{10pt}
\newcommand{\thebarttitlestyle}{\color{red!60!black}}
\newcommand{\thebarttitlefont}{\fontfamily{ugq}\fontsize{24pt}{30pt}\selectfont}
\newcommand{\barttitlefont}[1]{\renewcommand*{\thebarttitlefont}{#1}}
\newcommand{\barttitlestyle}[1]{\renewcommand*{\thebarttitlestyle}{#1}}
\tikzset{thebarttitleright/.style={rectangle,draw,color=white,fill=white,opacity=0.7}}
\tikzset{barttitleright/.style={}}
\newcommand{\barttitleright}[2]{%
    \settowidth\barttemp{\thebarttitlefont#1}
    \setlength\thebarttitle{-\barttemp}
    \addtolength\thebarttitle{-2\thebarttitlerightinnerx}
    \addtolength\thebarttitle{\paperwidth}
    \begin{tikzpicture}[overlay,remember picture]
        \begin{scope}
            \node[right=\thebarttitle,inner ysep=\thebarttitlerightinnery,
            inner xsep=\thebarttitlerightinnerx, thebarttitleright, barttitleright] at ($ (current page.north west) + (-1cm,-#2)$)
            {\thebarttitlefont\vphantom{pb}\phantom{#1}\makebox[2cm]{}};
            \node[right=\thebarttitle,inner ysep=\thebarttitlerightinnery,inner xsep=\thebarttitlerightinnerx] at ($ (current page.north west) + (0cm,-#2)$)
            {\thebarttitlefont\thebarttitlestyle#1};
        \end{scope}
    \end{tikzpicture}
}
%
\newlength\thebarttitleleftinnerx
\newlength\thebarttitleleftinnery
\setlength\thebarttitleleftinnerx{10pt}
\setlength\thebarttitleleftinnery{10pt}
\tikzset{thebarttitleleft/.style={rectangle,draw,color=white,fill=white,opacity=0.7}}
\tikzset{barttitleleft/.style={}}
\newcommand{\barttitleleft}[2]{%
    \settowidth\barttemp{\thebarttitlefont#1}
    \setlength\thebarttitle{-\barttemp}
    \addtolength\thebarttitle{-2\thebarttitlerightinnerx}
    \addtolength\thebarttitle{\paperwidth}
    \begin{tikzpicture}[overlay,remember picture]
        \begin{scope}
            \node[left=\thebarttitle,inner ysep=\thebarttitleleftinnery,
            inner xsep=\thebarttitleleftinnerx, thebarttitleleft, barttitleleft] at ($ (current page.north east) + (0cm,-#2)$)
            {\thebarttitlefont\vphantom{pb}\phantom{#1}\makebox[2cm]{}};
            \node[left=\thebarttitle,inner ysep=\thebarttitleleftinnery,inner xsep=\thebarttitleleftinnerx] at ($ (current page.north east) + (0cm,-#2)$)
            {\thebarttitlefont\thebarttitlestyle#1};
        \end{scope}
    \end{tikzpicture}
}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title of the thesis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\barttitle}[1]{
    \begin{tikzpicture}[overlay,remember picture]
        \fill[black!90, opacity=0.5] ($ (curent page.north east) + (0cm, -4cm)$) rectangle
        ($ (current page.north east) + (-10cm,-9cm)$);
    \end{tikzpicture}
}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define the title image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\thebartimagewidth}
\newlength{\thebartimageheight}
\newlength\theimageheight
\newlength\theimagewidth
\setlength\thebartimageheight{0.33\paperheight}
\setlength\thebartimagewidth{\paperwidth}
\newcommand{\thebarttitleimage}{}
\newcommand{\barttitlepageimage}[1]{\renewcommand*{\thebarttitleimage}{#1}}
\newcommand{\barttitleimage}{%
    \def\myimage{\includegraphics[width=\paperwidth]{\thebarttitleimage}}
    \settowidth\theimagewidth{\myimage}
    \settoheight\theimageheight{\myimage}
    \begin{tikzpicture}[overlay,remember picture]
        \begin{scope}
            \node[] at ($ (current page.north west) + (0.5\theimagewidth, -0.5\theimageheight) $)
            {\myimage};
        \end{scope}
    \end{tikzpicture}
}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Defines correctly the styles of toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\titlecontents{chapter}[1.25cm]
{\addvspace{15pt}\large\bfseries}
{\color{\thebartchaptercolor}\contentslabel[\Large\thecontentslabel]{1.25cm}}
{}
{\color{\thebartchaptercolor}\normalsize\bfseries\titlerule*[2pc]{.}\thecontentspage}
%
\titlecontents{section}[1.75cm]
{\bfseries}
{\color{\thebartsectioncolor}\contentslabel[\thecontentslabel]{1.25cm}}
{}
{\color{\thebartsectioncolor}\titlerule*[1pc]{.}\thecontentspage}
%
\titlecontents{subsection}[2cm]
{}
{\color{\thebartsubsectioncolor}\contentslabel[\thecontentslabel]{1.25cm}}
{}
{\color{\thebartsubsectioncolor}\titlerule*[.5pc]{.}\thecontentspage}
%
\titlecontents{subsubsection}[2.25cm]
{}
{\color{\thebartsubsubsectioncolor}\contentslabel[\thecontentslabel]{1.25cm}}
{}
{\color{\thebartsubsubsectioncolor}\titlerule*[.25pc]{.}\thecontentspage}

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% To define style of header en footer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Define the style of odd pages with chapter and even with section
\newcommand{\bartheader}[5]{%
    \ifthenelse{\equal{#1}{}}{}{%
        \begin{tikzpicture}[remember picture]
            \node[
                fill=#2,
                opacity=#4,
                drop shadow,
                rounded corners=#5,
                shift={(0.,20pt)},
                inner sep=10pt
            ] at (0.,0.) {{\color{#3}#1}};
    \end{tikzpicture}
    }%
}
%
% Redefine the chapter title for the header
\renewcommand{\chaptermark}[1]{\markboth{\textbf{\chaptertitlename~\thechapter.}~#1}{}}
%
% No lines to separate the header
\renewcommand{\headrulewidth}{0pt}
%
% define styles for header
\fancypagestyle{bart}{%
    \fancyhf{}
    \fancyhead[LE]{\bartpagenumber\bartheader{\rightmark}{\thebartsectioncolor}{white}{1}{0.3cm}}%
    \fancyhead[RO]{\bartpagenumber\bartheader{\leftmark}{\thebartchaptercolor}{white}{1}{0.3cm}}%
    \fancyfoot[LO]{}
    \fancyfoot[RE]{}
}%
%
% leave the header empty after
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For hyperlinks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\hypersetup{                  % paramétrage des hyperliens
    colorlinks=true,          % colorise les liens
    breaklinks=false,         % permet les retours à la ligne pour les liens trop longs
    urlcolor= \thebartsectioncolor,           % couleur des hyperliens
    linkcolor= \thebartchaptercolor,          % couleur des liens internes aux documents (index, figures, tableaux, équations,...)
    citecolor= \thebartsubsubsectioncolor,         % couleur des liens vers les références bibliographiques
    %pdfpagemode = FullScreen,% afficher le pdf en plein écran
    pdfauthor   = {\thebartauthor},%
    pdftitle    = {\thebartthesistitle},%
    pdfsubject  = {\thebartphdthesis},%
    pdfkeywords = {Thesis},%
    pdfcreator  = {PDFLaTeX},%
    pdfproducer = {PDFLaTeX}%
}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create some box for useful things
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Define the boxes
\newcommand{\bartdefbox}[3]{%
    \newmdenv[
        backgroundcolor=#1!10,
        innerleftmargin=5pt,
        innerrightmargin=5pt,
        innertopmargin=5pt,
        innerbottommargin=5pt,
        leftmargin=0cm,
        rightmargin=0cm,
        linecolor=#1,
        outerlinewidth=.1pt,
        roundcorner=4pt,
        skipabove=\baselineskip,
        skipbelow=\baselineskip,
    ]{#2}
    \newmdenv[
        skipabove=7pt,
        skipbelow=7pt,
        rightline=false,
        leftline=true,
        topline=false,
        bottomline=false,
        backgroundcolor=#1!10,
        innerleftmargin=5pt,
        innerrightmargin=5pt,
        innertopmargin=5pt,
        innerbottommargin=5pt,
        leftmargin=0cm,
        rightmargin=0cm,
        linewidth=4pt,
        linecolor=#1,
        skipabove=\baselineskip,
        skipbelow=\baselineskip,
        frametitle=#3,
    ]{internal#2}
}
%
% define the environment for the box
\newcommand{\bartenvbox}[5]{%
    \ifthenelse{\equal{#4}{true}}{%
        \newcounter{c#2}
        \setcounter{c#2}{1}
    }
    {}
    \ifthenelse{\equal{#5}{true}}{%
        \DeclareFloatingEnvironment[placement={!ht}]{float#2}
    }
    {}
    \bartdefbox{#1}{box#2}{{\textbf{#3}
            \ifthenelse{\equal{#4}{true}}{\textbf{\expandafter\csname thec#2\endcsname}
                \refstepcounter{c#2}
            }%
    {}}}
    \newenvironment{#2}{%
        \ifthenelse{\equal{#5}{true}}{\begin{float#2}}{}
        \begin{box#2}
            \begin{internalbox#2}
                \setlength{\parindent}{1em}
    }{%
                \hfill{%
                    \color{#1}\tiny\ensuremath{\blacksquare}
                }
            \end{internalbox#2}
        \end{box#2}
        \ifthenelse{\equal{#5}{true}}{\end{float#2}}{}
    }
}
%
% Define some useful boxes
\bartenvbox{black}{bartabstract}{Abstract}{false}{false}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% To put a note with a note style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{couleurPostIt}{rgb}{.9,.9,.35}
\tikzset{fondPostit/.style={color= couleurPostIt}}
\tikzset{ombrePunaise/.style={color={blue!10!gray}}}
\tikzset{ombrePostit/.style={color={black},opacity=.5}}
\tikzset{punaise/.style={ball color=red}}
\newcommand{\epingle}[3]{
\coordinate[rotate=#2,yshift={#3*0.375cm}] (e) at #1;
\coordinate[shift={++(60:0.75)}] (g) at (e);
\begin{scope} [scale=1.5]
 \begin{scope}[rotate=-30]
   \coordinate[shift={++(30:0.75)}] (h) at (e);
   \draw[ombrePunaise,line cap=round,line width=4pt] (e) -- ++(60:0.75);
   \fill [ombrePunaise,rotate=-30,scale=0.5] (h) ellipse (.65 and .3) ;
   \fill [ombrePunaise,rotate=60,scale=0.5] (h) ++(0.4,0) ellipse (.4 and .3);
   \fill [ombrePunaise,rotate=60,scale=0.5] (h) ++(0.8,0) ellipse (.2 and .4);
 \end{scope}
 \draw[line cap=round,line width=4pt] (e) -- ++(60:0.75);
 \fill [punaise,rotate=-30,scale=0.5] (g) ellipse (.65cm and .3cm) ;
 \fill [punaise,rotate=60,scale=0.5] (g) ++(0.4,0) ellipse (.4 and .3);
 \fill [punaise,rotate=60,scale=0.5] (g) ++(0.8,0) ellipse (.2 and .4);
\end{scope}}
\tikzset{zlevel/.style={%
    execute at begin scope={\pgfonlayer{#1}},
        execute at end scope={\endpgfonlayer}
}}
\newlength{\mypostx}
\newcommand{\postit}[2]{%
    \setlength{\mypostx}{\marginparwidth}%
    \marginpar{%
    \begin{tikzpicture}[overlay,remember picture]%
        \begin{scope}%
            \node[opacity=0.7,inner sep=1em,rotate=#2,drop shadow,
                text width=\marginparwidth-2em](block)
                at (0.5\marginparwidth,0.){\color{black}#1};
            \fill[yellow!50!white] (block.north west) -- (block.north east)
                .. controls ($ (block.north east)+1.5*(block.west)$) ..
                  ($ 0.9*(block.south east) $)
                  .. controls ($ (block.south)$) ..
                  (block.south west) -- cycle;
            \node[inner sep=1em,rotate=#2,
                text width=\marginparwidth-2em]
                at (0.5\marginparwidth,0.){\color{black}#1};
            \epingle{($ (block.north)-(0.,1em) $)}{5}{0.5};
        \end{scope}%
    \end{tikzpicture}%
    }
}
