\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ib_template}[2021 IB template submission class]

\ProcessOptions\relax

%-------------------------------------------------------------------------------
%	HANDLING THE STYLE OF THE PAPER
%-------------------------------------------------------------------------------
	\LoadClass[12pt, oneside]{article} % 12 pt font, one-sided book style
	
	\RequirePackage[letterpaper, includehead, headheight=0.6cm, inner=2.5cm ,outer=2.5cm, top=2.5 cm, bottom=2.5cm]{geometry}
	
	\RequirePackage[bf, font=onehalfspacing]{caption} % caption: FIG in bold, 1.5 line spacing in figure and table captions

	\newcommand{\paperspacing}{\doublespacing}

	\newcommand{\numberedsection}{ % Preparation for numbered chapters
		\cleardoublepage % To make sure the previous headers are passed
		\lhead{\bfseries \leftmark} % Header
	}
	
	\newcommand{\unnumberedsection}[1]{ % Preparation for unnumbered chapters
		\cleardoublepage % To make sure the previous headers are passed
		\phantomsection % To help hyperref link to the right page
		\addcontentsline{toc}{section}{#1} % Also adds the chapter name to the Contents
		\lhead{\bfseries #1} % Header
	}

	\newcommand{\startpreamble}{
		\pagestyle{fancy} % Change the header style
		\fancyhf{}% Clear header and footer
		\renewcommand{\sectionmark}[1]{\markboth{##1}{}} % Getting the chapter name right
		\rhead{\thepage} % Page number at the right of the header
		\setcounter{page}{2} % Include the title page in page counting
		\paperspacing % Double or single spacing
	}


%-------------------------------------------------------------------------------
%	PREPARE BUILD FOR TITLE PAGE
%-------------------------------------------------------------------------------
\RequirePackage{xkeyval} % Handling keyword options.

\define@key[IB]{title}{ibtitle}{\def\ibtitle{#1}}
\define@key[IB]{title}{subject}{\def\subject{#1}}
\define@key[IB]{title}{submissiondate}{\def\submissiondate{#1}}


\newif\if@nameexist\@nameexistfalse
\newif\if@supervisorexist\@supervisorexistfalse
\newif\if@schoolexist\@schoolexistfalse
\newif\if@wordcountexist\@wordcountexistfalse
\newif\if@numexist\@numexistfalse
\newif\if@rqexist\@rqexistfalse

\define@key[IB]{title}{rq}{\def\rq{#1}\@rqexisttrue}
\define@key[IB]{title}{wordcount}{\def\wordcount{#1}\@wordcountexisttrue}
\define@key[IB]{title}{name}{\def\name{#1}\@nameexisttrue}
\define@key[IB]{title}{ibnum}{\def\ibnum{#1}\@numexisttrue}
\define@key[IB]{title}{school}{\def\school{#1}\@schoolexisttrue}
\define@key[IB]{title}{supervisor}{\def\supervisor{#1}\@supervisorexisttrue}



%-------------------------------------------------------------------------------
%	BUILDING THE TITLE PAGE
%-------------------------------------------------------------------------------

\providecommand{\puttitle}{}
\renewcommand{\puttitle}[1]{
	\@puttitle{}{#1}
}

\providecommand{\@puttitle}{}
\renewcommand{\@puttitle}[2]{%
	\setkeys[IB]{title}{#2}

	\begin{titlepage}
		\begin{center}
			\vfill
			\if@schoolexist{\large \scshape \school \\[0.7cm]}\else\fi
			\vspace*{\fill}
			\large\subject \hfill  \large\submissiondate \\
			\rule{\textwidth}{1.5pt}\\[0cm]
			{\huge \bfseries \ibtitle \par \ }\\[-0.5cm]
			\rule{\textwidth}{1.5pt}\\[0.5cm]
			\if@rqexist{
			{\Large \rq }\\[2cm]
			}\else\fi
			\if@nameexist{\hfill  by\\[0.5cm]
			\hfill  {\large \bfseries\name}\\[0.25cm]
			\if@numexist {\hfill  {\large IB Candidate Number: \ibnum}}\else\fi
			}\else\fi
			\vfill
			\vspace*{\fill}
			\if@supervisorexist{\hfill \large Advisor: \textbf{\supervisor} \\}\else\fi
			\vspace{0.5cm}
			\if@wordcountexist{\hfill \large Word Count: \textbf{\wordcount} \\}\else\fi
			
		\end{center}
	\end{titlepage}
}