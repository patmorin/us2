%
% The JoCG article class to be used by authors for formatting articles
% appearing in the Journal of Computational Geometry.  The definitive
% version of this file is at http://jocg.org/jocg.cls
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{patmorin}
		[2009/05/11 v0.1a
 Pat Morin's article class]

\RequirePackage{fancyhdr}

% Get rid of some article.cls options
\DeclareOption{a4paper}{\OptionNotUsed}
\DeclareOption{a5paper}{\OptionNotUsed}
\DeclareOption{b5paper}{\OptionNotUsed}
\DeclareOption{letterpaper}{\OptionNotUsed}
\DeclareOption{legalpaper}{\OptionNotUsed}
\DeclareOption{executivepaper}{\OptionNotUsed}
\DeclareOption{landscape}{\OptionNotUsed}
\DeclareOption{twoside}{\OptionNotUsed}
\DeclareOption{titlepage}{\OptionNotUsed}
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{10pt}{\OptionNotUsed}
\DeclareOption{12pt}{\OptionNotUsed}

% The default action is to pass options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Process the options
\ProcessOptions

% Read the article class
\LoadClass[11pt,letterpaper]{article}

\RequirePackage{kpfonts}
\RequirePackage[sf,bf,small,raggedright,compact]{titlesec}
\RequirePackage[margin=3.75cm]{geometry}


% Commands for typesetting affiliations and email addresses
\newcommand{\affil}[1]{\textit{#1}}
\newcommand{\email}[1]{\texttt{#1}}

% Maketitle stuff
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \newpage
    \global\@topnum\z@   % Prevents figures from going at top of page.
    \@maketitle
    \@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

\renewcommand{\and}{\qquad}

\def\@maketitle{%
  \newpage
  \null
  \newlength{\@gnat}
  \setlength{\@gnat}{2em}
  \addtolength{\@gnat}{-0.4in}
  \vskip \@gnat%
  \begin{flushleft}%
  \let \footnote \thanks
    {\large\sffamily\bfseries \@title   \par}%
    \vskip 1.5em%
    {
      \lineskip .5em%
      {\normalsize\itshape\@author} \\[1em]
      {\normalsize \@date}
    }%
  \end{flushleft}%
  \par
  \vskip 1em}


% Abstract
\renewenvironment{abstract}
{\hrule\vskip 1ex \noindent\textsc{Abstract.}}{\vskip 1ex \hrule}




%--------------------------- Headers and Footers ------------------------
\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}
\fancyfoot[c]{\thepage}
%\fancyhead[L]{\sf Journal of Computational Geometry}
%\fancyhead[R]{\texttt{\href{http://jocg.org/}{jocg.org}}}
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{1pt}
\pagestyle{fancy}

\usepackage{marvosym}
\makeatletter
\renewcommand*{\@fnsymbol}[1]{\ensuremath{\ifcase#1 %
   %\or \text{\Sun}
   \or \text{\Mercury}
   %\or \text{\Venus}
   \or \text{\Earth}
   \or \text{\Mars}
   \or \text{\Jupiter}
   \or \text{\Saturn}
   \or \text{\Uranus}
   \or \text{\Neptune}
   \or \text{\Pluto}
  \else\@ctrerr\fi}}
\makeatother



%-------------------------- Stuff that used to be in pat.sty --------------

\usepackage{amsfonts}
\usepackage{amsthm}
\usepackage[longnamesfirst,numbers,sort&compress]{natbib}
\usepackage{hyperref}
\usepackage[dvipsnames]{color}
\definecolor{linkblue}{named}{MidnightBlue}
\hypersetup{colorlinks=true, linkcolor=linkblue,  anchorcolor=linkblue,
	citecolor=linkblue, filecolor=linkblue, menucolor=linkblue,
	urlcolor=linkblue}
\usepackage[capitalise]{cleveref}
\usepackage{paralist}
\usepackage[T1]{fontenc}
\usepackage[utf8x]{inputenc}
\usepackage{todonotes}

\allowdisplaybreaks


\newcommand{\ceil}[1]{\left\lceil#1\right\rceil}

\newtheorem{thm}{Theorem}{\bfseries}{\itshape}
\crefname{thm}{Theorem}{Theorems}


\newtheorem{lem}[thm]{Lemma}{\bfseries}{\itshape}
\crefname{lem}{Lemma}{Lemmas}
\newcommand{\lemlabel}[1]{\label{lem:#1}}
\newcommand{\lemref}[1]{Lemma~\ref{lem:#1}}

\newtheorem{conj}[thm]{Conjecture}{\bfseries}{\itshape}
\newcommand{\conjlabel}[1]{\label{lem:#1}}
\newcommand{\conjref}[1]{Conjecture~\ref{lem:#1}}

\newtheorem{cor}[thm]{Corollary}{\bfseries}{\itshape}
\newcommand{\corlabel}[1]{\label{cor:#1}}
\newcommand{\corref}[1]{Corollary~\ref{cor:#1}}

\newtheorem{obs}[thm]{Observation}{\bfseries}{\itshape}
\newcommand{\obslabel}[1]{\label{obs:#1}}
\newcommand{\obsref}[1]{Observation~\ref{obs:#1}}

\newtheorem{prop}[thm]{Proposition}{\bfseries}{\itshape}
\newcommand{\proplabel}[1]{\label{prop:#1}}
\newcommand{\propref}[1]{Proposition~\ref{prop:#1}}

\newtheorem{clm}[thm]{Claim}{\bfseries}{\itshape}
\newcommand{\clmlabel}[1]{\label{clm:#1}}
\newcommand{\clmref}[1]{Claim~\ref{clm:#1}}

\newtheorem{assumption}[thm]{Assumption}{\bfseries}{\rm}
\newenvironment{ass}{\begin{assumption}\rm}{\end{assumption}}
\newcommand{\asslabel}[1]{\label{ass:#1}}
\newcommand{\assref}[1]{Assumption~\ref{ass:#1}}

\newcommand{\proclabel}[1]{\label{alg:#1}}
\newcommand{\procref}[1]{Procedure~\ref{alg:#1}}

\theoremstyle{definition}

\newtheorem{defn}[thm]{Definition}
\newcommand{\deflabel}[1]{\label{rem:#1}}
\newcommand{\defref}[1]{Definition~\ref{rem:#1}}


\newtheorem{rem}[thm]{Remark}
\newcommand{\remlabel}[1]{\label{rem:#1}}
\newcommand{\remref}[1]{Remark~\ref{rem:#1}}

\newtheorem{lesson}[thm]{Lesson}
\newcommand{\leslabel}[1]{\label{les:#1}}
\newcommand{\lesref}[1]{Lesson~\ref{les:#1}}

\newtheorem{op}{Open Problem}
\newcommand{\oplabel}[1]{\label{op:#1}}
\newcommand{\opref}[1]{Open Problem~\ref{op:#1}}
\newtheorem{prb}{Problem}{\bfseries}{\rm}

\theoremstyle{plain}

\newcommand{\etal}{et al.}

\newcommand{\keywords}[1]{\noindent\textbf{Keywords:} #1}
\newcommand{\voronoi}{Vorono\u\i}
%\newcommand{\ceil}[1]{{\lceil #1 \rceil}}
\newcommand{\Ceil}[1]{{\left\lceil #1 \right\rceil}}
%\newcommand{\floor}[1]{{\lfloor #1 \rfloor}}
\newcommand{\Floor}[1]{{\left\lfloor #1 \right\rfloor}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Sp}{\mathbb{S}}
\newcommand{\E}{\mathrm{E}}


% \usepackage[mathlines]{lineno}
% \setlength{\linenumbersep}{2em}
% \newcommand*\patchAmsMathEnvironmentForLineno[1]{%
%  \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
%  \expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
%  \renewenvironment{#1}%
%     {\linenomath\csname old#1\endcsname}%
%     {\csname oldend#1\endcsname\endlinenomath}}%
% \newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{%
%  \patchAmsMathEnvironmentForLineno{#1}%
%  \patchAmsMathEnvironmentForLineno{#1*}}%
% \AtBeginDocument{%
% \patchBothAmsMathEnvironmentsForLineno{equation}%
% \patchBothAmsMathEnvironmentsForLineno{align}%
% \patchBothAmsMathEnvironmentsForLineno{flalign}%
% \patchBothAmsMathEnvironmentsForLineno{alignat}%
% \patchBothAmsMathEnvironmentsForLineno{gather}%
% \patchBothAmsMathEnvironmentsForLineno{multline}%
% }


% % Taken from
% % https://tex.stackexchange.com/questions/42726/align-but-show-one-equation-number-at-the-end
% \newcommand\numberthis{\addtocounter{equation}{1}\tag{\theequation}}
