\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vermillion}[2018/03/11 Vermillion Class]

\RequirePackage{expl3,l3keys2e}

\ExplSyntaxOn
\keys_define:nn{vermillion/pkgopts}{
  defaultlang .tl_set:N = \l_vermillion_defaultlang_tl
}
\keys_set:nn{vermillion / pkgopts}{defaultlang=english}
\ProcessKeysOptions{vermillion/pkgopts}
\ExplSyntaxOff

\DeclareOption{draft}{
  \PassOptionsToClass{\CurrentOption}{memoir}
%  \PassOptionsToPackage{\CurrentOption}{hyperref}
  \PassOptionsToPackage{\CurrentOption}{fixme}
}

\DeclareOption{final}{
  \PassOptionsToClass{\CurrentOption}{memoir}
%  \PassOptionsToPackage{\CurrentOption}{hyperref}
  \PassOptionsToPackage{\CurrentOption}{fixme}
}

\DeclareOption{oneside}{
  \PassOptionsToClass{\CurrentOption}{memoir}
}

\DeclareOption{twoside}{
  \PassOptionsToClass{\CurrentOption}{memoir}
}

\DeclareOption*{
  \ClassWarning{jhanschoo}{Unknown Option `\CurrentOption'}
}

\ProcessOptions\relax

\LoadClass[a4paper,10pt,onecolumn,article]{memoir}

\paragraphfootnotes

\RequirePackage{etoolbox}
\RequirePackage{xparse}
% \RequirePackage{graphicx}
% \RequirePackage{rotating}

% \RequirePackage{multicol}
% \RequirePackage{blindtext}

\RequirePackage[table]{xcolor}

\RequirePackage{amsmath,amssymb}
\RequirePackage[amsmath,hyperref,thmmarks]{ntheorem}
\RequirePackage{tikz-cd}

% hack for name conflict
\let\greek\undefined

\RequirePackage{polyglossia}
\ExplSyntaxOn
\setdefaultlanguage{\tl_use:N \l_vermillion_defaultlang_tl}
\ExplSyntaxOff

% Additional markup
\RequirePackage{mleftright}

\RequirePackage{fontspec}
\RequirePackage{realscripts}
\RequirePackage[math-style=ISO]{unicode-math}
% \RequirePackage{microtype}

\RequirePackage[inline]{enumitem}

\RequirePackage{longtable}
\RequirePackage{tabulary}
% \RequirePackage{float}
\RequirePackage[final]{listings}

\RequirePackage[nomargin]{fixme}

\RequirePackage[ruled,lined,linesnumbered]{algorithm2e}

\RequirePackage[
colorlinks,
unicode,
final,
linkcolor=re,
citecolor=gr,
filecolor=aq,
menucolor=re,
urlcolor=pu
]{hyperref}

\RequirePackage{cleveref}

% color support
%\definecolor{bg}{HTML}{2E3440}
%\definecolor{fg}{HTML}{D8DEE9}
%\definecolor{re}{HTML}{BF616A}
%\definecolor{bl}{HTML}{81A1C1}
%\definecolor{gr}{HTML}{A3BE8C}
%\definecolor{aq}{HTML}{88C0D0}
%\definecolor{pu}{HTML}{B48EAD}

\definecolor{bg}{HTML}{FFFFFF}
\definecolor{fg}{HTML}{000000}
\definecolor{re}{HTML}{800000}
\definecolor{bl}{HTML}{000080}
\definecolor{gr}{HTML}{008000}
\definecolor{aq}{HTML}{008080}
\definecolor{pu}{HTML}{800080}
%\NewDocumentCommand{\textcolor}{m m}{#2}

%\pagecolor{bg}
%\color{fg}

% define augmented matrices
\renewcommand*\env@matrix[1][*\c@MaxMatrixCols c]{%
  \hskip -\arraycolsep
  \let\@ifnextchar\new@ifnextchar
  \array{#1}}

% geometry, c.f. memoir
%\tolerance 1600
%\hbadness 1600
%\emergencystretch 1.5em
%\hfuzz 0.3pt
%\widowpenalty=10000
%\vfuzz \hfuzz
\raggedbottom

% Using Lato for display text, EB Garamond for body, and Garamond Math for
% math c.f. fontspec and unicode-math
%using \setmainfont{EB Garamond}[...] somehow gives bold upright font bugs
\setmainfont{EBGaramond}[
Extension = .otf,
UprightFont = *-Regular,
ItalicFont = *-Italic,
BoldFont = *-Bold,
BoldItalicFont = *-BoldItalic,
Numbers = OldStyle,
Ligatures = {Common,Discretionary,TeX},
% https://tex.stackexchange.com/questions/603442/error-linebreak-invalid-node-with-type-whatsit-and-subtype-19-found-in-discr
Renderer=Node
]
%\setmainfont{EBGaramond}[
%Extension = .otf,
%UprightFont = *-Regular,
%ItalicFont = *-Italic,
%BoldFont = *-Bold,
%BoldItalicFont = *-BoldItalic,
%Numbers = OldStyle,
%Ligatures = TeX
%]
\setmonofont{DejaVuSansMono}[Scale=MatchLowercase,Ligatures=TeX]

\setmathfont{Garamond-Math.otf}
%\setmathfont{texgyrepagella-math.otf}[Scale=MatchLowercase]
%\setmathfontface\mathrm{EBGaramond-Regular.otf}[Scale=MatchLowercase]
%\let\mathup\undefined
%\setmathfontface\mathup{EBGaramond-Regular.otf}[Scale=MatchLowercase]
%\setmathfontface\mathit{EBGaramond-Italic.otf}[Scale=MatchLowercase]
%\setmathfontface\mathbf{EBGaramond-Bold.otf}[Scale=MatchLowercase]
%\setmathfontface\mathsf{libertinussans-regular.otf}[Scale=MatchLowercase]

\setoperatorfont\mathrm

\newfontfamily\sourcesanspro{SourceSansPro}[
Extension = .otf,
Scale = MatchLowercase,
UprightFont = *-Regular,
ItalicFont = *-RegularIt,
BoldFont = *-Bold,
BoldItalicFont = *-BoldIt,
Numbers = OldStyle,
Ligatures = TeX
]
\newfontfamily\sourcesanspromedium{SourceSansPro}[
Extension = .otf,
Scale = MatchLowercase,
UprightFont = *-Semibold,
ItalicFont = *-SemiboldIt,
Numbers = OldStyle,
Ligatures = TeX
]
\newfontfamily\sourcesansproextrabold{SourceSansPro}[
Extension = .otf,
Scale = MatchLowercase,
UprightFont = *-Black,
ItalicFont = *-BlackIt,
Numbers = OldStyle,
Ligatures = TeX
]
\newfontfamily\sourcesansproblack{SourceSansPro}[
Extension = .otf,
Scale = MatchLowercase,
UprightFont = *-Black,
ItalicFont = *-BlackIt,
Numbers = OldStyle,
Ligatures = TeX
]
\newfontfamily\sourcesansprothin{SourceSansPro}[
Extension = .otf,
Scale = MatchLowercase,
UprightFont = *-ExtraLight,
ItalicFont = *-ExtraLightIt,
Numbers = OldStyle,
Ligatures = TeX
]
\newfontfamily\sourcesansprolight{SourceSansPro}[
Extension = .otf,
Scale = MatchLowercase,
UprightFont = *-Light,
ItalicFont = *-LightIt,
Numbers = OldStyle,
Ligatures = TeX
]

% % microtype compatibility workaround
% % c.f. https://tex.stackexchange.com/questions/373594/microtype-producing-dozens-of-unknown-slot-number-warnings
% \def\MT@is@composite#1#2\relax{%
%   \ifx\\#2\\\else
%     \expandafter\def\expandafter\MT@char\expandafter{\csname\expandafter
%                     \string\csname\MT@encoding\endcsname
%                     \MT@detokenize@n{#1}-\MT@detokenize@n{#2}\endcsname}%
%     % 3 lines added:
%     \ifx\UnicodeEncodingName\@undefined\else
%       \expandafter\expandafter\expandafter\MT@is@uni@comp\MT@char\iffontchar\else\fi\relax
%     \fi
%     \expandafter\expandafter\expandafter\MT@is@letter\MT@char\relax\relax
%     \ifnum\MT@char@ < \z@
%       \ifMT@xunicode
%         \edef\MT@char{\MT@exp@two@c\MT@strip@prefix\meaning\MT@char>\relax}%
%           \expandafter\MT@exp@two@c\expandafter\MT@is@charx\expandafter
%             \MT@char\MT@charxstring\relax\relax\relax\relax\relax
%       \fi
%     \fi
%   \fi
% }
% % new:
% \def\MT@is@uni@comp#1\iffontchar#2\else#3\fi\relax{%
%   \ifx\\#2\\\else\edef\MT@char{\iffontchar#2\fi}\fi
% }


% definition of theorem environments, cf. ntheorem
\newtheoremstyle{myplain}%
{\item[\hskip\labelsep \theorem@headerfont ##1\ ##2\theorem@separator]}%
{\item[\hskip\labelsep \theorem@headerfont ##1\
  ##2]{\theorem@headerfont\ (##3)\theorem@separator\hskip\labelsep}}%
\newtheoremstyle{nonumbermyplain}%
{\item[\hskip\labelsep \theorem@headerfont ##1\theorem@separator]}%
{\item[\hskip\labelsep \theorem@headerfont ##1]{\theorem@headerfont\ (##3)\theorem@separator\hskip\labelsep}}%
\newtheoremstyle{nonumberproof}%
{\item[\hskip\labelsep \theorem@headerfont ##1\theorem@separator]}%
{\item[\hskip\labelsep \theorem@headerfont ##3\theorem@separator]}
\newtheoremstyle{nonumbersolution}%
{\item[\hskip\labelsep \theorem@headerfont ##1\theorem@separator]}%
{\item[\hskip\labelsep \theorem@headerfont\color{tngr} ##3\theorem@separator]}

% defining additional algorithm customizations and keywords
% cf. algorithm2e
\SetFuncSty{textsc}
\SetProcNameSty{textsc}
\DontPrintSemicolon

% Customize equation numbering, cf. amsmath
\counterwithin{equation}{chapter}

% customization of section headers cf. memoir

\setsecnumdepth{subsection}

\RenewDocumentCommand{\beforepartskip}{}{\null\vskip 50pt}
\RenewDocumentCommand{\afterpartskip}{}{\vskip 40pt}
\RenewDocumentCommand{\partnamefont}{}{\normalfont\sourcesansprothin\Huge}
\RenewDocumentCommand{\partnumfont}{}{\normalfont\sourcesansprothin\Huge}
\RenewDocumentCommand{\parttitlefont}{}{\normalfont\sourcesansproblack\HUGE}
\nopartblankpage{}

\chapterstyle{default}
\RenewDocumentCommand{\chapterheadstart}{}{\vspace*{30pt}}
\RenewDocumentCommand{\afterchapternum}{}{\par\nobreak}
\RenewDocumentCommand{\afterchaptertitle}{}{\par\nobreak\vskip 5pt}
\RenewDocumentCommand{\chapnamefont}{}{\normalfont\sourcesansprolight\itshape\LARGE}
\RenewDocumentCommand{\chapnumfont}{}{\normalfont\sourcesansprolight\itshape\LARGE}
\RenewDocumentCommand{\chaptitlefont}{}{\normalfont\sourcesansprolight\Huge}

\setsecheadstyle{\normalfont\sourcesanspromedium\LARGE}%
\setsubsecheadstyle{\normalfont\sourcesanspro\Large}%
\setsubsubsecheadstyle{\normalfont\sourcesanspro\itshape\large}%
\setparaheadstyle{\normalfont\sourcesansproblack}%
\setsubparaheadstyle{\normalfont\sourcesansproextrabold}%

% customization of page styles cf. memoir
\createmark{chapter}{left}{shownumber}
{\normalfont\sourcesanspro\bfseries\small\@chapapp\ }{\ \tiny}
\createmark{section}{right}{shownumber}
{\normalfont\sourcesanspro\bfseries\small}{\ \tiny}

\nouppercaseheads

\makeheadrule{plain}{\textwidth}{\normalrulethickness}

\makeoddhead{plain}{}{}{\rightmark}
\makeevenhead{plain}{\leftmark}{}{}

%\makeoddfoot{plain}{}{\sourcesansprolight DO NOT DISTRIBUTE}{\sourcesanspro\thepage}
%\makeevenfoot{plain}{\sourcesanspro\thepage}{\sourcesansprolight DO NOT DISTRIBUTE}{}
\makeoddfoot{plain}{}{}{\sourcesanspro\thepage}
\makeevenfoot{plain}{\sourcesanspro\thepage}{}{}

% customization of page notes cf. memoir
\RenewDocumentCommand{\sidebarfont}{}{\normalfont\footnotesize}
\RenewDocumentCommand{\sidebarform}{}{}

% customization of FiXme labels
\NewDocumentCommand{\FXLayoutMyInline}{+m +m +m}
{\@fxuseface{inline}[#2]}
\FXRegisterLayout{myinline}{\FXLayoutMyInline}
\fxsetup{
  layout=myinline
}
\RenewDocumentCommand{\fixmelogo}{}{}


\lstset{
  basicstyle=\ttfamily,
  keywordstyle=\bfseries,
  commentstyle=\itshape,
  numberstyle=\small,
  escapeinside={(*@}{@*)}
}

\NewDocumentCommand{\lst}{}{\lstinline}

% customization of itemize and enumerate environments cf. enumitem
\setlist{
  noitemsep,
  nosep,
  font=\normalfont\sourcesanspro\bfseries
}

\newlist{nlitemize}{itemize}{4}
\setlist*[nlitemize]{
  label={}
}

\setlist[itemize]{
  label=\textbullet{}
}

\newlist{alphenum}{enumerate}{4}
\setlist*[alphenum]{
  label=(\alph*)
}

\newlist{Alphenum}{enumerate}{4}
\setlist*[Alphenum]{
  label=(\Alph*)
}

\newlist{romanenum}{enumerate}{4}
\setlist*[romanenum]{
  label=(\roman*)
}

\newlist{Romanenum}{enumerate}{4}
\setlist*[Romanenum]{
  label=(\Roman*)
}

\newlist{arabicenum}{enumerate}{4}
\setlist*[arabicenum]{
  label=\arabic*.
}

% Cleveref counter names
\crefname{chapter}{Chapter}{Chapters}
\crefname{section}{Section}{Sections}
\crefname{thm}{Theorem}{Theorems}
\crefname{cla}{Claim}{Claims}
\crefname{lem}{Lemma}{Lemmas}
\crefname{prop}{Proposition}{Propositions}
\crefname{cor}{Corollary}{Corollaries}
\crefname{defn}{Definition}{Definitions}
\crefname{rem}{Remark}{Remarks}
\crefname{equation}{Equation}{Equations}
\crefname{exmp}{Example}{Examples}
\crefname{xca}{Exercise}{Exercises}
\crefname{step}{Step}{Steps}
\crefname{add}{Addendum}{Addenda}
\crefname{prf}{Proof}{Proofs}
\Crefname{thm}{Theorem}{Theorems}
\Crefname{cla}{Claim}{Claims}
\Crefname{lem}{Lemma}{Lemmata}
\Crefname{prop}{Proposition}{Propositions}
\Crefname{cor}{Corollary}{Corollaries}
\Crefname{defn}{Definition}{Definitions}
\Crefname{rem}{Remark}{Remarks}
\Crefname{equation}{Equation}{Equations}
\Crefname{exmp}{Example}{Examples}
\Crefname{xca}{Exercise}{Exercises}
\Crefname{step}{Step}{Steps}
\Crefname{add}{Addendum}{Addenda}
\Crefname{prf}{Proof}{Proofs}

% format shorthand
\NewDocumentCommand{\sbar}{o m}{\IfNoValueTF{#1}%
  {\sidebar{#2}}%
  {\sidebar{{\sourcesanspromedium{}#1} #2}}%
}
\NewDocumentCommand{\sbart}{o m}{\IfNoValueTF{#1}%
  {\sidebar{\textit{#2}}}%
  {\sidebar{{\sourcesanspromedium{}#1} \textit{#2}}}%
}

% math shorthand

\NewDocumentCommand{\Pp}{m}{^{\p{#1}}}

\NewDocumentCommand{\pinfty}{}{{+\infty}}
\NewDocumentCommand{\ninfty}{}{{-\infty}}

% Use \m to typeset math variables that take up multiple symbols.
\NewDocumentCommand{\m}{m}{\mathit{#1}}
\NewDocumentCommand{\M}{m}{\mathup{#1}}
\NewDocumentCommand{\q}{m}{\text{\texttt{#1}}}

% delimiters
\input{delimiters}
\input{mathoperators}
\input{constants}
\input{caseexp}
\input{mathfoundational}
\input{numbertheory}
\input{analysis}
\input{abstractalg}
\input{linalg}
\input{topology}
\input{probability}
%\input{probabilitydeprecated}
\input{numbersystems}
\input{matrices}
\input{logic}
\input{graph}
\input{setalg}
\input{categorytheory}
\input{computability}
\input{complexity}
\input{vector}
\input{typetheory}
%\input{rvdeprecated}
% deprecated constant function notation
%\NewDocumentCommand{\f}{}{_{\symsf{f}}}

% algorithms shorthand

\input{algorithms}

% text-in-equations
\NewDocumentCommand{\tdata}{}{\text{data}}
\NewDocumentCommand{\tmodel}{}{\text{model}}
\NewDocumentCommand{\ttrain}{}{\text{train}}
\NewDocumentCommand{\ttest}{}{\text{test}}
\NewDocumentCommand{\tensemble}{}{\text{ensemble}}

% % text shorthand

\newlength{\marginwidth}
\newlength{\widetextwidth}
\setlength{\marginwidth}{\marginparwidth}
\addtolength{\marginwidth}{\marginparsep}
\setlength{\widetextwidth}{\textwidth}
\addtolength{\widetextwidth}{\marginwidth}

\NewDocumentCommand{\nt}{m}{\textbf{#1}} % semantic markup: "new term"
\NewDocumentCommand{\ts}{m}{\textsc{#1}} % text symbol

\NewDocumentCommand{\todo}{O{} g}{\IfNoValueTF{#2}%
  {\fxnote[#1]{\textcolor{re}{TODO}}}%
  {\fxnote[#1]{\textcolor{re}{TODO: #2}}}
}
\NewDocumentCommand{\wontfix}{O{} g}{\IfNoValueTF{#2}%
  {\fxnote[#1]{\textbf{WON'T FIX}}}%
  {\fxnote[#1]{\textbf{WON'T FIX:} #2}}
}
