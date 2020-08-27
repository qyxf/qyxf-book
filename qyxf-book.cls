% --------------------------
% qyxf-book 钱院学辅书籍模板
% 如不清楚含义，请勿随意更改
% --------------------------

\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\newcommand{\styversion}{3.0}
\newcommand{\styname}{qyxf-book}
\ProvidesClass{qyxf-book}
  [2020/08/19 v3.0 Qian Yuan Xue Fu book template]
\typeout{The book template provided by Qian Yuan Xue Fu}

% 设定 key-val 选项
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family = QYXF, prefix = QYXF@}

% 选项定制与处理
\DeclareStringOption[basic]{colorscheme}[basic]
\DeclareBoolOption[true]{xits}
\DeclareVoidOption{noCJKfont}{\PassOptionsToClass{fontset=none}{ctexbook}}

% 已废弃选项提示
\DeclareVoidOption{color}{\ClassWarning{\styname}{The option `color' is deprecated. Use `colorscheme' instead}}
\DeclareVoidOption{parskip}{\ClassWarning{\styname}{The option `parskip' is deprecated}}
\DeclareVoidOption{decoration}{\ClassWarning{\styname}{The option `decoration' is deprecated, due to the lack of `pgfornament' package in TeX Live 2020}}
\DeclareVoidOption{sourcefont}{\ClassWarning{\styname}{The option `sourcefont' is deprecated. Please customize your fonts by commands of `fontspec' and `xeCJK' package}}
\DeclareVoidOption{plain}{\ClassWarning{\styname}{The option `sourcefont' is deprecated}}
\DeclareVoidOption{opensource}{\ClassWarning{\styname}{The option `opensource' is deprecated}}

% 处理选项
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*

% 载入文类
\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{CJKmath = true}{xeCJK}
\LoadClass{ctexbook}

% 西文字体处理
\RequirePackage{amsmath}
\ifQYXF@xits
  \setmainfont{XITS}
  \setsansfont{TeX Gyre Heros}[Scale=0.93]
  \RequirePackage{unicode-math}
  \setmathfont{XITS Math}
\fi
\RequirePackage{hologo}

% etoolbox
\RequirePackage{etoolbox}

% 正文样式设置
\RequirePackage[normalem]{ulem}

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
\RequirePackage[many]{tcolorbox}

% caption 样式设定
\RequirePackage{caption}
\DeclareCaptionFormat{colored}{\small{\bfseries\color{\@caption@color}#1} #3}
\captionsetup{
  format = colored,
  skip = 1ex
}

% color scheme 默认值
% for titles amd text
\newcommand{\@title@color}{black}
\newcommand{\@list@color}{black}
\newcommand{\@caption@color}{black}
\newcommand{\@link@color}{black}
\newcommand{\@misc@color}{black}
% for boxes
\newcommand{\@box@background}{white}
\newcommand{\@box@frame}{black!75}
\newcommand{\@box@title@color}{white}
\newcommand{\@box@title@background}{black!50}
\newcommand{\@box@color}{black}
\newcommand{\@alert@background}{white}
\newcommand{\@alert@color}{black}
\newcommand{\@alert@frame}{black}
\newcommand{\@alert@title@background}{black}
\newcommand{\@alert@title@color}{white}
% for theorems
\newcommand{\@define@background}{white}
\newcommand{\@define@frame}{black!40}
\newcommand{\@define@color}{black}
\newcommand{\@theorem@background}{black!10}
\newcommand{\@theorem@frame}{black!80}
\newcommand{\@theorem@color}{black}

% 读取 color scheme
\ifdefstring{\QYXF@colorscheme}{basic}{\relax}{%
  \newcommand\schemepath{colors/\QYXF@colorscheme.tex} 
  \input{\schemepath}}

% tcolorbox 样式设定
\tcbset{
  enhanced,
  noparskip,
  after = \noindent,
  colback = \@box@background,
  title filled,
  colbacktitle = \@box@title@background,
  colframe = \@box@frame,
  coltitle = \@box@title@color,
  coltext = \@box@color,
  fonttitle = \bfseries,
  arc = 0.25em,
  boxrule = 0.5pt,
  toptitle = 0.75em,
  bottomtitle = 0.75em,
  boxsep = 0pt,
  left = 1.25em,
  right = 1.25em,
  top = 1.25em,
  bottom = 1.25em,
  drop fuzzy shadow,
  breakable
}

% 引导命令
\newcommand{\exercise}[1]{\noindent\textbf{\color{\@misc@color}练习 #1}\ }
\newcommand{\solve}{\noindent\textbf{\color{\@misc@color}\uline{解}}\ }
\newcommand{\analysis}{\noindent\textbf{\color{\@misc@color}\uline{分析}}\ }

% 定理环境及样式设定
\newtheorem{theorem}{定理}
\newtheorem{lemma}[theorem]{引理}
\newtheorem{define}{定义}
\BeforeBeginEnvironment{theorem}{\begin{tcolorbox}[colback=\@theorem@background,colframe=\@theorem@frame,coltext=\@theorem@color]}
\AfterEndEnvironment{theorem}{\end{tcolorbox}}
\BeforeBeginEnvironment{lemma}{\begin{tcolorbox}[colback=\@theorem@background,colframe=\@theorem@frame,coltext=\@theorem@color]}
\AfterEndEnvironment{lemma}{\end{tcolorbox}}
\BeforeBeginEnvironment{define}{\begin{tcolorbox}[colback=\@define@background,colframe=\@define@frame,coltext=\@define@color]}
\AfterEndEnvironment{define}{\end{tcolorbox}}
\newtcolorbox{note}{title={注记}}
\newtcolorbox{alert}{
  title = {警告},
  colback = \@alert@background,
  colframe = \@alert@frame,
  colbacktitle = \@alert@title@background,
  coltitle = \@alert@title@color,
  coltext = \@alert@color
}

% 页面设置
\RequirePackage{geometry}
\geometry{margin = 1in}
\setlength{\footskip}{30pt}
\setlength{\headheight}{15pt}

% 链接设置
\RequirePackage[unicode]{hyperref}
\hypersetup{
  breaklinks,
  unicode,
  linktoc = all,
  bookmarksnumbered = true,
  bookmarksopen = true,
  pdfborder = {0 0 0},
  linktocpage,
  pageanchor = true
}
\hypersetup{
  colorlinks = true,
  linkcolor = \@link@color,
  anchorcolor = \@misc@color,
  urlcolor = \@link@color,
  citecolor = \@misc@color
}

% 章节标题与目录样式
\RequirePackage{titlesec,titletoc}
\ctexset{section={name={\S,}}}
\titleformat{\chapter}[block]{\color{\@title@color}\centering\bfseries\fontsize{2.25em}{1.2ex}}{\CTEXthechapter}{1em}{}
\titleformat*{\section}{\color{\@title@color}\fontsize{1.75em}{1.225ex}\bfseries\centering}
\titleformat*{\subsection}{\color{\@title@color}\fontsize{1.5em}{1.43ex}\bfseries}
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
\newcommand{\footerbox}{%
  {\color{\@misc@color}\bfseries\thepage}\\[-\baselineskip]
  \uline{\hphantom{\@footorginfo}}\\
  \@footorginfo}
\RequirePackage{fancyhdr}
\fancyhead[EC]{\itshape\nouppercase\leftmark}
\fancyhead[OC]{\itshape\nouppercase\rightmark}
\fancyhead[EL,OR]{}
\fancyhead[ER,OL]{}
\fancyfoot[C]{\footerbox}
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[C]{\footerbox}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}}

% 列表样式设置
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{pifont}
\newcommand{\arrowmark}{\ding{228}}
\setlist{nosep, partopsep=0.5ex}
\setlist[itemize,1]{label={\color{\@list@color}\arrowmark}, left=0.8em}
\setlist[itemize,2]{label={\color{\@list@color}\ding{111}}, left=2.8em}
\setlist[itemize,3]{label={\color{\@list@color}\ding{109}}, left=4.8em}
\setlist[enumerate,1]{label={\color{\@list@color}\textbf{\arabic*}.}, left=0.8em}
\setlist[enumerate,2]{label={\color{\@list@color}{\arabic*}.}, left=2.8em}
\setlist[enumerate,3]{label={\color{\@list@color}({\arabic*})}, left=4.8em}
\setlist[description]{style=nextline, font=\color{\@list@color}\bfseries}

% 参考文献定制
\RequirePackage[square,numbers]{natbib}
\renewcommand{\citenumfont}[1]{{\color{\@link@color}#1}}
\renewcommand{\bibnumfmt}[1]{{\color{\@list@color}[#1]}}
\AtBeginEnvironment{thebibliography}{\addcontentsline{toc}{chapter}{\bibname}}

% 杂项
\RequirePackage{lastpage}
\RequirePackage{appendix}
\ctexset{appendix={number={\Roman{chapter}}}}

% 若干 metadata
\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\@typo}{}
\newcommand{\typo}[1]{\gdef\@typo{#1}}
\newcommand{\@cover}{}
\newcommand{\cover}[1]{\gdef\@cover{#1}}
\newcommand{\@orginfo}{%
  \textit{钱学森书院学业辅导中心}\\[1ex]
  \textsc{Xi'an Jiaotong University}}
\newcommand{\org}[1]{\gdef\@orginfo{#1}}
\newcommand{\@footorginfo}{\textsc{Qian Yuan Xue Fu}}
\newcommand{\footorg}[1]{\gdef\@footorginfo{#1}}
\newcommand{\@licenseinfo}{%
本作品采用%
\href{https://creativecommons.org/licenses/by-nc-nd/4.0/}%
{\bfseries CC BY-NC-ND 4.0 协议}进行许可。
使用者可以在给出作者署名及资料来源的前提下对本作品进行转载，%
但不得对本作品进行修改，亦不得基于本作品进行二次创作，%
不得将本作品运用于商业用途。}
\newcommand{\license}[1]{\gdef\@licenseinfo{#1}}

% 已废弃的 metadata
\newcommand{\version}[1]{\ClassWarning{\styname}{The metadata item `version' is deprecated}}
\newcommand{\sourcepage}[1]{\ClassWarning{\styname}{The metadata item `sourcepage' is deprecated}}

% 封面样式重定义
\newcommand{\titlefont}{\Huge\bfseries}
\newcommand{\subtitlefont}{\huge\itshape}
\newcommand{\authorfont}{\LARGE\itshape}
\newcommand{\datefont}{\Large}
\renewcommand*{\maketitle}{%
  \begin{titlepage}
  \null
  \begin{center}\large
  \begin{tcolorbox}[blanker,borderline west={1mm}{0pt}{\@box@frame},%
  left=20pt,top=1ex,bottom=1ex,after skip=0pt,no shadow]
  {\color{\@title@color}\titlefont\@title}
  \ifdefempty\@subtitle{}{\\[1ex]{\color{\@title@color}\subtitlefont\@subtitle}}
  \end{tcolorbox}
  \begin{tcolorbox}[blanker,borderline west={1mm}{0pt}{\@title@color},%
  left=20pt,top=2ex,bottom=1ex,before skip=0pt,after skip=0pt,no shadow]
  {\authorfont\@author}\\\datefont\@date
  \end{tcolorbox}
  \vfil\@cover\vfil
  \vbox{\@orginfo}
  \end{center}
  \vfilneg
  \end{titlepage}
  \thispagestyle{empty}
  \newpage
  \hypersetup{pageanchor=true}
  \null\vfill
  \begin{tcolorbox}[title={\bfseries 作品信息}]
  \arrowmark \textbf{标题：}\@title{}
  \ifdefempty\@subtitle{}{: \textit{\@subtitle}}\\
  \arrowmark \textbf{作者：}\@author\\
  \ifdefempty{\@typo}{}{\arrowmark \textbf{校对排版：}\@typo\\}
  \arrowmark \textbf{出品时间：}\@date\\
  \arrowmark \textbf{总页数：}\pageref{LastPage}
  \end{tcolorbox}
  \ifdefempty\@licenseinfo{}{%
    \begin{tcolorbox}[title={\bfseries 许可证说明}]
    \@licenseinfo
    \end{tcolorbox}}
  \newpage
  \pagestyle{fancy}}
\AtBeginDocument{%
  \hypersetup{
    pageanchor=false,
    pdfauthor=\@author,
    pdftitle=\@title,
    pdfsubject={\@author: \@title\ifdefempty{\@subtitle}{}{ - \textit{\@subtitle}}},
    pdfkeywords={qyxf, book},
    pdfcreator={XeLaTeX with \styname\ v\styversion\ \ifdefempty{\@typo}{}{(by \@typo)}}
  }}

% 目录样式重定义
\renewcommand\tableofcontents{%
\pagestyle{empty}
\begin{center}%
\normalfont\LARGE\bfseries\contentsname%
\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}
\end{center}
\vskip 3ex%
{\setlength\parskip{0pt}\@starttoc{toc}}
\cleardoublepage
\pagestyle{fancy}
\setcounter{page}{1}
}

\endinput
