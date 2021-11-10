\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ib_template}[2021 IB template submission class]

\newif\if@final\@finaltrue
\DeclareOption{temporary}{\@finalfalse}
\DeclareOption{final}{\@finaltrue}

\ProcessOptions\relax

%-------------------------------------------------------------------------------
%	HANDLING THE STYLE OF THE PAPER
%-------------------------------------------------------------------------------

\if@final
	\LoadClass[12pt, twoside]{article} % 12 pt font, two-sided book style
	
	\RequirePackage[letterpaper, includehead, headheight=0.6cm, inner=3cm ,outer=2.5cm, top=2.5 cm, bottom=2.5cm]{geometry}  % Changing size of document
	
	\RequirePackage[bf]{caption} % caption: FIG in bold
	\RequirePackage{emptypage} % Remove headers of empty pages

	\newcommand{\paperspacing}{\singlespacing}
	
	\newcommand{\numberedsection}{ % Preparation for numbered chapters
		\cleardoublepage % To make sure the previous headers are passed
		\fancyhead[RE]{{\bfseries \leftmark}}% Headers for left pages
		\fancyhead[LO]{{\bfseries \rightmark}}
	}% Headers for right pages
	
	\newcommand{\unnumberedsection}[1]{ % Preparation for unnumbered chapters
		\cleardoublepage % To make sure the previous headers are passed
		\phantomsection % To help hyperref link to the right page
		\addcontentsline{toc}{section}{#1} % Also adds the chapter name to the Contents
		\fancyhead[RE]{{\bfseries #1}} % Headers for left pages
		\fancyhead[LO]{}
	}%Headers for right pages

	\newcommand{\startpreamble}{
		\renewcommand{\sectionmark}[1]{\markboth{##1}{}} % Getting the chapter name right
		\renewcommand{\subsectionmark}[1]{\markright{\thesection\; ##1}} % Getting the section name right
		\setcounter{page}{2} % Include the title page in page counting
		\paperspacing % Double spacing
	}

\else
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
\fi

%-------------------------------------------------------------------------------
%	PREPARE BUILD FOR TITLE PAGE
%-------------------------------------------------------------------------------
\RequirePackage{xkeyval} % Handling keyword options.

\define@key[IB]{title}{ibtitle}{\def\ibtitle{#1}}
\define@key[IB]{title}{rq}{\def\rq{#1}}
\define@key[IB]{title}{subject}{\def\subject{#1}}
\define@key[IB]{title}{submissiondate}{\def\submissiondate{#1}}
\define@key[IB]{title}{wordcount}{\def\wordcount{#1}}

\define@key[IB]{title}{name}{\def\name{#1}}
\define@key[IB]{title}{ibnum}{\def\ibnum{#1}}
\define@key[IB]{title}{supervisor}{\def\supervisor{#1}}

%-------------------------------------------------------------------------------
%	BUILDING THE TITLE PAGE FOR EE
%-------------------------------------------------------------------------------

\providecommand{\putee}{}
\renewcommand{\putee}[1]{
	\@putee{}{#1}
}

\providecommand{\@putee}{}
\renewcommand{\@putee}[2]{%
	\setkeys[IB]{title}{#2}

	\begin{titlepage}
		\begin{center}
			\vfill
			\vspace*{\fill}
			\large\subject \hfill  \large\submissiondate \\
			\rule{\textwidth}{1.5pt}\\[0cm]
			{\huge \bfseries \ibtitle \par \ }\\[-0.5cm]
			\rule{\textwidth}{1.5pt}\\[0.5cm]
			{\Large \rq }\\[0.7cm]
			\vfill
			\vspace*{\fill}
			\vspace{0.5cm}
			{\hfill \large Word Count: \textbf{\wordcount}} \\
		\end{center}
	\end{titlepage}
}

%-------------------------------------------------------------------------------
%	BUILDING THE TITLE PAGE FOR IA
%-------------------------------------------------------------------------------

\providecommand{\putia}{}
\renewcommand{\putia}[1]{
	\@putia{}{#1}
}

\providecommand{\@putia}{}
\renewcommand{\@putia}[2]{%
	\setkeys[IB]{title}{#2}

	\begin{titlepage}
		\begin{center}
			\vfill
			{\large \scshape Upper Canada College}\\[0.7cm]
			\vspace*{\fill}
			\large\subject \hfill  \large\submissiondate \\
			\rule{\textwidth}{1.5pt}\\[0cm]
			{\huge \bfseries \ibtitle \par \ }\\[-0.5cm]
			\rule{\textwidth}{1.5pt}\\[2.5cm]
			\hfill  by\\[0.5cm]
			\hfill  {\large \bfseries\name}\\[0.25cm]
			\hfill  {\large IB Candidate Number: \ibnum}\\
			\vfill
			\vspace*{\fill}
			\hfill \large Supervisor: \textbf{\supervisor} \\
			\vspace{0.5cm}
			{\hfill \large Word Count: \textbf{\wordcount}} \\
			
		\end{center}
	\end{titlepage}
}
