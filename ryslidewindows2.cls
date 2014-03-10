% ryslidewindows2.cls <utf-8 encoding>
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ryslidewindows2}[2012/06/07 by Rainy <renyuuu@gmail.com>]
\LoadClass{article}
% 版式
\RequirePackage[paperheight=96mm,paperwidth=128mm,%
                hmargin={32mm,4mm},vmargin={5mm,2mm},%
                headheight=0pt,headsep=5mm,footskip=0pt]%
               {geometry}
% 色彩
\RequirePackage{xcolor}
\definecolor{mydarkgreen}{RGB}{118,77,57}
\definecolor{mygreen}{RGB}{34,8,7}
\definecolor{mylightgreen}{RGB}{229,187,129}
\definecolor{myorange}{RGB}{201,23,21}
\definecolor{mydarkorange}{RGB}{101,11,10}
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
% 标题和目录
\renewcommand\contentsname{提\ 要}
\RequirePackage{titlesec,titletoc}
\titleformat{\section}{\color{myorange}\Large\sf\heiti}%
                      {\hspace{-2em}\color{mylightgreen}\Huge\it\thesection}%
                      {0.5em}{}
\titlecontents{section}
              [0pt]
              {\addvspace{1ex}}%
              {\contentsmargin{0pt}%
               \makebox[1.5em][l]%
               {\color{mylightgreen}\huge\it\thecontentslabel\enspace}%
               \large\sf\songti}
              {\contentsmargin{0pt}}
              {}%{\quad/\,\sf\contentspage}
% 背景
\RequirePackage{totcount}
\regtotcounter{page}
\RequirePackage{tikz,ifthen,eso-pic}
\AddToShipoutPicture{%
    \begin{tikzpicture}[scale=0.2]
    \clip (-1,-1) rectangle +(64,48);
    \fill [mydarkgreen] (-1,-1) rectangle +(64,48);
    \fill [mygreen] (13,-1) rectangle +(64,48);
    \begin{scope}[every node/.style={execute at begin node=\hskip0pt}]
      \node at (0,4)
        [text width=82mm,rotate=90,below right,inner sep=1mm,%
         text=myorange!50!black,font=\LARGE\sf]
        {\mythetitle}; %% mythetitle
      \node at (4,1.3)
        [text width=16mm,above right,inner sep=1mm,%
         text=myorange!50!black,font=\small\sf]
        {\theauthor};
      \node at (4,0)
        [text width=16mm,above right,inner sep=0.5mm,%
         text=myorange!50!black,font=\tiny\sf]
        {\thedate};
    \end{scope}
    \path (0,0) coordinate (A) (4,0) coordinate (B)
          (4,4) coordinate (C) (0,4) coordinate (D);
    \foreach \i in {1,...,\totvalue{page}}{
        \ifthenelse{\i>\thepage}%
                   {\def\couleur{mylightgreen}}%
                   {\def\couleur{mydarkorange}}
        \draw[\couleur,thin] (A)--(B)--(C)--(D)--cycle;
        \path (A) coordinate (T);
        \path (A)--(B) coordinate[pos=0.9] (A)
                 --(C) coordinate[pos=0.9] (B)
                 --(D) coordinate[pos=0.9] (C)
                 --(T) coordinate[pos=0.9] (D);
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
\AtBeginDocument{\color{gray!30}\sf\songti\pagestyle{empty}}
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
    {\raggedright\color{mylightgreen}\Huge\it Thank You\\}
}
% EOF
