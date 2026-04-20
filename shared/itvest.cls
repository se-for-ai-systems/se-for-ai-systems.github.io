% itvest.cls — Shared LaTeX class for ITVeST course materials
% Usage: \documentclass[report]{itvest}
%        \documentclass[beamer]{itvest}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{itvest}[2026/04/20 ITVeST Course Materials]

% ---------------------------------------------------------------
% Mode option: report (default) or beamer
% ---------------------------------------------------------------
\newif\if@modebeamer
\@modebeamerfalse

\DeclareOption{beamer}{\@modebeamertrue}
\DeclareOption{report}{}
\ProcessOptions\relax

% ---------------------------------------------------------------
% Course-level metadata — set once, used everywhere
% ---------------------------------------------------------------
\def\@coursename{Software Engineering for AI Systems}
\def\@courseabbr{SE for AI Systems}
\def\@courseterm{Spring 2027}
\def\@department{Department of Computer Science}
\def\@university{Aalborg University}
\def\@defaultauthor{Anders Launer Bæk-Petersen}

\newcommand{\coursename}[1]{\def\@coursename{#1}}
\newcommand{\courseabbr}[1]{\def\@courseabbr{#1}}
\newcommand{\courseterm}[1]{\def\@courseterm{#1}}
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand{\university}[1]{\def\@university{#1}}

% ---------------------------------------------------------------
% Document-level metadata helpers
% ---------------------------------------------------------------
\def\@weeknumber{}
\newcommand{\weeknumber}[1]{\def\@weeknumber{#1}}
\def\@lecturenumber{}
\newcommand{\lecturenumber}[1]{\def\@lecturenumber{#1}}

% ---------------------------------------------------------------
% Load base class and mode-specific setup
% ---------------------------------------------------------------
\if@modebeamer
  \LoadClass[aspectratio=169]{beamer}

  \usetheme{Madrid}

  \author{\@defaultauthor}

  % Propagate course metadata into beamer fields before document starts
  \AtBeginDocument{%
    \ifx\@weeknumber\@empty\else
      \subtitle{Week \@weeknumber{} - Lecture \@lecturenumber}%
    \fi
    \institute{\@department\\\@university}%
  }

  % Convenience: title frame command so every deck starts consistently
  \newcommand{\titleframe}{\begin{frame}\titlepage\end{frame}}

\else
  \LoadClass[a4paper, 12pt]{report}

  \author{\@defaultauthor}

  \usepackage[utf8]{inputenc}
  \usepackage[T1]{fontenc}
  \usepackage{palatino}
  \usepackage{microtype}
  \usepackage[margin=2.5cm]{geometry}
  \usepackage{hyperref}
  \usepackage{xcolor}

  % Highlighted box for definitions and check-points
  \definecolor{checkbg}{rgb}{0.88, 0.88, 0.88}
  \newsavebox{\@checkbox}
  \newenvironment{checkit}{%
    \begin{lrbox}{\@checkbox}%
    \begin{minipage}[t]{0.85\textwidth}%
  }{%
    \end{minipage}\end{lrbox}%
    \begin{center}\colorbox{checkbg}{\usebox{\@checkbox}}\end{center}%
  }

  % Title page that incorporates course metadata
  \renewcommand{\maketitle}{%
    \begin{titlepage}
      \centering
      \vspace*{1.5cm}
      {\large\scshape \@university\par}
      {\large \@department\par}
      \vspace{0.5cm}
      \rule{\linewidth}{0.4pt}\par
      \vspace{0.4cm}
      {\large \@coursename\par}
      {\normalsize \@courseterm\par}
      \rule{\linewidth}{0.4pt}\par
      \vspace{2cm}
      {\Huge\bfseries \@title\par}
      \vspace{0.8cm}
      \ifx\@weeknumber\@empty\else
        {\large Week \@weeknumber\par}
        \vspace{0.5cm}
      \fi
      \vfill
      {\large \@author\par}
      \vspace{0.4cm}
      {\normalsize \@date\par}
    \end{titlepage}%
    \setcounter{page}{1}%
  }
\fi
