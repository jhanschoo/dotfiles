\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vermillion}[2018/03/11 Vermillion Class]

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

\LoadClass[a4paper,12pt,onecolumn,article]{memoir}

\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{graphicx}
\RequirePackage{rotating}

\RequirePackage{multicol}
\RequirePackage{blindtext}

\RequirePackage[table]{xcolor}

\let\mathrm\undefined
\RequirePackage{amsmath,amssymb}
\RequirePackage[amsmath,hyperref,thmmarks]{ntheorem}

% hack for name conflict
\let\greek\undefined

% workaround for missing hyphenation in LuaLaTeX, see https://github.com/reutenauer/polyglossia/issues/129
\usepackage[base]{babel}
\usepackage{polyglossia}

% Additional markup

%\RequirePackage[binary-units]{siunitx}

\RequirePackage{mleftright}

\RequirePackage{fontspec}
\RequirePackage{realscripts}
\RequirePackage[math-style=ISO]{unicode-math}
\RequirePackage{microtype}

\RequirePackage[inline]{enumitem}

\RequirePackage{longtable}
\RequirePackage{tabu}
\RequirePackage{float}

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
urlcolor=pu]{hyperref}

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

%\pagecolor{bg}
%\color{fg}

% define augmented matrices
\renewcommand*\env@matrix[1][*\c@MaxMatrixCols c]{%
  \hskip -\arraycolsep
  \let\@ifnextchar\new@ifnextchar
  \array{#1}}

% geometry, c.f. memoir
\tolerance 1600
%\hbadness 1600
\emergencystretch 1.5em
%\hfuzz 0.3pt
%\widowpenalty=10000
%\vfuzz \hfuzz
\raggedbottom

% Using Lato for display text, Cochineal for body, and Pagella for
% math c.f. fontspec and unicode-math
\setmainfont{Coelacanth}[Ligatures = TeX]
%\setmainfont{LinLibertine}[
%Extension = .otf,
%UprightFont = *_R,
%ItalicFont = *_RI,
%BoldFont = *_RB,
%BoldItalicFont = *_RBI,
%Ligatures = TeX
%]
\setmonofont{DejaVuSansMono}[Scale=MatchLowercase,Ligatures=TeX]

%\setmathfont{TeXGyreTermesMath}[Scale=MatchLowercase]
%\setmathfontface\mathrm{TeXGyreTermes-Regular}[Scale=MatchLowercase]
%\let\mathup\undefined
%\setmathfontface\mathup{TeXGyreTermes-Regular}[Scale=MatchLowercase]
%\setmathfontface\mathit{TeXGyreTermes-Italic}[Scale=MatchLowercase]
%\setmathfontface\mathbf{TeXGyreTermes-Bold}[Scale=MatchLowercase]
%\setmathfontface\mathsf{TeXGyreHeros-Regular}[Scale=MatchLowercase]
\setmathfont{TeXGyrePagellaMath}[Scale=MatchLowercase]
\setmathfontface\mathrm{TeXGyrePagella-Regular}[Scale=MatchLowercase]
\let\mathup\undefined
\setmathfontface\mathup{TeXGyrePagella-Regular}[Scale=MatchLowercase]
\setmathfontface\mathit{TeXGyrePagella-Italic}[Scale=MatchLowercase]
\setmathfontface\mathbf{TeXGyrePagella-Bold}[Scale=MatchLowercase]
\setmathfontface\mathsf{Lato}[Scale=MatchLowercase]

\newfontfamily\lato{Lato}[
Extension = .ttf,
Scale = MatchUppercase,
UprightFont = *-Regular,
ItalicFont = *-Italic,
BoldFont = *-Bold,
BoldItalicFont = *-BoldItalic,
Numbers = OldStyle,
Ligatures = TeX
]
\newfontfamily\latosemibold{Lato}[
Extension = .ttf,
Scale = MatchUppercase,
UprightFont = *-Semibold,
ItalicFont = *-SemiboldItalic,
Numbers = OldStyle,
Ligatures = TeX
]
\newfontfamily\latobold{Lato}[
Extension = .ttf,
Scale = MatchUppercase,
UprightFont = *-Bold,
ItalicFont = *-BoldItalic,
BoldFont = *-Black,
BoldItalicFont = *-BlackItalic,
Numbers = OldStyle,
Ligatures = TeX
]
\newfontfamily\latoblack{Lato}[
Extension = .ttf,
Scale = MatchUppercase,
UprightFont = *-Black,
ItalicFont = *-BlackItalic,
Numbers = OldStyle,
Ligatures = TeX
]
\newfontfamily\latothin{Lato}[
Extension = .ttf,
Scale = MatchUppercase,
UprightFont = *-Thin,
ItalicFont = *-ThinItalic,
Numbers = OldStyle,
Ligatures = TeX
]
\newfontfamily\latolight{Lato}[
Extension = .ttf,
Scale = MatchUppercase,
UprightFont = *-Light,
ItalicFont = *-LightItalic,
Numbers = OldStyle,
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
\RenewDocumentCommand{\partnamefont}{}{\normalfont\latothin\Huge}
\RenewDocumentCommand{\partnumfont}{}{\normalfont\latothin\Huge}
\RenewDocumentCommand{\parttitlefont}{}{\normalfont\latoblack\HUGE}
\nopartblankpage{}

\chapterstyle{default}
\RenewDocumentCommand{\chapterheadstart}{}{\vspace*{30pt}}
\RenewDocumentCommand{\afterchapternum}{}{\par\nobreak\vskip 5pt}
\RenewDocumentCommand{\afterchaptertitle}{}{\par\nobreak\vskip 10pt}
\RenewDocumentCommand{\chapnamefont}{}{\normalfont\latolight\huge}
\RenewDocumentCommand{\chapnumfont}{}{\normalfont\latolight\huge}
\RenewDocumentCommand{\chaptitlefont}{}{\normalfont\latoblack\Huge}

\setsecheadstyle{\normalfont\latobold\Large}%
\setsubsecheadstyle{\normalfont\latobold\large}%
\setsubsubsecheadstyle{\normalfont\lato\large}%
\setparaheadstyle{\normalfont\latosemibold\large}%
\setsubparaheadstyle{\normalfont\lato\large}%

% customization of page styles cf. memoir
\createmark{chapter}{left}{shownumber}
{\normalfont\latobold\small\@chapapp\ }{\ \tiny}
\createmark{section}{right}{shownumber}
{\normalfont\latobold\small}{\ \tiny}

\nouppercaseheads

\makeheadrule{plain}{\textwidth}{\normalrulethickness}

\makeoddhead{plain}{}{}{\rightmark}
\makeevenhead{plain}{\leftmark}{}{}

%\makeoddfoot{plain}{}{\latolight DO NOT DISTRIBUTE}{\lato\thepage}
%\makeevenfoot{plain}{\lato\thepage}{\latolight DO NOT DISTRIBUTE}{}
\makeoddfoot{plain}{}{}{\lato\thepage}
\makeevenfoot{plain}{\lato\thepage}{}{}

% customization of page notes cf. memoir
\RenewDocumentCommand{\sidebarfont}{}{\normalfont\footnotesize}
\RenewDocumentCommand{\sidebarform}{}{}

\NewDocumentCommand{\FXLayoutMyInline}{+m +m +m}
{\@fxuseface{inline}[#2]}

% customization of FiXme labels
\FXRegisterLayout{myinline}{\FXLayoutMyInline}

\fxsetup{
  layout=myinline
}

% customization of itemize and enumerate environments cf. enumitem
\setlist{
  noitemsep,
  nosep,
  font=\normalfont\latobold
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

% customization of tabu environments
\global\tabulinesep=2pt

% redefine FiXme labels to have brackets
%\renewcommand*\FXLayoutInline[3]{%
%  {\@fxuseface{inline} (\fxnotename{#1}: \textnormal{#2})}%
%}
\RenewDocumentCommand{\fixmelogo}{}{}

% Cleveref counter names
\crefname{chapter}{Chapter}{Chapters}
\crefname{section}{Section}{Sections}
\crefname{thm}{Theorem}{Theorems}
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
  {\sidebar{{\latosemibold{}#1} #2}}%
}
\NewDocumentCommand{\sbart}{o m}{\IfNoValueTF{#1}%
  {\sidebar{\textit{#2}}}%
  {\sidebar{{\latosemibold{}#1} \textit{#2}}}%
}

% math shorthand

% delimiters
\NewDocumentCommand{\abs}{m}{\mleft\lvert #1 \mright\rvert}
\NewDocumentCommand{\norm}{m}{\mleft\lVert #1 \mright\rVert}
\NewDocumentCommand{\fl}{m}{\mleft\lfloor #1 \mright\rfloor}
\NewDocumentCommand{\ce}{m}{\mleft\lceil #1 \mright\rceil}
\NewDocumentCommand{\p}{m}{\mleft( #1 \mright)}
\NewDocumentCommand{\ad}{m}{\mleft\langle #1 \mright\rangle}
\NewDocumentCommand{\B}{m}{\mleft\{ #1 \mright\}}
\NewDocumentCommand{\s}{m}{\mleft[ #1 \mright]}
\NewDocumentCommand{\Div}{m m}{\mleft. #1 \middle/ #2 \mright.}
\NewDocumentCommand{\pp}{m m}{\mleft( #1 .. #2 \mright)}
\NewDocumentCommand{\bp}{m m}{\mleft[ #1 .. #2 \mright)}
\NewDocumentCommand{\pb}{m m}{\mleft( #1 .. #2 \mright]}
\NewDocumentCommand{\bb}{m m}{\mleft[ #1 .. #2 \mright]}
\NewDocumentCommand{\na}{m m}{\mleft\{ #1 .. #2 \mright\rangle}
\NewDocumentCommand{\an}{m m}{\mleft\langle #1 .. #2 \mright\}}

\NewDocumentCommand{\Pp}{m}{^{\p{#1}}}

\NewDocumentCommand{\pinfty}{}{{+\infty}}
\NewDocumentCommand{\minfty}{}{{-\infty}}

% fcase
\NewDocumentCommand{\fcase}{m}{\mleft\{\begin{aligned}#1\end{aligned}\mright\}}
\NewDocumentCommand{\THEN}{}{&}
\NewDocumentCommand{\IF}{}{&&\gets}

% math operators

\DeclareMathOperator{\adj}{adj}
\DeclareMathOperator{\Ancestors}{Ancestors}
\DeclareMathOperator*{\argmin}{arg\ min}
\DeclareMathOperator*{\argmax}{arg\ max}
\DeclareMathOperator{\Aut}{Aut} % automorphism
\DeclareMathOperator{\Bern}{Bern}
\DeclareMathOperator{\upBeta}{Beta}
\DeclareMathOperator{\Bin}{Bin}
\DeclareMathOperator{\bias}{bias}
\DeclareMathOperator{\Boundary}{Boundary}
\DeclareMathOperator{\Cont}{C}
\DeclareMathOperator{\characteristic}{char}
\DeclareMathOperator{\cf}{cf}
\DeclareMathOperator{\cod}{cod}
\DeclareMathOperator{\cossim}{cossim}
\DeclareMathOperator{\Ch}{Ch}
\DeclareMathOperator{\Cl}{Cl}
\DeclareMathOperator{\Cov}{Cov}
\DeclareMathOperator{\columnrank}{column\ rank}
\DeclareMathOperator{\D}{D}
\DeclareMathOperator{\Descendants}{Descendants}
\DeclareMathOperator{\df}{df}
\DeclareMathOperator{\DFT}{DFT}
\DeclareMathOperator{\diag}{diag}
\DeclareMathOperator*{\diam}{diam}
\DeclareMathOperator{\dom}{dom}
\DeclareMathOperator{\dsep}{d-sep}
\DeclareMathOperator{\E}{E}
\DeclareMathOperator{\Eclose}{Eclose}
\DeclareMathOperator{\eH}{H}
\DeclareMathOperator{\eb}{eb}
\DeclareMathOperator{\epig}{epigraph}
\DeclareMathOperator{\ERM}{ERM}
\DeclareMathOperator{\GL}{GL}
\DeclareMathOperator{\glb}{glb}
\DeclareMathOperator{\Hom}{Hom} % homomorphism
\DeclareMathOperator{\I}{I}
\DeclareMathOperator{\im}{im}
\DeclareMathOperator{\Img}{Im}
\DeclareMathOperator{\Int}{Int}
\DeclareMathOperator{\id}{id}
\DeclareMathOperator{\idf}{idf}
\DeclareMathOperator{\Ker}{Ker}
\DeclareMathOperator{\KL}{KL}
\DeclareMathOperator{\Laplace}{Laplace}
\DeclareMathOperator{\lcm}{lcm}
\DeclareMathOperator{\lub}{lub}
\DeclareMathOperator{\MAP}{MAP}
\DeclareMathOperator{\MB}{MB}
\DeclareMathOperator{\ML}{ML}
\DeclareMathOperator{\Nb}{Nb}
\DeclareMathOperator{\netscore}{net-score}
\DeclareMathOperator{\NonDescendants}{NonDescendants}
\DeclareMathOperator{\nul}{null}
\DeclareMathOperator{\nullity}{nullity}
\DeclareMathOperator{\ntf}{ntf}
\DeclareMathOperator{\ord}{ord}
\DeclareMathOperator{\Pa}{Pa}
\DeclareMathOperator*{\plim}{plim}
\DeclareMathOperator{\range}{range}
\DeclareMathOperator{\rk}{rk}
\DeclareMathOperator{\rowrank}{row\ rank}
\DeclareMathOperator{\Scope}{Scope}
\DeclareMathOperator{\SE}{SE}
\DeclareMathOperator{\sep}{sep}
\DeclareMathOperator{\Seq}{Seq}
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator{\SL}{SL}
\DeclareMathOperator{\SO}{SO}
\DeclareMathOperator{\softmax}{softmax}
\DeclareMathOperator{\spn}{span}
\DeclareMathOperator{\Spec}{Spec}
\DeclareMathOperator{\supp}{supp}
\DeclareMathOperator*{\st}{s.t.}
\DeclareMathOperator{\Sym}{Sym}
\DeclareMathOperator{\tf}{tf}
\DeclareMathOperator{\tfidf}{tf-idf}
\DeclareMathOperator{\tr}{tr}
\DeclareMathOperator{\unif}{U}
\DeclareMathOperator{\Val}{Val}
\DeclareMathOperator{\Var}{Var}
\DeclareMathOperator{\VCdim}{VCdim}
\DeclareMathOperator{\wf}{wf}
\DeclareMathOperator{\wfidf}{wf-idf}
\DeclareMathOperator{\wop}{w}

% probability operator shorthands
\NewDocumentCommand{\Es}{O{} m}{\E_{#1}\s{#2}}
\NewDocumentCommand{\Vars}{O{} m}{\Var_{#1}\s{#2}}
\NewDocumentCommand{\Covs}{O{} m}{\Cov_{#1}\s{#2}}

\NewDocumentCommand{\Cd}{}{\symrm{d}}
\NewDocumentCommand{\CDelta}{}{\symrm{\Delta}}
\NewDocumentCommand{\CE}{}{\symrm{E}}
\NewDocumentCommand{\Ce}{}{\symrm{e}}
\NewDocumentCommand{\Cepsilon}{}{\symrm{\epsilon}}
\NewDocumentCommand{\CH}{}{\symrm{H}}
\NewDocumentCommand{\CI}{}{\symrm{I}}
\NewDocumentCommand{\Ci}{}{\symrm{i}}
\NewDocumentCommand{\CL}{}{\symrm{L}}
\NewDocumentCommand{\CLambda}{}{\symrm{\Lambda}}
\NewDocumentCommand{\Clambda}{}{\symrm{\lambda}}
\NewDocumentCommand{\Cm}{}{\symrm{m}}
\NewDocumentCommand{\Cmu}{}{\symrm{\mu}}
\NewDocumentCommand{\CN}{}{\symrm{N}}
\NewDocumentCommand{\CU}{}{\symrm{U}}
\NewDocumentCommand{\Cu}{}{\symrm{u}}
\NewDocumentCommand{\CX}{}{\symrm{X}}
\NewDocumentCommand{\Cx}{}{\symrm{x}}
\NewDocumentCommand{\Ctau}{}{\symrm{\tau}}
\NewDocumentCommand{\Cpi}{}{\symrm{\pi}}
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
\NewDocumentCommand{\calI}{}{\symcal{I}}
\NewDocumentCommand{\calJ}{}{\symcal{J}}
\NewDocumentCommand{\calK}{}{\symcal{K}}
\NewDocumentCommand{\calL}{}{\symcal{L}}
\NewDocumentCommand{\calM}{}{\symcal{M}}
\NewDocumentCommand{\calN}{}{\symcal{N}}
\NewDocumentCommand{\calO}{}{\symcal{O}}
\NewDocumentCommand{\calP}{}{\symcal{P}}
\NewDocumentCommand{\calR}{}{\symcal{R}}
\NewDocumentCommand{\calS}{}{\symcal{S}}
\NewDocumentCommand{\calT}{}{\symcal{T}}
\NewDocumentCommand{\calU}{}{\symcal{U}}
\NewDocumentCommand{\calW}{}{\symcal{W}}
\NewDocumentCommand{\calX}{}{\symcal{X}}
\NewDocumentCommand{\calY}{}{\symcal{Y}}
\NewDocumentCommand{\calZ}{}{\symcal{Z}}
\NewDocumentCommand{\sft}{}{\symsf{t}}
\NewDocumentCommand{\sfx}{}{\symsf{x}}
\NewDocumentCommand{\upb}{}{\symup{b}}
\NewDocumentCommand{\upB}{}{\symup{B}}
\NewDocumentCommand{\upZ}{}{\symup{Z}}

% matrices
\NewDocumentCommand{\pmat}{m}{\begin{pmatrix}#1\end{pmatrix}}
\NewDocumentCommand{\vmat}{m}{\begin{vmatrix}#1\end{vmatrix}}
\NewDocumentCommand{\smmat}{m}{\begin{smallmatrix}#1\end{smallmatrix}}

% logical
\NewDocumentCommand{\AND}{}{\wedge}
\NewDocumentCommand{\OR}{}{\vee}
\NewDocumentCommand{\bigAND}{}{\bigwedge}
\NewDocumentCommand{\bigOR}{}{\bigvee}
\NewDocumentCommand{\IMP}{}{\Rightarrow}
\NewDocumentCommand{\IMPD}{}{\Leftarrow}
\NewDocumentCommand{\EQUIV}{}{\Leftrightarrow}

% neighbors in path of graph
\NewDocumentCommand{\pn}{}{\dotsminusdots}

% group
\NewDocumentCommand{\nsg}{}{\triangleleft}

% set algebra
\NewDocumentCommand{\ssd}{}{\triangle} % set symmetric difference
\NewDocumentCommand{\sm}{}{\smallsetminus}
\NewDocumentCommand{\sand}{}{\cap}
\NewDocumentCommand{\sor}{}{\cup}
\NewDocumentCommand{\bigsand}{O{} m O{}}{\bigcap_{#3}^{#1}{#2}}
\NewDocumentCommand{\bigsor}{O{} m O{}}{\bigcup_{#3}^{#1}{#2}}
\NewDocumentCommand{\sle}{}{\subseteq}
\NewDocumentCommand{\nsle}{}{\nsubseteq}
\NewDocumentCommand{\sge}{}{\supseteq}
\NewDocumentCommand{\nsge}{}{\nsupseteq}
\NewDocumentCommand{\slt}{}{\subsetneq}
\NewDocumentCommand{\sgt}{}{\supsetneq}

% limit, sum, sequence and integral shorthand
\NewDocumentCommand{\lims}{}{\lim_{<\infty}}
\NewDocumentCommand{\limf}{m}{\lim_{\neq #1}}
\NewDocumentCommand{\limr}{m}{\lim_{> #1}}
\NewDocumentCommand{\liml}{m}{\lim_{< #1}}
\NewDocumentCommand{\limsups}{}{\limsup_{<\infty}}
\NewDocumentCommand{\liminfs}{}{\liminf_{<\infty}}
\NewDocumentCommand{\limfr}{m m}{\lim_{#1\searrow #2}}
\NewDocumentCommand{\limfl}{m m}{\lim_{#1\nearrow #2}}
\NewDocumentCommand{\limn}{O{n} O{}}{\lim_{#1\to{#2}\infty}}
\NewDocumentCommand{\limsupn}{O{n} O{}}{\limsup_{#1\to{#2}\infty}}
\NewDocumentCommand{\liminfn}{O{n} O{}}{\liminf_{#1\to{#2}\infty}}
\NewDocumentCommand{\psum}{O{\n m} m O{n}}{\sum_{#3}^{#1} #2}
\NewDocumentCommand{\sumn}{O{} m O{n}}{\sum_{<\infty}\seqn[#1]{#2}[#3]}
\NewDocumentCommand{\sumno}{O{\Zop} m O{n}}{\sum_{<\infty}\seqno[#1]{#2}[#3]}
\NewDocumentCommand{\seqn}{O{} m O{n}}{\p{#2}_{#3}^{#1}}
\NewDocumentCommand{\seqno}{O{\Zop} m O{n}}{\p{#2}_{#3}^{#1}}
\NewDocumentCommand{\setn}{O{} m O{n}}{\B{#2}_{#3}^{#1}}
\NewDocumentCommand{\setno}{O{\Zop} m O{n}}{\B{#2}_{#3}^{#1}}
\NewDocumentCommand{\intu}{m}{\int^{\searrow #1}}
\NewDocumentCommand{\intl}{m}{\int^{\nearrow #1}}
\NewDocumentCommand{\intd}{m}{\int^{#1}}

% structure generated
\NewDocumentCommand{\ggen}{O{} m O{}}{\ad{#2}_{#3}^{#1}}

% function
\NewDocumentCommand{\f}{}{_{\symsf{f}}}

% Iversonian
\NewDocumentCommand{\iver}{m}{\sfi\s{#1}}

% cartesian product
\NewDocumentCommand{\cp}{}{\times}
\NewDocumentCommand{\bigcp}{}{\prod}

% direct sum
\NewDocumentCommand{\ds}{}{\oplus}
\NewDocumentCommand{\bigds}{}{\bigoplus}

% topology
\NewDocumentCommand{\bnd}{m}{\bar{#1}}
\NewDocumentCommand{\cl}{m}{#1^{-}}
\NewDocumentCommand{\inte}{m}{#1^\circ}

% operators of functions
\NewDocumentCommand{\cps}{}{\circ}
\NewDocumentCommand{\restr}{}{\upharpoonright}
\NewDocumentCommand{\res}{m}{_{\upharpoonright #1}}

% power set
\NewDocumentCommand{\pow}{m}{\symcal{P}\p{#1}}

% complement
\NewDocumentCommand{\cpl}{}{\complement}

% completion
\NewDocumentCommand{\cpltn}{s m}{\IfBooleanTF{#1}{\widetilde{#2}}{\tilde{#2}}}

% row-equivalence with reduced row echelon form
\NewDocumentCommand{\rref}{}{\xrightarrow{\mathup{rref}}}

% Use \m to typeset math variables that take up multiple symbols.
\NewDocumentCommand{\m}{m}{\mathit{#1}}
\NewDocumentCommand{\M}{m}{\mathup{#1}}
\NewDocumentCommand{\q}{m}{\text{\texttt{#1}}}

% category
\NewDocumentCommand{\ca}{m}{\mathbf{#1}}
\NewDocumentCommand{\cav}{m}{\mathbfit{#1}}
\NewDocumentCommand{\caC}{}{\cav{C}}
\NewDocumentCommand{\cop}{}{^{\mathup{op}}}
\NewDocumentCommand{\obj}{}{_{0}}
\NewDocumentCommand{\mor}{}{_{1}}
\NewDocumentCommand{\cto}{}{^{\to}}

\NewDocumentCommand{\into}{}{\hookrightarrow}
\NewDocumentCommand{\onto}{}{\twoheadrightarrow}

% vector shorthand
% (w as a commonly used vector variable character)
\NewDocumentCommand{\w}{m}{{#1}}
\NewDocumentCommand{\wa}{}{\w{a}}
\NewDocumentCommand{\wb}{}{\w{b}}
\NewDocumentCommand{\wc}{}{\w{c}}
\NewDocumentCommand{\we}{}{\w{\epsilon}}
\NewDocumentCommand{\wg}{}{\w{\gamma}}
\NewDocumentCommand{\wrh}{}{\w{\rho}}
\NewDocumentCommand{\wi}{}{\w{i}}
\NewDocumentCommand{\wj}{}{\w{j}}
\NewDocumentCommand{\ws}{}{\w{s}}
\NewDocumentCommand{\wu}{}{\w{u}}
\NewDocumentCommand{\wv}{}{\w{v}}
\NewDocumentCommand{\wW}{}{\w{W}}
\NewDocumentCommand{\ww}{}{\w{w}}
\NewDocumentCommand{\wx}{}{\w{x}}
\NewDocumentCommand{\wy}{}{\w{y}}
\NewDocumentCommand{\wz}{}{\w{z}}
\NewDocumentCommand{\wo}{}{{0}}
\NewDocumentCommand{\wA}{}{\w{A}}
\NewDocumentCommand{\wB}{}{\w{B}}
\NewDocumentCommand{\wC}{}{\w{C}}
\NewDocumentCommand{\wD}{}{\w{D}}
\NewDocumentCommand{\wE}{}{\w{E}}
\NewDocumentCommand{\wI}{}{\w{I}}
\NewDocumentCommand{\wP}{}{\w{P}}
\NewDocumentCommand{\wR}{}{\w{R}}
\NewDocumentCommand{\wX}{}{\w{X}}
\NewDocumentCommand{\wY}{}{\w{Y}}
\NewDocumentCommand{\wZ}{}{\w{Z}}
\NewDocumentCommand{\Fmn}{}{F^{m\times{}n}}
\NewDocumentCommand{\Fmm}{}{F^{m\times{}m}}
\NewDocumentCommand{\Fmo}{}{F^{n\times{}1}}
\NewDocumentCommand{\Fnn}{}{F^{n\times{}n}}
\NewDocumentCommand{\Fno}{}{F^{n\times{}1}}
\NewDocumentCommand{\Fx}{}{F\s{X}}
\NewDocumentCommand{\Kmn}{}{K^{m\times{}n}}
\NewDocumentCommand{\Knn}{}{K^{n\times{}n}}
\NewDocumentCommand{\LV}{m}{\Lambda^{#1}\p{V}}
\NewDocumentCommand{\MV}{m}{M^{#1}\p{V}}
\NewDocumentCommand{\Rk}{}{\bbR^{k}}
\NewDocumentCommand{\Rx}{}{\bbR\s{X}}
\NewDocumentCommand{\bbRp}{}{\bbR^{p}}
\NewDocumentCommand{\Rmn}{}{\bbR^{m\times n}}
\NewDocumentCommand{\Rn}{}{\bbR^n}
\NewDocumentCommand{\Rnn}{}{\bbR^{n\times n}}


% kullback-leibler divergence
\NewDocumentCommand{\DKL}{}{D_{\M{KL}}}

% Iversonian
\NewDocumentCommand{\sfi}{}{\symsf{1}}

% random variables
\NewDocumentCommand{\R}{m}{\symup{#1}}
\NewDocumentCommand{\RW}{}{\R{W}}
\NewDocumentCommand{\RX}{}{\R{X}}
\NewDocumentCommand{\RY}{}{\R{Y}}
\NewDocumentCommand{\RZ}{}{\R{Z}}

\NewDocumentCommand{\Rw}{m}{\symbfup{#1}}
\NewDocumentCommand{\RwW}{}{\Rw{W}}
\NewDocumentCommand{\RwX}{}{\Rw{X}}
\NewDocumentCommand{\RwY}{}{\Rw{Y}}
\NewDocumentCommand{\RwZ}{}{\Rw{Z}}

% type theory
\NewDocumentCommand{\inh}{}{\colon} % inhabits
\NewDocumentCommand{\eqd}{}{:\equiv} % defined to be judgmentally equiv.
\NewDocumentCommand{\eqj}{}{\equiv} % judgmentally equiv.

% given
\NewDocumentCommand{\giv}{}{\, \middle| \,}
\NewDocumentCommand{\indep}{}{\perp}
\NewDocumentCommand{\sat}{}{\vDash}
\NewDocumentCommand{\nsat}{}{\nvDash}

% measured as in KL divergence
\NewDocumentCommand{\measuredas}{}{\parallel}

% divides |
\NewDocumentCommand{\di}{}{\mid}
\NewDocumentCommand{\ndi}{}{\nmid}

% coset
\NewDocumentCommand{\coset}{m O{}}{\s{#1}_{#2}}

% inverse
\NewDocumentCommand{\inv}{}{^{-1}}

\NewDocumentCommand{\dif}{}{\:\symrm{d}}
\NewDocumentCommand{\pD}{O{} m m}{\p{\D^{#1} #2}\p{#3}}
% antidifferential
\NewDocumentCommand{\adif}{}{\D\inv}

% transpose
\NewDocumentCommand{\T}{}{\intercal}

% exterior product
\NewDocumentCommand{\ep}{}{\wedge}

% inner product
\NewDocumentCommand{\ip}{m m}{\ad{{#1}\middle|{#2}}}

% Hadamard product
\NewDocumentCommand{\Hp}{}{\odot}

% tensor
\NewDocumentCommand{\te}{m}{\symbfsfup{#1}}
\NewDocumentCommand{\tei}{m}{\symsfit{#1}}

\NewDocumentCommand{\ten}{}{\otimes}
\NewDocumentCommand{\bigten}{}{\bigotimes}

% Complex conjugate
\NewDocumentCommand{\conj}{s m}{\IfBooleanTF{#1}{\overline{#2}}{\bar{#2}}}

\NewDocumentCommand{\n}{O{1} m}{\B{{#1} .. {#2}}}

% text-in-equations
\NewDocumentCommand{\tdata}{}{\text{data}}
\NewDocumentCommand{\tmodel}{}{\text{model}}
\NewDocumentCommand{\ttrain}{}{\text{train}}
\NewDocumentCommand{\ttest}{}{\text{test}}
\NewDocumentCommand{\tensemble}{}{\text{ensemble}}

\NewDocumentCommand{\NP}{}{\mathrm{NP}}

% text shorthand

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

% algorithm definitions
\SetKwProg{Fn}{function}{}{end}

\SetKwFunction{True}{true}
\SetKwFunction{False}{false}
\SetKwFunction{Nil}{nil}

\SetKwInput{KwParam}{Parameter}
\SetKwInOut{Require}{Require}
\SetKwInOut{Ensure}{Ensure}

\SetKw{Error}{error}
\SetKw{Print}{print}
