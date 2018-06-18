%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Updated by Raghav Subramaniam
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article}

\usepackage[parfill]{parskip}

\pagestyle{empty}

% heading commands

\def\name#1{\def\resume@name{#1}} % \name sets name
\def\contact#1{\def\resume@contact{#1}} % \contact sets contact

% \printname prints name
\def\printname{
    \begingroup
    \hfil{\MakeUppercase{\namesize\bf\resume@name}}\hfil
    \nameskip\break
    \endgroup
}

% \printcontact prints contact
\def\printcontact{
    \begingroup
    \centerline{\resume@contact}
    \endgroup
    \par
}

% automatically generate header
\let\ori@document=\document
\renewcommand{\document}{
    \ori@document
    \printname
    \printcontact
}

% section commands

% rSection environment for large sections
% 1 input argument: section name
\newenvironment{rSection}[1]{
    \sectionskip
    \MakeUppercase{\bf #1}
    \sectionlineskip
    \hrule
}{
}

% rEducation environment for education subsections
% 3 input arguments: university name, location, year(s) attended
\newenvironment{rEducation}[3]{ 
    {\bf #1, }{\em #2} \hfill {\bf #3} \\
    \vspace{-1.0em}
}{
    \vspace{1em}
}

% rExperience environment for experience subsections
% 4 input arguments: job title, year(s) employed, employer name, location
\newenvironment{rExperience}[4]{ 
    {\bf #1} \hfill {\bf #2} \\
    {\em #3} \hfill {\em #4} \\
    \vspace{-1.0em}
    \begin{itemize}
        \itemsep -0.5em \vspace{-0.5em}
}{
    \end{itemize}
}

% size macros
\def\namesize{\huge} % name size
\def\nameskip{\bigskip} % space below name
\def\sectionlineskip{\medskip} % space above section hrule
\def\sectionskip{\bigskip} % space below section
