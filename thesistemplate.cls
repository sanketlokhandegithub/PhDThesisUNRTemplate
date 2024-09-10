% This is a Modification of the Thesis Template written by Dimuthu D. K. Arachchige [dimuthukod@gmail.com]. Hence the credit goes to the original author. 

% Sanket Lokhande slokhande@unr.edu modified the original template in 2024. Sanket was a PhD candidate at University of Nevada, Reno from 2020 to 2024. The pdf version of his dissertation can be found at  


% This template can be used for both Dissertation Proposal and Final Report. 


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesistemplate}[2023/10/01 Generic Thesis Template 1.0 by slokhande@unr.edu]

%% Book options
%\DeclareOption{11pt,letterpaper,oneside}{
%	\PassOptionsToClass{\CurrentOption}{book}
%}
 \DeclareOption{11pt,a4paper,twoside}{
   \PassOptionsToClass{\CurrentOption}{book}
 }

%% Custom package options

\newif\ifmaster
\masterfalse
\DeclareOption{master}{
	\mastertrue
}

\newif\ifsans
\sansfalse
\DeclareOption{sans}{
	\sanstrue
}

\newif\ifus
\usfalse
\DeclareOption{us}{
	\ustrue
}

% Option other: An other language will be used
\newif\ifother
\otherfalse
\DeclareOption{other}{
	\othertrue
}

% Option word: The ugly M$ standard paragraph formatting, no indentation, one line separation, default: What is considered normal by the rest of the world.
\newif\ifword
\wordfalse
% Uses custom title page provided as "titlepage.pdf", OBS: MUST BE EXACTLY A4 SIZE

\DeclareOption{word}{
	\ClassWarning{hiofthesis}{Your thesis will now look like a standard formatted MicroSoft document.}
	\wordtrue
}

\newif\ifcover
\coverfalse

\DeclareOption{cover}{
	\covertrue
}

% Fallback
\DeclareOption*{
	\ClassWarning{myclass}{Unknown option '\CurrentOption'}
}

% Execute default options
% \ExecuteOptions{11pt,a4paper,twoside,openright}
\ExecuteOptions{11pt,letterpaper,oneside}

% Process given options
\ProcessOptions\relax

% Load base
\LoadClass[11pt,letterpaper,oneside]{book}
%a4paper
% Variables for layout geomtry
\def \innerm {25mm} % inner margin
\def \uterm {20mm} % outer margin
\def \topm {30mm} % top margin
\def \bottomm {25mm} % 
\def \headh {14pt} % headheight
%inner=25mm,outer=35mm,top=30mm,bottom=40mm,headheight=14pt

% Load additional packages and commands.
\usepackage[font=scriptsize]{caption} 
\RequirePackage{fancyhdr,paralist,lipsum,pdfpages,url,nameref,subfigure,wrapfig,tabularx,amssymb,relsize,microtype,xparse,hyperref,float,fullpage,polyglossia,csquotes,listings,dirtytalk,imakeidx,todonotes}
\RequirePackage{setspace}
\RequirePackage{etaremune}
\RequirePackage{xcolor}
\RequirePackage[headsep=2em]{geometry}
\RequirePackage[odd]{emptypage}
\RequirePackage[export]{adjustbox}
\RequirePackage[nottoc]{tocbibind}
%\RequirePackage{enumitem}
%\RequirePackage[colorinlistoftodos,obeyDraft]{todonotes}

%\doublespacing
% Custom headers and footers
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE]{\leftmark}
\fancyhead[RO]{\rightmark}
\fancyfoot[LE,RO]{\thepage}
\renewcommand{\headrulewidth}{0pt}



% Set page style in main matter command
\let\oldmm\mainmatter
\renewcommand{\mainmatter}{\oldmm \pagestyle{fancy}}

%% Source sans pro font
\ifsans
\RequirePackage[lining,light,default]{sourcesanspro}
%\RequirePackage[T1]{fontenc}
\fi

% Utilities


\newcommand{\citationstyle}[1]{
	\RequirePackage[
	style=#1,
	backend=biber,
	sorting=ynt
	]{biblatex}
}

\newcommand{\listingslabel}[1]{
	\newcommand{\thelistingslabel}{#1} 
	\renewcommand{\lstlistlistingname}{#1} 
}

\newcommand{\floatingfigure}[3]{
	\begin{figure}[!htbp]
		\center
		\includegraphics[width=#2\textwidth]{#1}
		\caption{#3}
	\end{figure}
}

\newcommand{\fixedfigure}[3]{
	\begin{figure}[H]
		\center
		\includegraphics[width=#2\textwidth]{#1}
		\caption{#3}
	\end{figure}
}

\newcommand{\place}[1]{\newcommand{\plc}{#1}}
\newcommand{\department}[1]{\newcommand{\dep}{#1}}
\newcommand{\bywho}[1]{\newcommand{\bywh}{#1}}
\newcommand{\doctype}[1]{\newcommand{\dtype}{#1}}
\newcommand{\affiliation}[1]{\newcommand{\aff}{#1}}
\newcommand{\subtitle}[1]{\newcommand{\subt}{#1}}

%% Title page
\newcommand{\makehalftitle}{
	
	\newgeometry{inner=25mm,outer=20mm,top=40mm,bottom=25mm,headheight=14pt}
	\pagestyle{empty}
	\cleardoublepage
	\begin{center}
		\LARGE \textbf{\@title} \\
		\vskip 1cm
		
		\textsc{
			\Large{\bywh} 
			\vskip 2cm
			\Large{\@author}
			% 
			\vskip 4cm
			\Large{\dtype}
			\vskip 2cm
			%\LARGE{\@author} \\
			\vskip 3cm
			\Large{\Large \aff\\ \plc\\ \vskip 0.3cm 2024}
		}\\
		
	\end{center}
	
	\cleardoublepage
	\newgeometry{inner=25mm,outer=20mm,top=30mm,bottom=25mm,headheight=14pt}
}  



%% Formatting Word-like paragraphs, must occur after maketitle
\ifword
\setlength{\parindent}{0em}
\setlength{\parskip}{1em}
\raggedright
\fi

%% Set main file
%!TEX root = main.tex

% Add front matter chapters to ToC


%% Common number levels in table of contents
\setcounter{tocdepth}{2}

%% Prevent orphan and widow lines
\widowpenalty10000
\clubpenalty10000
\brokenpenalty10000
\hyphenpenalty10000


%% Code listing style 

\lstdefinestyle{codestyle}{
	%backgroundcolor=\color{backcolour},   
	commentstyle=\color{blue},
	keywordstyle=\color{purple},
	numberstyle=\tiny\color{gray},
	stringstyle=\color{violet},
	basicstyle=\ttfamily\footnotesize,
	breakatwhitespace=false,         
	breaklines=true,                 
	captionpos=b,                    
	keepspaces=true,                 
	numbers=left,                    
	numbersep=5pt,                  
	showspaces=false,                
	showstringspaces=false,
	showtabs=false,                  
	tabsize=2
}

%% Use the above style
\lstset{style=codestyle}

% Making some blank pages
\newcommand{\theend}{
	\newpage
	%\pagestyle{empty}
	\mbox{}
	\newpage
	\mbox{}
	\newpage
	\mbox{}
	\cleardoublepage
}

% To avoid cutting off margin notes like todo's
\makeatletter
\setlength\marginparwidth{\FP@margin}
\addtolength\marginparwidth{-4mm}
\makeatother

% Make some blank pages for sensor notes
% \AtEndDocument{
%     \theend
% }
\endinput
