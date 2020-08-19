% --------------------------
% qyxf-book 钱院学辅书籍模板
% 如不清楚含义，请勿随意更改
% --------------------------

\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{qyxf-book}
  [2020/01/08 v2.2 Qian Yuan Xue Fu book template]
\typeout{The book template provided by Qian Yuan Xue Fu}
\LoadClass{ctexbook}


% 已废弃选项提示
\DeclareOption{color}{\ClassWarning{\styname}{The option `color' is deprecated. Use `colorscheme' instead}}
\DeclareOption{parskip}{\ClassWarning{\styname}{The option `parskip' is deprecated}}
\DeclareOption{decoration}{\ClassWarning{\styname}{The option `decoration' is deprecated, due to the lack of `pgfornament' package in TeX Live 2020}}
\DeclareOption{sourcefont}{\ClassWarning{\styname}{The option `sourcefont' is deprecated. Please customize your fonts by commands of `fontspec' and `xeCJK' package}}
\DeclareOption{plain}{\ClassWarning{\styname}{The option `sourcefont' is deprecated}}
\DeclareOption{opensource}{\ClassWarning{\styname}{The option `opensource' is deprecated}}

% 选项定制与处理
\DeclareStringOption[basic]{colorscheme}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions

% 字体处理
\setmainfont{Libertinus Serif}
\setsansfont{Libertinus Sans}
\setmonofont{FandolFang-Regular}
\RequirePackage{newtxmath}
\RequirePackage{amsmath}

% etoolbox
\RequirePackage{etoolbox}

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
\tcbuselibrary{listings,theorems,skins,breakable}

% tcolorbox 样式设定
\tcbset{
  colback=white,
  colframe=black,
  breakable
}

% 自定义命令
\newcommand{\exercise}[1]{\noindent\tcbox[on line,top=0mm,bottom=0mm,right=0mm,left=0mm]{\bfseries 练习#1}\ }
\newcommand{\note}{\noindent\textbf{注记}\ }
\newcommand{\solve}{\noindent\textbf{解}\ }
\newcommand{\analysis}{\noindent\textbf{分析}\ }

% 自定义定理环境及样式设定
\newtheorem{theorem}{定理}
\newtheorem{lemma}[theorem]{引理}
\newtheorem{define}{定义}
\BeforeBeginEnvironment{theorem}{\begin{tcolorbox}[boxrule=1pt,arc=0.5mm]}
\AfterEndEnvironment{theorem}{\end{tcolorbox}}
\BeforeBeginEnvironment{lemma}{\begin{tcolorbox}[boxrule=1pt,arc=0.5mm,colframe=black!40]}
\AfterEndEnvironment{lemma}{\end{tcolorbox}}
\BeforeBeginEnvironment{define}{\begin{tcolorbox}[boxrule=1pt,arc=3mm,outer arc=0.5mm]}
\AfterEndEnvironment{define}{\end{tcolorbox}}

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
\fancyhead[EC]{\itshape\nouppercase\leftmark}
\fancyhead[OC]{\itshape\nouppercase\rightmark}
\fancyhead[EL,OR]{\bf\thepage}
\fancyhead[ER,OL]{}
\fancyfoot[C]{\footerbox}
\fancypagestyle{plain}{%
\fancyhf{}
\fancyfoot[C]{\footerbox}
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
\newcommand{\@cover}{}
\newcommand{\cover}[1]{\gdef\@cover{#1}}
\newcommand{\@orginfo}{
  \textit{钱学森书院学业辅导中心}\\[1ex]
  \textsc{Xi'an Jiaotong University}
}
\newcommand{\org}[1]{\gdef\@orginfo{#1}}

% 许可证信息
\newcommand{\@licenseinfo}{%
本作品采用 \href{https://creativecommons.org/licenses/by-nc-nd/4.0/}%
{\bfseries CC BY-NC-ND 4.0 协议}进行许可。
使用者可以在给出作者署名及资料来源的前提下对本作品进行转载，%
但不得对本作品进行修改，亦不得基于本作品进行二次创作，%
不得将本作品运用于商业用途。}
\newcommand{\license}[1]{\gdef\@licenseinfo{#1}}

% 已废弃的 metadata
\newcommand{\version}[1]{\ClassWarning{\styname}{The metadata item `version' is deprecated}}
\newcommand{\sourcepage}[1]{\ClassWarning{\styname}{The metadata item `sourcepage' is deprecated}}

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
{\LARGE\itshape\@author}\\\Large\@date
\end{tcolorbox}
\vfil\@cover\vfil
\@orginfo
\end{center}
\end{titlepage}
\thispagestyle{empty}
\newpage
\hypersetup{pageanchor=true}
\null\vfill
\begin{tcolorbox}[title={\bfseries 作品信息}]
\ding{228} \textbf{标题：}\@title{}
\ifdefempty\@subtitle{}{: \textit{\@subtitle}}\\
\ding{228} \textbf{作者：}\@author\\
\ifdefempty{\@typo}{}{\ding{228} \textbf{校对排版：}\@typo\\}
\ding{228} \textbf{出品时间：}\@date\\
\ding{228} \textbf{总页数：}\pageref{LastPage}
\end{tcolorbox}
\ifdefempty\@licenseinfo{}{
  \begin{tcolorbox}[title={\bfseries 许可证说明}]
  \@licenseinfo
  \end{tcolorbox}
}
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
