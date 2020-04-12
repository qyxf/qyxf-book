% --------------------------
% qyxf-book 钱院学辅书籍模板
% 如不清楚含义，请勿随意更改
% --------------------------

\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{qyxf-book}
  [2020/01/08 v2.2 Qian Yuan Xue Fu book template]
\typeout{The book template provided by Qian Yuan Xue Fu}
\LoadClass[10pt, twoside, openany]{book}

% 选项定制与处理
\newif\if@decoration
\newif\if@opensource
\newif\if@sourcefont
\DeclareOption{a4paper}{
  \setlength\paperheight{297mm}%
  \setlength\paperwidth{210mm}}
\DeclareOption{b5paper}{
  \setlength\paperheight{250mm}%
  \setlength\paperwidth{176mm}}
\DeclareOption{color}{}
\DeclareOption{parskip}{
  \setlength\parskip{0.2\baselineskip}}
\DeclareOption{decoration}{\@decorationtrue}
\DeclareOption{plain}{\@decorationfalse}
\DeclareOption{opensource}{\@opensourcetrue}
\DeclareOption{sourcefont}{\@sourcefonttrue}
\ProcessOptions

% 字体处理
\if@sourcefont  % 不再配置自定义字体，请自行配置
  \ClassWarning{qyxf-book}{The option `sourcefont' is deprecated.}
\fi
\RequirePackage[heading]{ctex}
\RequirePackage{fourier}
\RequirePackage{amsmath}

% etoolbox
\RequirePackage{etoolbox}
\BeforeBeginEnvironment{theorem}{\begin{tcolorbox}[boxrule=1pt,arc=0.5mm]}
\AfterEndEnvironment{theorem}{\end{tcolorbox}}

% 脚注样式调整
\renewcommand{\thefootnote}{\textbf{(\arabic{footnote})}}

% 浮动体（图表）处理
\RequirePackage{graphicx}
\graphicspath{{./figure/}{./pic/}{./image}}
\setlength{\textfloatsep}{6pt plus 2pt minus 4pt}
\setlength{\intextsep}{6pt plus 2pt minus 2pt}
\RequirePackage{longtable,booktabs}
\RequirePackage{tikz}
\usetikzlibrary{calc,backgrounds,shadows}
\RequirePackage{tcolorbox,tabu}
\tcbuselibrary{listings,theorems,skins}

% tcolorbox 样式设定
\tcbset{
  colback=white,
  colframe=black
}

% 自定义命令 / 环境
\newcommand{\exercise}[1]{\noindent\tcbox[on line,top=0mm,bottom=0mm,right=0mm,left=0mm]{\bfseries 练习#1}\ }
\newcommand{\note}{\noindent\textbf{注记}\ }
\newcommand{\solve}{\noindent\textbf{解}\ }
\newcommand{\analysis}{\noindent\textbf{分析}\ }
\newtheorem{theorem}{定理}

% 页面设置
\RequirePackage{geometry}
\geometry{margin=1in}
\setlength{\footskip}{30pt}

% 链接设置
\RequirePackage{hyperref}
\hypersetup{
  breaklinks,
  unicode,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdfborder={0 0 0},
  linktocpage,
  pageanchor=true}

% 装饰样式设置
\RequirePackage{pgfornament-han}
\RequirePackage{pgfornament}
\newcommand{\decoration}{
\vspace{-1ex}\centering
\begin{tikzpicture}
  \node at (0,0) {\pgfornamenthan[scale=0.2,symmetry=h]{60}};
  \node[fill opacity=0.2,draw opacity=0] at (0.02,-0.03)
  {\pgfornamenthan[scale=0.2,symmetry=h]{60}};
\end{tikzpicture}}

% 章节标题与目录样式
\RequirePackage{titlesec,titletoc}
\ctexset{section={name={\S,}}}
\titleformat{\chapter}[block]{
  \centering\bfseries\fontsize{2.5em}{1ex}
}{\CTEXthechapter}
{1em}{}[\if@decoration\decoration\fi]
\titlespacing{\chapter}{0pt}{*1}{*4}
\titlecontents{chapter}[24pt]{\hspace{-2pc}\filright}
              {\normalsize\bfseries\contentspush{\thecontentslabel\ }}
              {}{\bfseries\titlerule*[8pt]{.}\contentspage}
\titlecontents{section}[20pt]{\filright}
              {\contentspush{\thecontentslabel\ }}
              {}{\titlerule*[8pt]{.}\contentspage}
\titlecontents{subsection}[18pt]{\hspace{2pc}\filright}
              {\contentspush{\thecontentslabel\ }\itshape}
              {}{\titlerule*[8pt]{}\contentspage}
\setcounter{tocdepth}{2}

% 页眉页脚设置
\RequirePackage{fancyhdr}
\newcommand{\footdeco}{
\resizebox{10em}{5ex}{
  \begin{tikzpicture}
    \node at (0,0) {\pgfornamenthan[scale=0.05]{58}};
    \node[opacity=0.2, draw opacity=0] at (0.02,-0.03) {\pgfornamenthan[scale=0.05]{58}};
  \end{tikzpicture}}\\[-1ex]}
\fancyhead[EC]{\itshape\nouppercase\leftmark}
\fancyhead[OC]{\itshape\nouppercase\rightmark}
\fancyhead[EL,OR]{\bf\thepage}
\fancyhead[ER,OL]{}
\fancyfoot[C]{\if@decoration\footdeco\else\vspace{1ex}\fi\textsc{Qian Yuan Xue Fu}}
\fancypagestyle{plain}{%
\fancyhf{}
\fancyfoot[C]{\if@decoration\footdeco\else\vspace{1ex}\fi\textsc{Qian Yuan Xue Fu}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\setlength{\headheight}{13pt}

% 杂项
\RequirePackage{lastpage}
\RequirePackage{enumerate}
\RequirePackage{pifont}
\RequirePackage{appendix}
\ctexset{appendix={number={\Roman{chapter}}}}
\RequirePackage[scale=1.1]{ccicons}

% 若干 metadata
\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\@typo}{}
\newcommand{\typo}[1]{\gdef\@typo{#1}}
\newcommand{\@version}{}
\newcommand{\version}[1]{\gdef\@version{#1}}
\newcommand{\@sourcepage}{}
\newcommand{\sourcepage}[1]{\gdef\@sourcepage{#1}}

% 许可证信息
\newcommand{\license}{\ccbyncnd\ CC BY-NC-ND 4.0 协议}
\newcommand{\licenselink}{https://creativecommons.org/licenses/by-nc-nd/4.0/}
\newcommand{\licensecontent}{%
使用者可以在给出作者署名及资料来源的前提下对本作品进行转载，%
但不得对本作品进行修改，亦不得基于本作品进行二次创作，%
不得将本作品运用于商业用途。}

% 标题样式重定义
\renewcommand*{\maketitle}{%
\hypersetup{
  pageanchor=false,
  pdfauthor=\@author,
  pdftitle=\@title,
  pdfsubject={\@author: \@title\ifdefempty\@subtitle{}{ - \textit{\@subtitle}}},
  pdfkeywords={qyxf, book},
  pdfcreator={XeLaTeX with qyxf-book class}
}
\begin{titlepage}
\phantom{s}
\vspace{3cm}
\begin{center}\large
\begin{tcolorbox}[blanker,borderline west={1mm}{0pt}{black},%
left=20pt,top=1ex,bottom=1ex,after skip=0pt]
{\fontsize{40pt}{\baselineskip}\selectfont\bfseries\@title}
\ifdefempty\@subtitle{}{\\[1ex]{\Huge\itshape\@subtitle}}
\end{tcolorbox}
\begin{tcolorbox}[blanker,borderline west={1mm}{0pt}{black!50},%
left=20pt,top=2ex,bottom=1ex,before skip=0pt]
{\LARGE\itshape\@author}\\[1ex]\Large\@date
\end{tcolorbox}
\vfill
\texttt{钱学森书院学业辅导中心}\\[1ex]
\textsc{Qian Yuan Xue Fu}\\[1ex]
\textit{Xi'an Jiaotong University}
\end{center}
\begin{tikzpicture}[remember picture,overlay]
  \begin{pgfonlayer}{background}
  \node at ($(current page.east) +(0in,0in)$) {%
  \includegraphics[width=0.8\textwidth]{cover.pdf}};
  \end{pgfonlayer}
\end{tikzpicture}
\end{titlepage}
\thispagestyle{empty}
\newpage
\hypersetup{pageanchor=true}
\phantom{s}\vfill
\begin{tcolorbox}[title={\bfseries 作品信息}]
\ding{228} \textbf{标题：}\@title{}
\ifdefempty\@subtitle{}{- \textit{\@subtitle}}\\
\ding{228} \textbf{作者：}\@author\\
\ifdefempty{\@typo}{}{\ding{228} \textbf{校对排版：}\@typo\\}
\ding{228} \textbf{出品时间：}\@date\\
\ding{228} \textbf{总页数：}\pageref{LastPage}
\end{tcolorbox}
\begin{tcolorbox}[title={\bfseries 许可证说明}]
本作品采用\href{\licenselink}{\bfseries\license}%
进行许可。\licensecontent
\end{tcolorbox}
\if@opensource
  \begin{tcolorbox}
  本作品已发布于GitHub之上，发布地址为：\\
  \centerline{\@sourcepage}
  本作品的版本号为\textsf{\@version}。
  \end{tcolorbox}
\fi
\newpage
\pagestyle{fancy}
}

% 目录样式重定义
\renewcommand\tableofcontents{%
\pagestyle{empty}
\centerline{%
\normalfont\LARGE\bfseries\contentsname%
\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}
}
\vskip 3ex%
{\setlength\parskip{0pt}\@starttoc{toc}}
\cleardoublepage
\pagestyle{fancy}
\setcounter{page}{1}
}

\endinput
