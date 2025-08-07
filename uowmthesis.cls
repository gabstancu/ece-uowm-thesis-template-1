\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mythesis}[2023/11/15 Custom Thesis Class]

% ========== CLASS OPTIONS ==========
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper]{report}

% ========== REQUIRED PACKAGES ==========
\RequirePackage{settings}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english,greek]{babel}
\RequirePackage[T1]{fontenc}

% ========== LANGUAGE SETTINGS ==========
\AtBeginDocument{%
  \addto\captionsenglish{%
    \renewcommand{\listalgorithmname}{List of Algorithms}%
    \renewcommand{\algorithmname}{Algorithm}%
    \renewcommand{\listfigurename}{List of Figures}%
    \renewcommand{\listtablename}{List of Tables}%
    \renewcommand{\listimagename}{List of Images}%
    \renewcommand{\acronymname}{Acronyms}%
    \renewcommand{\imagename}{Image}%
    \renewcommand{\theoremname}{Theorem}%
    \renewcommand{\lemmaname}{Lemma}%
    \renewcommand{\definitionname}{Definition}%
    \renewcommand{\corollaryname}{Corollary}%
    \renewcommand{\propositionname}{Proposition}%
    \renewcommand{\examplename}{Example}%
    \renewcommand{\remarkname}{Observation}%
  }

  \addto\captionsgreek{%
    \renewcommand{\listalgorithmname}{Κατάλογος Αλγορίθμων}%
    \renewcommand{\algorithmname}{Αλγόριθμος}%
    \renewcommand{\listfigurename}{Κατάλογος Σχημάτων}%
    \renewcommand{\listtablename}{Κατάλογος Πινάκων}%
    \renewcommand{\listimagename}{Κατάλογος Εικόνων}%
    \renewcommand{\acronymname}{Ακρωνύμια}%
    \renewcommand{\imagename}{Εικόνα}%
    \renewcommand{\theoremname}{Θεώρημα}%
    \renewcommand{\lemmaname}{Λήμα}%
    \renewcommand{\definitionname}{Ορισμός}%
    \renewcommand{\corollaryname}{Πόρισμα}%
    \renewcommand{\propositionname}{Πρόταση}%
    \renewcommand{\examplename}{Παράδειγμα}%
    \renewcommand{\remarkname}{Παρατήρηση}%
  }
}

% =========== fonts (more at https://tug.org/FontCatalogue/) =============
% \RequirePackage{lmodern} % main font
% \RequirePackage{mathptmx} % Times font + math support (legacy)
% \RequirePackage{newtxtext,newtxmath} % Modern Times clone (recommended)
% \RequirePackage{mathpazo} % Palatino + math support
% \RequirePackage{helvet} % Helvetica
% \RequirePackage{accanthis}
\RequirePackage{libertinus}

\RequirePackage{microtype}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath,amssymb,amsthm,mathtools}
\RequirePackage{algpseudocode}
\RequirePackage{titlesec}
\RequirePackage{xifthen}
\RequirePackage{etoolbox}
\RequirePackage{tocloft}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{caption}
\RequirePackage{chngcntr}

\RequirePackage{float}
\floatstyle{plain}
\newfloat{image}{htbp}{loi}
\floatname{image}{\imagename}

% Section-based numbering for floats
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}
\renewcommand{\theimage}{\thechapter.\arabic{image}}

\counterwithin{figure}{section}
\counterwithin{table}{section}
\counterwithin{image}{section}

% ========== PAGE LAYOUT ==========
\geometry{a4paper,top=3.5cm,bottom=2.5cm,left=2.5cm,right=2.5cm}
\onehalfspacing
\setlength{\parindent}{0pt}

% ========== HEADERS/FOOTERS ==========
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}

