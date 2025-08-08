\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uowmthesis}[2023/11/15 Custom Thesis Class – bilingual fixed]

% ========== CLASS OPTIONS ==========
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper]{report}

% ========== LANG + SETTINGS ==========
\RequirePackage{polyglossia}
\setmainlanguage{greek}
\setotherlanguage{english}

\RequirePackage{settings}

% ---- Caption names (override, bilingual) ----
\AtBeginDocument{%
    \addto\captionsenglish{%
      \renewcommand{\chaptername}{Chapter}%
      \renewcommand{\contentsname}{Contents}%
      \renewcommand{\bibname}{Bibliography}%
      \renewcommand{\appendixname}{Appendix}%
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
      \renewcommand{\remarkname}{Remark}%
    }
    \addto\captionsgreek{%
      \renewcommand{\chaptername}{Κεφάλαιο}%
      \renewcommand{\contentsname}{Περιεχόμενα}%
      \renewcommand{\bibname}{Βιβλιογραφία}%
      \renewcommand{\appendixname}{Παράρτημα}%
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


% ========= custom acronyms =========
\newcommand{\acitem}[2]{\item[\hypertarget{acro:#1}{\textbf{#1}}] #2}
\newcommand{\ac}[1]{\hyperlink{acro:#1}{#1}}

% =========== FONTS / LAYOUT ===========
\RequirePackage{XCharter}
\RequirePackage{microtype}
\RequirePackage{geometry}
\geometry{a4paper,top=3.5cm,bottom=2.5cm,left=2.5cm,right=2.5cm}
\RequirePackage{setspace}
\onehalfspacing
\setlength{\parindent}{0pt}

% ========== HEADERS/FOOTERS ==========
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}

\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markboth{\thesection\quad#1}{}}
\renewcommand{\subsectionmark}[1]{}
\fancypagestyle{noheaderstyle}{%
  \fancyhf{}\fancyfoot[C]{\thepage}\renewcommand{\headrulewidth}{0pt}%
}

% ========== PKGS ==========
\let\eth\relax
\let\backepsilon\relax
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

% ========== IMAGE FLOAT ==========
\floatstyle{plain}
\newfloat{image}{htbp}{loi}
\floatname{image}{\imagename}
\AtBeginEnvironment{image}{\vspace{\baselineskip}}
\AtEndEnvironment{image}{\vspace{\baselineskip}}

\makeatletter
\newcommand{\listofmyimages}{%
  \@starttoc{loi}%
}
\newcommand*\l@image{\@dottedtocline{1}{1.5em}{2.3em}}
\makeatother

% Section-based numbering for floats
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}
\renewcommand{\theimage}{\thechapter.\arabic{image}}
\counterwithin{figure}{section}
\counterwithin{table}{section}
\counterwithin{image}{section}

% ========== ALGORITHMS ==========
\newcounter{myalgorithm}[chapter]
\renewcommand{\themyalgorithm}{\thechapter.\arabic{myalgorithm}}

\makeatletter
\newenvironment{myalgorithm}[2]{% #1=title, #2=label
  \refstepcounter{myalgorithm}%
  \addcontentsline{loa}{myalgorithm}{\protect\numberline{\themyalgorithm}{\ignorespaces #1}}%
  \vspace{\baselineskip}\hrule\vspace{0.2em}
  \noindent{\textbf{\algorithmname~\themyalgorithm} -- #1}%
  \vspace{0.2em}\hrule\label{#2}\vspace{0.3em}
}{%
  \vspace{0.3em}\hrule\vspace{\baselineskip}
}
\newcommand{\listofmyalgorithms}{%
  % \chapter*{\listalgorithmname}% heading uses current language
  \@starttoc{loa}%
}
\newcommand*\l@myalgorithm{\@dottedtocline{1}{1.5em}{2.3em}}
\makeatother

% ========== CHAPTER/SECTION FORMATTING ==========
\newcommand{\chapterheading}[2]{%
  \thispagestyle{plain}%
  \vspace*{2.8cm}%
  \begin{center}
    \ifthenelse{\isempty{#1}}{}{%
      {\Large\bfseries #1}\\[0.5em]%
    }%
    \rule{\textwidth}{0.4pt}\\[1.2em]%
    {\normalfont\Huge\bfseries #2}\\[0.2em]%
    \rule{\textwidth}{0.4pt}%
  \end{center}
}

\titleformat{\chapter}[display]
  {\normalfont}
  {}
  {-2.5cm}
  {\chapterheading{\chaptername~\thechapter}}

% Ensure chapter marks show localized label
\renewcommand{\chaptermark}[1]{%
  \markboth{\chaptername~\thechapter\quad#1}{}%
}

\titleformat{\section}{\normalfont\Large}{\thesection}{1em}{}
\titleformat{\subsection}{\normalfont\large}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\normalfont\normalsize}{\thesubsubsection}{1em}{}

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
  \vspace{1.5cm}
  \listofmyalgorithms
}

\makeatletter
\newcommand{\customlistofimages}{%
    \cleardoublepage
    \chapterheading{}{\listimagename}
    \renewcommand{\listimagename}{}%
    \vspace{1.5cm}
    \listofmyimages
}
\makeatother


% ========== BIBLIOGRAPHY (biblatex) ==========
\RequirePackage[backend=biber,style=ieee,sorting=nyt,doi=true,url=true]{biblatex}

% ========== APPENDIX ==========
\newcommand{\appendixchapter}[1]{%
  \cleardoublepage
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
\hypersetup{colorlinks=true,linkcolor=black,urlcolor=black,citecolor=black,pdfborder={0 0 0}}

\endinput