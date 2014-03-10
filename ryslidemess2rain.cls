% ryslidemess2rain.cls <utf-8 encoding>
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ryslidemess2rain}[2013/11/05 by Rainy <renyuuu@gmail.com>]
\LoadClass{article}
% 版式
\RequirePackage[paperheight=96mm,paperwidth=128mm,%
                hmargin={32mm,4mm},vmargin={20pt,20pt},%
                headheight=13pt,headsep=7pt,footskip=7pt]%
               {geometry}
% 色彩
\RequirePackage{xcolor}
\definecolor{mydarkgreen}{RGB}{39,72,98}
\definecolor{mygreen}{RGB}{23,44,60}
\definecolor{mylightgreen}{RGB}{230,179,61}
\definecolor{myorange}{RGB}{217,104,49}
\definecolor{mydarkorange}{RGB}{153,80,84}
% 中文
\RequirePackage{ctex}
% 首页
\RequirePackage{titling}
\pretitle{\begin{center}\LARGE\sf\color{myorange}}
\posttitle{\par\end{center}\vspace{10mm}}
\preauthor{\begin{center}\large\sf\kaishu\color{mylightgreen}}
\postauthor{\par\end{center}\vspace{-2mm}}
\predate{\begin{center}\small\sf\songti\color{gray!30}}
\postdate{\par\end{center}}
%% 由于 titlesec 改写了 titling 定义的 \thetitle
%% 于是定义 \mythetitle 代替 \thetitle
\let\oldtitle\title
\renewcommand{\title}[1]{\oldtitle{#1}\newcommand{\mythetitle}{#1}}
%% <---------
% 页眉页脚
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyheadoffset{2mm}
\fancyfootoffset{2mm}
\lhead{\small\songti\color{black!50}\mythetitle}
\chead{}
\rhead{}
\lfoot{}
\cfoot{}
\rfoot{\small\sf\kaishu\color{black!50}\theauthor}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
% 标题和目录
\renewcommand\contentsname{提\ 要}
\RequirePackage{titlesec,titletoc}
\titleformat{\section}
  {}% 标签和标题的统一样式
  {}% 标签及其样式
  {-6ex}
  {\color{black!50}\fontsize{60}{10}\usefont{OT1}{pzc}{m}{n}\selectfont%
   \thesection\filleft\\%
   \color{myorange}\Large\sf\heiti\filleft}
  % 标题样式，这里放 \thesection 是为了让“目录”显示为 0
\titlecontents{section}
              [0pt]
              {\addvspace{1ex}}%
              {\contentsmargin{0pt}%
               \makebox[1.5em][l]%
               {\color{gray}\Large\usefont{OT1}{pzc}{m}{n}\thecontentslabel}%
               \sf\songti}
              {\contentsmargin{0pt}}
              {}%{\quad/\,\sf\contentspage}
% 背景
\RequirePackage{totcount}
\regtotcounter{page}
\RequirePackage{tikz,ifthen,eso-pic}
\AddToShipoutPicture{%
    \begin{tikzpicture}[scale=0.2]
    \clip (0,0) rectangle +(64,48);
    \fill [mydarkgreen] (0,0) rectangle +(64,48);
    \foreach \i in {1,2,...,\totvalue{page}} {%
      \pgfmathsetseed{\i}
      \pgfmathrandominteger{\x}{0}{120}
      \pgfmathrandominteger{\y}{0}{470}
      \pgfmathrandominteger{\r}{5}{10}
      \ifthenelse{\i>\thepage}%
                 {\def\couleur{gray}\def\thk{1pt}}%
                 {\def\couleur{mydarkorange}\def\thk{2pt}}
      \ifthenelse{\i=\totvalue{page}}%
                 {\def\mysym{。}}%
                 {\def\mysym{，}}
      \node at (0.1*\x,0.1*\y)
        [text=\couleur,scale=\r,font=\heiti\normalsize,opacity=0.5]
        {\mysym};
    }
    \fill [mygreen] (14,0) rectangle +(64,48);
    \end{tikzpicture}
}
% 超链接设置放在最后
\AtEndOfClass{
\RequirePackage[pdfpagemode=FullScreen,%
                colorlinks=true,linkcolor=gray!30]%
               {hyperref}
}%
% 正文字体和颜色设置
\AtBeginDocument{\color{gray!30}\small\songti}
% 定义首页
\newcommand{\myfrontcover}{%
    \begin{titlingpage}
      \setcounter{page}{0}%
      \maketitle
    \end{titlingpage}
    \setcounter{page}{1}
}
% 定义末页
\newcommand{\mybackcover}{%
    \newpage\thispagestyle{empty}\vspace*{\fill}
    \renewcommand{\thefootnote}{\color{mylightgreen}$\infty$}
    {\centering\color{mylightgreen}\normalsize$\Sigma\,3Q$%
     \footnote{\color{mylightgreen}%
     《中华人民共和国感谢法》2011 年第 1 条第 1 款。}\\}
    \vfill%
}
% EOF