\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markboth{\thesection\quad#1}{}}
\renewcommand{\subsectionmark}[1]{}

\fancypagestyle{noheaderstyle}{
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
}


% ========== ALGORITHMS ==========
% Algorithm counter
\newcounter{myalgorithm}[chapter]
\renewcommand{\themyalgorithm}{\thechapter.\arabic{myalgorithm}}

% Provide default English label (override via \addto\captions...)
\providecommand{\algorithmname}{Algorithm}

% Custom algorithm environment
\makeatletter
\newenvironment{myalgorithm}[2]{% #1 = title, #2 = label
    \refstepcounter{myalgorithm}%
    \addcontentsline{loa}{myalgorithm}{\protect\numberline{\themyalgorithm}{\ignorespaces #1}}%
    % \addcontentsline{loa}{myalgorithm}{\protect\numberline{\themyalgorithm}{\texorpdfstring{#1}{#1}}}%
    \vspace{\baselineskip}%
    \hrule
    \vspace{0.2em}
    % \noindent{\textbf{\algorithmname}~\themyalgorithm~-- #1}%
    \noindent{\textbf{\algorithmname~\themyalgorithm} -- #1}%
    \vspace{0.2em}%
    \hrule
    \label{#2}%
    \vspace{0.3em}%
}{%
    \vspace{0.3em}%
    \hrule
    \vspace{\baselineskip}%
}

% List of Algorithms output
\newcommand{\listofmyalgorithms}{%
  \section*{\listalgorithmname}%
  \@starttoc{loa}%
}

% Formatting the list entries
\newcommand*\l@myalgorithm{\@dottedtocline{1}{1.5em}{2.3em}}
\makeatother


% ========== CHAPTER/SECTION FORMATTING ==========
\newcommand{\chapterheading}[2]{%
  \thispagestyle{plain}
  \vspace*{2.8cm}
  \begin{center}
    \ifthenelse{\isempty{#1}}{}{%
        {\Large\bfseries #1}\\
        \vspace{0.5em}
    }
    \rule{\textwidth}{0.4pt}\\
    \vspace{1.2em}
    {\normalfont\Huge\bfseries #2}\\
    \vspace{0.2em}
    \rule{\textwidth}{0.4pt}
  \end{center}
}

\titleformat{\chapter}[display]
  {\normalfont}
  {}
  {-2.5cm}
  {\chapterheading{\chaptername~\thechapter}}

\titleformat{\section}
  {\normalfont\Large}{\thesection}{1em}{}

\titleformat{\subsection}
  {\normalfont\large}{\thesubsection}{1em}{}

\titleformat{\subsubsection}
  {\normalfont\normalsize}{\thesubsubsection}{1em}{}

% ========== TABLE OF CONTENTS ==========
\newcommand{\customtableofcontents}{%
  \cleardoublepage
  \begingroup
    \let\clearpage\relax
    \let\cleardoublepage\relax
    \chapterheading{}{\contentsname}
    \vspace{-1.5cm}
    \renewcommand{\contentsname}{} 
    \setlength{\cftbeforechapskip}{1.5ex}
    \setlength{\cftbeforesecskip}{0.5ex}
    \setcounter{tocdepth}{3}
    \tableofcontents
  \endgroup
  \markboth{\contentsname}{}
}

% ========== LISTS ==========
\newcommand{\customlistoffigures}{%
  \cleardoublepage
  \chapterheading{}{\listfigurename}%
  \vspace{-2.5\baselineskip} % adjust this value as needed
  \renewcommand{\listfigurename}{}%
  \listoffigures
}

\newcommand{\customlistoftables}{%
  \cleardoublepage
  \chapterheading{}{\listtablename}%
  \vspace{-2.5\baselineskip} % adjust this value as needed
  \renewcommand{\listtablename}{}%
  \listoftables
}


\newcommand{\customlistofalgorithms}{%
  \cleardoublepage
  \chapterheading{}{\listalgorithmname}%
  \renewcommand{\listalgorithmname}{}%
  \listofmyalgorithms
}

\newcommand{\customlistofimages}{%
  \cleardoublepage
  \chapterheading{}{\listimagename}
  \begingroup
    \let\chapter\section
    \renewcommand{\listimagename}{}%
    \listof{image}{\listimagename}
  \endgroup
}


\newcommand{\customlistofacronyms}{%
  \cleardoublepage
  \phantomsection
  \chapterheading{}{\acronymname}%
  % \addcontentsline{toc}{chapter}{\acronymname}%
  % \setglossarystyle{nopages}%
  \glsaddall%
  \begingroup
    \def\glossarysection[##1]##2{}%
    \printglossary[type=\acronymtype, title={}]%
  \endgroup
}

% ========== BIBLIOGRAPHY ==========
\newcommand{\custombibliography}{%
  \begingroup
    \let\origclearpage\clearpage
    \let\clearpage\relax
    \let\cleardoublepage\relax
    \phantomsection
    \addcontentsline{toc}{chapter}{\bibname}
    \newpage
    \chapterheading{}{\bibname}
    \vspace{-3cm}
    \titleformat{\chapter}[display]{\normalfont\Huge}{}{0pt}{}
    \renewcommand{\bibname}{}

    \begin{otherlanguage*}{english}
      \bibliographystyle{IEEEtran}
      \bibliography{IEEEabrv,references} 
    \end{otherlanguage*}
    \let\clearpage\origclearpage
  \endgroup
  \markboth{\bibname}{}
}



% ========== APPENDIX ==========
\newcommand{\appendixchapter}[1]{%
  \cleardoublepage % Ensures it starts on a new page (right-hand side in double-sided)
  \refstepcounter{chapter}
  \renewcommand{\thechapter}{\Alph{chapter}}%
  \chapterheading{\appendixname~\thechapter}{#1}%
  \addcontentsline{toc}{chapter}{\appendixname~\thechapter: #1}%
}


% ========== THEOREMS ==========
\newtheorem{theorem}{\theoremname}[chapter]
\newtheorem{lemma}[theorem]{\lemmaname}
\newtheorem{definition}[theorem]{\definitionname}
\newtheorem{corollary}[theorem]{\corollaryname}
\newtheorem{proposition}[theorem]{\propositionname}
\newtheorem{example}{\examplename}[chapter]
\newtheorem{remark}{\remarkname}[chapter]


% ========== HYPERREF ==========
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    urlcolor=black,
    citecolor=black,
    pdfborder={0 0 0}
}

\endinput