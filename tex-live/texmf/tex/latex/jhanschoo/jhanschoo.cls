\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jhanschoo}[2018/03/11 Johannes Choo's Class]

\DeclareOption{draft}{
  \PassOptionsToClass{\CurrentOption}{memoir}
  \PassOptionsToPackage{\CurrentOption}{hyperref}
  \PassOptionsToPackage{\CurrentOption}{fixme}
}

\DeclareOption{final}{
  \PassOptionsToClass{\CurrentOption}{memoir}
  \PassOptionsToPackage{\CurrentOption}{hyperref}
  \PassOptionsToPackage{\CurrentOption}{fixme}
}

\DeclareOption*{
  \ClassWarning{jhanschoo}{Unknown Option `\CurrentOption'}
}

\ProcessOptions\relax

\LoadClass[a4paper,12pt,twoside,onecolumn,article]{memoir}

\RequirePackage{xparse}

\RequirePackage{xcolor}

\let\mathrm\undefined
\RequirePackage{amsmath,amssymb}
\RequirePackage[amsmath,hyperref,thmmarks]{ntheorem}

\RequirePackage{mleftright}

\RequirePackage{fontspec}
\RequirePackage{realscripts}
\RequirePackage{unicode-math}
\RequirePackage{microtype}

\RequirePackage{enumitem}

\RequirePackage{longtable}
\RequirePackage{tabu}

\RequirePackage[inline,nomargin]{fixme}

\RequirePackage[unicode]{hyperref}

\RequirePackage{cleveref}


% define augmented matrices
\renewcommand*\env@matrix[1][*\c@MaxMatrixCols c]{%
  \hskip -\arraycolsep
  \let\@ifnextchar\new@ifnextchar
  \array{#1}}

% geometry, c.f. memoir
\tolerance 1414
\hbadness 1414
\emergencystretch 1.5em
\hfuzz 0.3pt
\widowpenalty=10000
\vfuzz \hfuzz
\raggedbottom

% Using Chivo for display text, Cochineal for body, and Pagella for
% math c.f. fontspec and unicode-math
\setmainfont{Cochineal}[Ligatures = TeX]
\setmonofont{DejaVuSansMono}[Scale=MatchLowercase,Ligatures=TeX]

\setmathfont{TeXGyrePagellaMath}[Scale=MatchLowercase]
\setmathfontface\mathrm{TeXGyrePagella-Regular}[Scale=MatchLowercase]
\let\mathup\undefined
\setmathfontface\mathup{TeXGyrePagella-Regular}[Scale=MatchLowercase]
\setmathfontface\mathit{TeXGyrePagella-Italic}[Scale=MatchLowercase]
\setmathfontface\mathbf{TeXGyrePagella-Bold}[Scale=MatchLowercase]
\setmathfontface\mathsf{DejaVuSans}[Scale=MatchLowercase]

\newfontfamily\chivo{Chivo}[
Extension = .otf,
Scale = MatchLowercase,
UprightFont = *-Regular,
ItalicFont = *-Italic,
BoldFont = *-Bold,
BoldItalicFont = *-BoldItalic,
Ligatures = TeX
]
\newfontfamily\chivobold{Chivo}[
Extension = .otf,
Scale = MatchLowercase,
UprightFont = *-Bold,
ItalicFont = *-BoldItalic,
BoldFont = *-Black,
BoldItalicFont = *-BlackItalic,
Ligatures = TeX
]
\newfontfamily\chivolight{Chivo}[
Extension = .otf,
Scale = MatchLowercase,
UprightFont = *-Light,
ItalicFont = *-LightItalic,
BoldFont = *-Light,
BoldItalicFont = *-LightItalic,
Ligatures = TeX
]

% microtype compatibility workaround
% c.f. https://tex.stackexchange.com/questions/373594/microtype-producing-dozens-of-unknown-slot-number-warnings
\def\MT@is@composite#1#2\relax{%
  \ifx\\#2\\\else
    \expandafter\def\expandafter\MT@char\expandafter{\csname\expandafter
                    \string\csname\MT@encoding\endcsname
                    \MT@detokenize@n{#1}-\MT@detokenize@n{#2}\endcsname}%
    % 3 lines added:
    \ifx\UnicodeEncodingName\@undefined\else
      \expandafter\expandafter\expandafter\MT@is@uni@comp\MT@char\iffontchar\else\fi\relax
    \fi
    \expandafter\expandafter\expandafter\MT@is@letter\MT@char\relax\relax
    \ifnum\MT@char@ < \z@
      \ifMT@xunicode
        \edef\MT@char{\MT@exp@two@c\MT@strip@prefix\meaning\MT@char>\relax}%
          \expandafter\MT@exp@two@c\expandafter\MT@is@charx\expandafter
            \MT@char\MT@charxstring\relax\relax\relax\relax\relax
      \fi
    \fi
  \fi
}
% new:
\def\MT@is@uni@comp#1\iffontchar#2\else#3\fi\relax{%
  \ifx\\#2\\\else\edef\MT@char{\iffontchar#2\fi}\fi
}


% definition of theorem environments, cf. ntheorem
\makeatletter
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
\makeatother

% Customize equation numbering, cf. amsmath
\numberwithin{equation}{chapter}

% customization of section headers cf. memoir

\setsecnumdepth{subsection}

\RenewDocumentCommand{\beforepartskip}{}{\null\vskip 50pt}
\RenewDocumentCommand{\afterpartskip}{}{\vskip 40pt}
\RenewDocumentCommand{\partnamefont}{}{\normalfont\chivolight\Huge}
\RenewDocumentCommand{\partnumfont}{}{\normalfont\chivolight\Huge}
\RenewDocumentCommand{\parttitlefont}{}{\normalfont\chivobold\bfseries\HUGE}
\nopartblankpage{}

\chapterstyle{default}
\RenewDocumentCommand{\chapterheadstart}{}{\vspace*{30pt}}
\RenewDocumentCommand{\afterchapternum}{}{\par\nobreak\vskip 5pt}
\RenewDocumentCommand{\afterchaptertitle}{}{\par\nobreak\vskip 10pt}
\RenewDocumentCommand{\chapnamefont}{}{\normalfont\chivo\huge}
\RenewDocumentCommand{\chapnumfont}{}{\normalfont\chivo\huge}
\RenewDocumentCommand{\chaptitlefont}{}{\normalfont\chivobold\Huge\bfseries}

\setsecheadstyle{\normalfont\chivobold\bfseries\Large}%
\setsubsecheadstyle{\normalfont\chivobold\bfseries\itshape\large}%
\setsubsubsecheadstyle{\normalfont\chivo\itshape\large}%
\setparaheadstyle{\normalfont\chivo\bfseries\large}%
\setsubparaheadstyle{\normalfont\chivo\large}%

% customization of page styles cf. memoir
\createmark{chapter}{left}{shownumber}
{\normalfont\chivobold\small\@chapapp\ }{\ \tiny}
\createmark{section}{right}{shownumber}
{\normalfont\chivobold\small}{\ \tiny}

\nouppercaseheads

\makeheadrule{plain}{\textwidth}{\normalrulethickness}

\makeoddhead{plain}{}{}{\rightmark}
\makeevenhead{plain}{\leftmark}{}{}

\makeoddfoot{plain}{}{}{\chivo\thepage}
\makeevenfoot{plain}{\chivo\thepage}{}{}

% customization of page notes cf. memoir
\RenewDocumentCommand{\sidebarfont}{}{\normalfont\footnotesize}
\RenewDocumentCommand{\sidebarform}{}{}

% customization of itemize and enumerate environments cf. enumitem
\setlist{
  noitemsep,
  nosep,
  font=\normalfont\chivobold\bfseries
}

\setlist[itemize]{
  label=\textbullet{}
}

\newlist{alphenum}{enumerate}{4}
\setlist*[alphenum]{
  label= (\alph*)
}

\newlist{romanenum}{enumerate}{4}
\setlist*[romanenum]{
  label= (\roman*)
}

\newlist{Romanenum}{enumerate}{4}
\setlist*[Romanenum]{
  label=(\Roman*)
}

% customization of tabu environments
\global\tabulinesep=4pt

% redefine FiXme labels to have brackets
%\renewcommand*\FXLayoutInline[3]{%
%  {\@fxuseface{inline} (\fxnotename{#1}: \textnormal{#2})}%
%}

% Cleveref counter names
\crefname{thm}{thm.}{thms.}
\crefname{lem}{lem.}{lems.}
\crefname{prop}{prop.}{props.}
\crefname{cor}{cor.}{cors.}
\crefname{defn}{defn.}{defns.}
\crefname{rem}{rem.}{rems.}
\crefname{exmp}{exmp.}{exmps.}
\crefname{xca}{exerc.}{exercs.}
\crefname{step}{step}{steps}
\crefname{add}{add.}{adds.}
\crefname{prf}{proof}{proofs}
\Crefname{thm}{Theorem}{Theorems}
\Crefname{lem}{Lemma}{Lemmata}
\Crefname{prop}{Proposition}{Propositions}
\Crefname{cor}{Corollary}{Corollaries}
\Crefname{defn}{Definition}{Definitions}
\Crefname{rem}{Remark}{Remarks}
\Crefname{exmp}{Example}{Examples}
\Crefname{xca}{Exercise}{Exercises}
\Crefname{step}{Step}{Steps}
\Crefname{add}{Addendum}{Addenda}
\Crefname{prf}{Proof}{Proofs}

% format shorthand
\NewDocumentCommand{\sbar}{o m}{\IfNoValueTF{#1}%
  {\sidebar{#2}}%
  {\sidebar{{\chivo\textbf{#1}} #2}}%
}
\NewDocumentCommand{\sbart}{o m}{\IfNoValueTF{#1}%
  {\sidebar{\textit{#2}}}%
  {\sidebar{{\chivo\textbf{#1}} \textit{#2}}}%
}

% math shorthand

% delimiters
\NewDocumentCommand{\abs}{m}{\mleft\lvert{#1}\mright\rvert}
\NewDocumentCommand{\norm}{m}{\mleft\lVert{#1}\mright\rVert}
\NewDocumentCommand{\fl}{m}{\mleft\lfloor{#1}\mright\rfloor}
\NewDocumentCommand{\ce}{m}{\mleft\lceil{#1}\mright\rceil}
\NewDocumentCommand{\p}{m}{\mleft({#1}\mright)}
\NewDocumentCommand{\ad}{m}{\mleft\langle{#1}\mright\rangle}
\NewDocumentCommand{\B}{m}{\mleft\{{#1}\mright\}}
\NewDocumentCommand{\s}{m}{\mleft[{#1}\mright]}
\NewDocumentCommand{\Div}{m m}{\mleft.{#1}\middle/{#2}\mright.}
\NewDocumentCommand{\SP}{m}{\mleft[{#1}\mright)}
\NewDocumentCommand{\PS}{m}{\mleft({#1}\mright]}

% math operators

\DeclareMathOperator{\adj}{adj}
\DeclareMathOperator*{\argmin}{arg\ min}
\DeclareMathOperator*{\argmax}{arg\ max}
\DeclareMathOperator{\bias}{bias}
\DeclareMathOperator{\Cov}{Cov}
\DeclareMathOperator{\diag}{diag}
\DeclareMathOperator{\diam}{diam}
\DeclareMathOperator{\Int}{Int}
\DeclareMathOperator{\Cl}{Cl}
\DeclareMathOperator{\columnrank}{column\ rank}
\DeclareMathOperator{\D}{D}
\DeclareMathOperator{\E}{E}
\DeclareMathOperator{\Laplace}{Laplace}
\DeclareMathOperator{\nullity}{nullity}
\DeclareMathOperator*{\plim}{plim}
\DeclareMathOperator{\rank}{rank}
\DeclareMathOperator{\rowrank}{row\ rank}
\DeclareMathOperator{\SE}{SE}
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator{\softmax}{softmax}
\DeclareMathOperator{\tr}{tr}
\DeclareMathOperator{\Var}{Var}

% probability operator shorthands
\NewDocumentCommand{\Es}{O{} m}{\E_{#1}\s{#2}}
\NewDocumentCommand{\Vars}{O{} m}{\Var_{#1}\s{#2}}
\NewDocumentCommand{\Covs}{O{} m}{\Cov_{#1}\s{#2}}


\NewDocumentCommand{\bbA}{}{\symbb{A}}
\NewDocumentCommand{\bbC}{}{\symbb{C}}
\NewDocumentCommand{\bbE}{}{\symbb{E}}
\NewDocumentCommand{\bbF}{}{\symbb{F}}
\NewDocumentCommand{\bbQ}{}{\symbb{Q}}
\NewDocumentCommand{\bbR}{}{\symbb{R}}
\NewDocumentCommand{\bbS}{}{\symbb{S}}
\NewDocumentCommand{\bbX}{}{\symbb{X}}
\NewDocumentCommand{\bbZ}{}{\symbb{Z}}
\NewDocumentCommand{\Qop}{}{\bbQ_{\geq0}}
\NewDocumentCommand{\Qp}{}{\bbQ_{>0}}
\NewDocumentCommand{\Rop}{}{\bbR_{\geq0}}
\NewDocumentCommand{\Rp}{}{\bbR_{>0}}
\NewDocumentCommand{\Zop}{}{\bbZ_{\geq0}}
\NewDocumentCommand{\Zp}{}{\bbZ_{>0}}
\NewDocumentCommand{\calA}{}{\symcal{A}}
\NewDocumentCommand{\calB}{}{\symcal{B}}
\NewDocumentCommand{\calC}{}{\symcal{C}}
\NewDocumentCommand{\calD}{}{\symcal{D}}
\NewDocumentCommand{\calE}{}{\symcal{E}}
\NewDocumentCommand{\calF}{}{\symcal{F}}
\NewDocumentCommand{\calG}{}{\symcal{G}}
\NewDocumentCommand{\calH}{}{\symcal{H}}
\NewDocumentCommand{\calL}{}{\symcal{L}}
\NewDocumentCommand{\calN}{}{\symcal{N}}
\NewDocumentCommand{\calP}{}{\symcal{P}}
\NewDocumentCommand{\calS}{}{\symcal{S}}
\NewDocumentCommand{\calT}{}{\symcal{T}}
\NewDocumentCommand{\calU}{}{\symcal{U}}
\NewDocumentCommand{\upb}{}{\symup{b}}
\NewDocumentCommand{\upB}{}{\symup{B}}
 
% logical
\NewDocumentCommand{\AND}{}{\wedge}
\NewDocumentCommand{\OR}{}{\vee}
\NewDocumentCommand{\bigAND}{}{\bigwedge}
\NewDocumentCommand{\bigOR}{}{\bigvee}
\NewDocumentCommand{\IMP}{}{\Rightarrow}
\NewDocumentCommand{\IMPD}{}{\Leftarrow}
\NewDocumentCommand{\EQUIV}{}{\Leftrightarrow}

% set algebra
\NewDocumentCommand{\symdif}{}{\triangle}
\NewDocumentCommand{\sm}{}{\smallsetminus}
\NewDocumentCommand{\sand}{}{\cap}
\NewDocumentCommand{\sor}{}{\cup}
\NewDocumentCommand{\bigsand}{}{\bigcap}
\NewDocumentCommand{\bigsor}{}{\bigcup}
\NewDocumentCommand{\sle}{}{\subseteq}
\NewDocumentCommand{\sge}{}{\supseteq}
\NewDocumentCommand{\slt}{}{\subsetneq}
\NewDocumentCommand{\sgt}{}{\supsetneq}

% cartesian product
\NewDocumentCommand{\cp}{}{\times}
\NewDocumentCommand{\bigcp}{}{\prod}

% topology
\NewDocumentCommand{\bnd}{m}{\bar{#1}}
\NewDocumentCommand{\cl}{m}{#1^{-}}
\NewDocumentCommand{\inte}{m}{#1^\circ}

% operators of functions
\NewDocumentCommand{\comp}{}{\circ}
\NewDocumentCommand{\restr}{}{\upharpoonright}

% power set
\NewDocumentCommand{\pow}{m}{\symcal{P}\p{#1}}

% row-equivalence with reduced row echelon form
\NewDocumentCommand{\rref}{}{\xrightarrow{\mathup{rref}}}

% Use \m to typeset math variables that take up multiple symbols.
\NewDocumentCommand{\m}{m}{\mathit{#1}}
\NewDocumentCommand{\M}{m}{\mathup{#1}}

% vector shorthand
% (w as a commonly used vector variable character)
\NewDocumentCommand{\w}{m}{\symbfit{#1}}
\NewDocumentCommand{\wa}{}{\w{a}}
\NewDocumentCommand{\wb}{}{\w{b}}
\NewDocumentCommand{\we}{}{\w{\epsilon}}
\NewDocumentCommand{\wrh}{}{\w{\rho}}
\NewDocumentCommand{\wi}{}{\w{i}}
\NewDocumentCommand{\wj}{}{\w{j}}
\NewDocumentCommand{\wx}{}{\w{x}}
\NewDocumentCommand{\wy}{}{\w{y}}
\NewDocumentCommand{\wz}{}{\w{z}}
\NewDocumentCommand{\wo}{}{\symbfup{0}}
\NewDocumentCommand{\wA}{}{\w{A}}
\NewDocumentCommand{\wB}{}{\w{B}}
\NewDocumentCommand{\wC}{}{\w{C}}
\NewDocumentCommand{\wD}{}{\w{D}}
\NewDocumentCommand{\wE}{}{\w{E}}
\NewDocumentCommand{\wI}{}{\w{I}}
\NewDocumentCommand{\wP}{}{\w{P}}
\NewDocumentCommand{\Fmn}{}{F^{m\times{}n}}
\NewDocumentCommand{\Fmm}{}{F^{m\times{}m}}
\NewDocumentCommand{\Fmo}{}{F^{n\times{}1}}
\NewDocumentCommand{\Fnn}{}{F^{n\times{}n}}
\NewDocumentCommand{\Fno}{}{F^{n\times{}1}}
\NewDocumentCommand{\Fx}{}{F\s{x}}
\NewDocumentCommand{\Kmn}{}{K^{m\times{}n}}
\NewDocumentCommand{\Knn}{}{K^{n\times{}n}}
\NewDocumentCommand{\LV}{m}{\Lambda^{#1}\p{V}}
\NewDocumentCommand{\MV}{m}{M^{#1}\p{V}}
\NewDocumentCommand{\Rmn}{}{\symbb{R}^{m\times n}}
\NewDocumentCommand{\Rnn}{}{\symbb{R}^{n\times n}}
\NewDocumentCommand{\DKL}{}{D_{\M{KL}}}

% random variables
\NewDocumentCommand{\rv}{m}{\symup{#1}}
\NewDocumentCommand{\rw}{m}{\symbfup{#1}}

% given
\NewDocumentCommand{\giv}{}{\mid}
\NewDocumentCommand{\indep}{}{\bot}

% divides |
\NewDocumentCommand{\mdi}{}{\mid}
\NewDocumentCommand{\nmdi}{}{\nmid}

% inverse
\NewDocumentCommand{\inv}{}{^{-1}}

% antidifferential
\NewDocumentCommand{\adif}{}{\D\inv}

% transpose
\NewDocumentCommand{\T}{}{\intercal}

% exterior product
\NewDocumentCommand{\ext}{}{\wedge}

% Hadamard product
\NewDocumentCommand{\Hp}{}{\odot}

% tensor
\NewDocumentCommand{\te}{m}{\symbfsfup{#1}}
\NewDocumentCommand{\tei}{m}{\symsfit{#1}}

% Complex conjugate
\NewDocumentCommand{\conj}{m}{\overline{#1}}

\NewDocumentCommand{\n}{O{1} G{{}}}{#1\mathbin{:}#2}

% text-in-equations
\NewDocumentCommand{\tdata}{}{\text{data}}
\NewDocumentCommand{\tmodel}{}{\text{model}}
\NewDocumentCommand{\ttrain}{}{\text{train}}
\NewDocumentCommand{\ttest}{}{\text{test}}
\NewDocumentCommand{\tensemble}{}{\text{ensemble}}

% text shorthand

\NewDocumentCommand{\nt}{m}{\textbf{#1}} % semantic markup: "new term"

\NewDocumentCommand{\todo}{O{} g}{\IfNoValueTF{#2}%
  {\fxnote[#1]{\textbf{TODO}}}%
  {\fxnote[#1]{\textbf{TODO:} #2}}
}
\NewDocumentCommand{\wontfix}{O{} g}{\IfNoValueTF{#2}%
  {\fxnote[#1]{\textbf{WON'T FIX}}}%
  {\fxnote[#1]{\textbf{WON'T FIX:} #2}}
}
