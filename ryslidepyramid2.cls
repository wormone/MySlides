% ryslidepyramid2.cls <utf-8 encoding>
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ryslidepyramid2}[2013/11/28 by Rainy <renyuuu@gmail.com>]
\LoadClass{article}
% 版式
\RequirePackage[paperheight=96mm,paperwidth=128mm,%
                hmargin={24mm,24mm},vmargin={16mm,16mm},%
                headheight=13pt,headsep=11mm,footskip=11mm]%
               {geometry}
% 色彩
\RequirePackage{xcolor}
\definecolor{mydarkgreen}{RGB}{57,71,75} % 前景
\definecolor{mygreen}{RGB}{6,10,7} % 背景
\definecolor{mylightgreen}{RGB}{217,219,189} % 作者
\definecolor{myorange}{RGB}{128,170,201} % 标题
\definecolor{mydarkorange}{RGB}{175,213,220} % 前景留影
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
\fancyheadoffset{12mm}
\fancyfootoffset{12mm}
\lhead{\footnotesize\songti\color{black!50}\mythetitle}
\chead{}
\rhead{}
\lfoot{}
\cfoot{}
\rfoot{\footnotesize\sf\kaishu\color{black!50}\theauthor}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
% 标题和目录
\renewcommand\contentsname{提\ 要}
\RequirePackage{titlesec,titletoc}
\titleformat{\section}
  {}% 标签和标题的统一样式
  {}% 标签及其样式
  {-6ex}
  {\color{mylightgreen}\fontsize{60}{10}\usefont{OT1}{pzc}{m}{n}\selectfont%
   \thesection\filleft\\%
   \color{myorange}\Large\sf\heiti\filleft}
  % 标题样式，这里放 \thesection 是为了让“目录”显示为 0
\titlecontents{section}
              [0pt]
              {\addvspace{1ex}}%
              {\contentsmargin{0pt}%
               \makebox[1.5em][l]%
               {\color{mylightgreen}\Large\usefont{OT1}{pzc}{m}{n}\thecontentslabel}%
               \sf\songti}
              {\contentsmargin{0pt}}
              {}%{\quad/\,\sf\contentspage}
% 背景
\RequirePackage{totcount}
\regtotcounter{page}
\RequirePackage{tikz,ifthen,eso-pic}
\AddToShipoutPicture{%
    \begin{tikzpicture}[remember picture,overlay]
    \clip (0,0) rectangle (128mm,96mm);
    \fill [mygreen] (0,0) rectangle (128mm,96mm);
    \foreach \i in {1,2,...,\totvalue{page}} {%
      \pgfmathsetseed{\i}
      \ifthenelse{\i>\thepage}%
                 {\def\couleur{mydarkgreen}}%
                 {\def\couleur{mydarkorange}}
      \coordinate (SW) at (1.2+.6*rand,0.8+.4*rand);
      \coordinate (NW) at (1.2+.6*rand,8.8+.4*rand);
      \coordinate (SE) at (11.6+.6*rand,0.8+.4*rand);
      \coordinate (NE) at (11.6+.6*rand,8.8+.4*rand);
      \fill [opacity=.382,\couleur]
        (SW)--(NW)--(NE)--(SE)--cycle;
    }
    \foreach \i in {1,2,...,\totvalue{page}} {%
      \pgfmathsetseed{\i}
      \coordinate (SW) at (1.2+.6*rand,0.8+.4*rand);
      \coordinate (NW) at (1.2+.6*rand,8.8+.4*rand);
      \coordinate (SE) at (11.6+.6*rand,0.8+.4*rand);
      \coordinate (NE) at (11.6+.6*rand,8.8+.4*rand);
      \ifthenelse{\i=\thepage}%
                 {\fill [opacity=.618,mydarkgreen] (SW)--(NW)--(NE)--(SE)--cycle;}
                 {}
    }
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
    {\centering\color{mylightgreen}\normalsize The End\\}
    \vfill%
}
% EOF
