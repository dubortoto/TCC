\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fatectcc}

\LoadClass[12pt,a4paper]{report}

% -------------- Dependencias --------------
\RequirePackage{tgheros}            % Fonte semelhante à Arial
\RequirePackage{tocloft}            % Personalização do sumário
\RequirePackage{titlesec}           % Personalização de títulos
\RequirePackage{setspace}           % Configurações de espaçamento
\RequirePackage{indentfirst}        % Indenta o primeiro parágrafo de cada seção
\RequirePackage{geometry}           % Configurações de margens
\RequirePackage[T1]{fontenc}        % Configurações de codificação de fonte
\RequirePackage[utf8]{inputenc}     % Configurações de codificação de caracteres
\RequirePackage[brazilian]{babel}   % Configurações de idioma
\RequirePackage{microtype}          % Melhora a tipografia
\RequirePackage{fancyhdr}           % Configurações de cabeçalhos e rodapés
\RequirePackage[table]{xcolor}      % Configurações de cores para tabelas
\RequirePackage{graphicx}           % Configurações para diminuir o tamanho das tabelas
\RequirePackage{float}              % Configurações para posicionamento de tabelas
\RequirePackage{csquotes}           % Configurações para citações
\RequirePackage[backend=biber,style=abnt]{biblatex} % Configurações de citações ABNT

\RequirePackage{hyperref}           % Configurações de hyperlinks - Deve ser carregado por último para evitar conflitos

% -------------- Definições de variáveis --------------
\newcommand{\@autor}{}
\newcommand{\@titulo}{}
\newcommand{\@instituicao}{}
\newcommand{\@cidade}{}
\newcommand{\@ano}{}
\newcommand{\@preambulo}{}

\newcommand{\autor}[1]{\renewcommand{\@autor}{#1}}
\newcommand{\titulo}[1]{\renewcommand{\@titulo}{#1}}
\newcommand{\instituicao}[1]{\renewcommand{\@instituicao}{#1}}
\newcommand{\cidade}[1]{\renewcommand{\@cidade}{#1}}
\newcommand{\ano}[1]{\renewcommand{\@ano}{#1}}
\newcommand{\preambulo}[1]{\renewcommand{\@preambulo}{#1}}

% Comandos em português para bibliografia
\newcommand{\adicbibliografia}[1]{\addbibresource{#1}}
\newcommand{\bibliografia}{\printbibliography}

% Fonte principal
\renewcommand{\familydefault}{\sfdefault}

% Margens ABNT
\geometry{
    a4paper,
    top=3cm,
    left=3cm,
    right=2cm,
    bottom=2cm
}

% Configurações de hyperlinks
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    urlcolor=blue,
    citecolor=black
}

% Configuração de cabeçalhos e rodapés
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}  % Remove a linha do cabeçalho

\fancypagestyle{plain}{
    \fancyhf{}                      % Limpa os campos de cabeçalho e rodapé 
    \fancyfoot[R]{\thepage}         % Número da página no rodapé direito
}

% Configurações de cores para tabelas
\newcommand{\ok}[1]{\cellcolor{green!25}#1}
\newcommand{\err}[1]{\cellcolor{red!25}#1}

% -------------- Páginas --------------
% -------------- Capa -------------- 
\newcommand{\capa}{
    \begin{titlepage}
        \centering

        \@instituicao

        \vspace{2cm}

        \@autor

        \vspace{4cm}

        \begin{minipage}
            {0.8\textwidth}
            \centering
            \bfseries\@titulo
        \end{minipage}

        \vfill

        \@cidade

        \@ano

    \end{titlepage}
}

% -------------- Folha de rosto --------------
\newcommand{\folhaderosto}{
    \begin{titlepage}
        \centering

        \MakeUppercase{\@instituicao}

        \vspace{2cm}

        \MakeUppercase{\@autor}

        \vspace{4cm}

        \begin{minipage}
            {0.8\textwidth}
            \centering
            \bfseries\@titulo
        \end{minipage}

        \vspace{2cm}

        \hfill
        \begin{minipage}
            {0.5\textwidth}
            \@preambulo
        \end{minipage}

        \vfill

        \@cidade

        \@ano

    \end{titlepage}
}

% -------------- Sumário --------------
\newcommand{\sumario}{
    \tableofcontents
    \thispagestyle{empty}
}
\renewcommand{\cfttoctitlefont}{\hfill\large\bfseries\MakeUppercase}
\renewcommand{\cftaftertoctitle}{\hfill\mbox{}}

% -------------- Capítulos -------------- 
\titleformat{\chapter}
{\large\normalfont\bfseries}
{\thechapter}
{1em}
{}
\titlespacing*{\chapter}
{0pt}{0pt}{8pt}

\titleformat{\section}
{\large\normalfont\bfseries}
{\thesection}
{1em}
{}
\titlespacing*{\section}
{0pt}{0pt}{0pt}

\titleformat{\subsection}
{\normalfont\itshape}
{\thesubsection}
{1em}
{}
\titlespacing*{\subsection}
{0pt}{0pt}{0pt}

\setlength{\parindent}{1.25cm}
\onehalfspacing
\setlength{\parskip}{12pt}

\newcommand{\capitulo}[1]{
    \input{#1}
}
