% This document class provides a simple memo for LaTeX users.
% It is based on article.cls and inherits most of the functionality
% that class.
% 
% Author: Rob Oakes, Copyright 2010.  Released under the LGPL, version 3.
% A copy of the LGPL can be found at http://www.gnu.org/licenses/lgpl.html

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texMemo}[2010/07/31 - Simple Memo Class, Including Logo]
\RequirePackage{palatino}

\usepackage{graphicx}

% Load the Base Class
\LoadClassWithOptions{article}

% \RequirePackage{fontspec}
% \setmainfont{Monaco}
% \normalsize{}
% Begin Requirements
\RequirePackage{ifthen}

% Specialized memo Commands (To, From, Subject, Logo, Letterhead Address)

\def\@noteto{\relax}
\newcommand{\noteto}[1]{\gdef\@noteto{#1}}

\def\@notetitle{\relax}
\newcommand{\notetitle}[1]{\gdef\@notetitle{#1}}

\def\@notedate{\relax}
\newcommand{\notedate}[1]{\gdef\@notedate{#1}}

\def\@notelogo{\relax}
\newcommand{\notelogo}[1]{\gdef\@notelogo{\protect #1}}

\def\@letterheadaddress{\relax}
\newcommand{\lhaddress}[1]{\gdef\@letterheadaddress{#1}}

\def\@notecode{\relax}
\newcommand{\notecode}[1]{\gdef\@notecode{#1}}

\def\@noteconference{\relax}
\newcommand{\noteconference}[1]{\gdef\@noteconference{#1}}

\def\@notelink{\relax}
\newcommand{\notelink}[1]{\gdef\@notelink{#1}}

\def\@notealgorithm{\relax}
\newcommand{\notealgorithm}[1]{\gdef\@notealgorithm{#1}}

% Custom Document Formatting
\newcommand\decorativeline[1][1pt]{
	\par\noindent%
	\rule[0.5ex]{\linewidth}{#1}\par
}

% Set the Paper Size and margins
\RequirePackage{geometry}
\geometry{margin=1.0in}

% Create the Letterhead and To/From Block

\renewcommand{\maketitle}{\makememotitle}
\newcommand\makememotitle{
	\ifthenelse{\equal{\@notelogo}{\relax}}{}
	{ % Create With Logo
	\begin{minipage}[t]{1\columnwidth}%
		\begin{flushright}
			\vspace{-0.6in}
			\@notelogo
			\vspace{0.5in}
		\par\end{flushright}%
	\end{minipage}
	}
	{\begin{center}
	\LARGE\bf
	% M\textsc{emorandum}
    %\textsc{论文阅读记录}
    \end{center}}
	% To, From, Subject Block
	\begin{description}
		\ifthenelse{\equal{\@noteto}{\relax}}{}{\item [{To:}] \@noteto}
		%\ifthenelse{\equal{\@from}{\relax}}{}{\item [{From:}] \@from}
		\ifthenelse{\equal{\@notetitle}{\relax}}{}{\item [{Title:}] \@notetitle}
		\ifthenelse{\equal{\@noteconference}{\relax}}{}{\item [{Conference:}] \@noteconference}
        \ifthenelse{\equal{\@notelink}{\relax}}{}{\item [{Link:}] \@notelink}
        \ifthenelse{\equal{\@notedate}{\relax}}{}{\item [{Date:}] \@notedate}
		\ifthenelse{\equal{\@notecode}{\relax}}{}{\item [{Code:}] \@notecode}
		%\ifthenelse{\equal{\@notealgorithm}{\relax}}{}{\item [{:}] \@notealgorithm}
	\end{description}
	\decorativeline\bigskip{}
}
