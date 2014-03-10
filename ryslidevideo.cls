% ryslidevideo.cls <utf-8 encoding>
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ryslidevideo}[2012/07/25 by Rainy <renyuuu@gmail.com>]
\LoadClass{article}
% 版式
\RequirePackage[paperheight=96mm,paperwidth=128mm,%
                hmargin=38pt,vmargin=26pt,%
                headheight=13pt,headsep=13pt,footskip=22pt]%
               {geometry}
% 中文
\RequirePackage{ctex}
\setCJKfamilyfont{myyouyuan}{幼圆}
\newcommand{\myyouyuan}{\CJKfamily{myyouyuan}}
% 背景
\RequirePackage{tikz,eso-pic,makecell}
\usetikzlibrary{positioning}
\newcommand{\mypage}{%
\begin{tikzpicture}[remember picture,overlay]
    \pgfmathrandominteger{\a}{0}{255}
    \pgfmathrandominteger{\b}{0}{255}
    \pgfmathrandominteger{\c}{0}{255}
    \definecolor{myframecolor}{RGB}{\a,\b,\c}
    \shade [top color=myframecolor!50!black,bottom color=black]
           (0,0) rectangle +(128mm,96mm);
    \fill [white,rounded corners=5mm]
          (5mm,5mm) rectangle +(118mm,86mm);
\end{tikzpicture}
}
\AddToShipoutPicture{\mypage}
% 首页
\RequirePackage{titling}
%% 由于 titlesec 改写了 titling 定义的 \thetitle
%% 于是定义 \mythetitle 代替 \thetitle
\let\oldtitle\title
\renewcommand{\title}[1]{\oldtitle{#1}\newcommand{\mythetitle}{#1}}
%% <---------
% 页眉页脚
\RequirePackage{totcount}
\regtotcounter{page}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyheadoffset{35pt}
\fancyfootoffset{35pt}
\lhead{\color{gray!50}\small\sf\mythetitle}
\chead{}
\rhead{\color{gray!50}\small\sf\theauthor}
\lfoot{}
\rfoot{}
\cfoot{\begin{tikzpicture}
       \draw [gray!50,line cap=round,line width=3pt]
             (0,0) -- +(50mm,0mm);
       \draw [gray!50!black,line cap=round,line width=3pt]
             (0,0) -- +(\thepage/\totvalue{page}*50mm,0mm);
       \end{tikzpicture}%
      }
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
% 标题和目录
\renewcommand\contentsname{提\ 要}
\RequirePackage{titlesec,titletoc}
\titleformat{\section}{\huge\sf}%
                      {\fontsize{40pt}{\baselineskip}\it\thesection}%
                      {0.3em}{}
\titlecontents{section}
              [0pt]
              {\addvspace{1ex}}%
              {\contentsmargin{0pt}%
               \makebox[1.5em][l]%
               {\huge\it\thecontentslabel\hspace{0.3em}}%
               \Large\sf\myyouyuan}
              {\contentsmargin{0pt}}
              {}
% 超链接设置放在最后
\AtEndOfClass{
\RequirePackage[pdfpagemode=FullScreen,%
                colorlinks=true,menucolor=gray]%
               {hyperref}
}%
% 字体和颜色设置
\AtBeginDocument{\large\sf\myyouyuan}
% 定义首页和末页
\newcommand{\myfrontcover}{
  \begin{titlingpage}
  \setcounter{page}{-1}
  \begin{tikzpicture}[remember picture,overlay]
    \node (Title) at (current page.center)
    [yshift=10mm,inner sep=20pt,font=\huge\sf\myyouyuan]
    {\mythetitle};
    \node (Author) at (current page.center)
    [yshift=-15mm,inner sep=7pt,font=\large\sf\kaishu]
    {\makecell{\theauthor\\\thedate}};
    \node (start) at (current page.center)
    [circle,inner sep=2cm,opacity=0.6,scale=0.25,%
     top color=white,bottom color=black!25]
    {\begin{tikzpicture}[smooth cycle,fill=green!50!black]
      \fill plot[tension=0] coordinates{(-2.887,-5) (-2.887,5) (5.774,0)};
      %\fill [green] (0,0) -- (0,10) -- (8.66,5);
     \end{tikzpicture}
    };
  \end{tikzpicture}
  \end{titlingpage}
  \setcounter{page}{0}
}
\newcommand{\mybackcover}{
  \newpage\thispagestyle{empty}
  \addtocounter{page}{-1}
  \begin{tikzpicture}[remember picture,overlay]
    \node (Thanks) at (current page.center)
    [circle,inner sep=5mm,opacity=0.6,scale=0.25,%
     top color=white,bottom color=black!25]
    {\begin{tikzpicture}[red,line cap=round,line width=7mm]
      \draw (-2.5,4.33) arc(120:420:5);
      \draw (0,2) -- (0,6);
     \end{tikzpicture}
    };
  \end{tikzpicture}
}
