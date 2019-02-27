%!----------------------------------------------------!%
% Kelas untuk Proposal dan Skripsi di lingkungan   
% Fakultas Ilmu Komputer Universitas Singaperbangsa Karawang
% dibuat oleh: Junaedi Fahmi, 2015. github.com/juunnn
%
%
%!----------------------------------------------------!%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{skripsifasilkom}

\RequirePackage[bahasa]{babel}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\RequirePackage{graphicx,latexsym}
\usepackage{verbatim}
\usepackage{booktabs}
\usepackage[table]{xcolor}
\usepackage{multirow}
\usepackage{float}
\usepackage{indentfirst}
\usepackage{amsmath}
\usepackage{mathstyle}
\usepackage{pdfpages}
\usepackage{threeparttable}


\newif\if@proposal
\newif\if@skripsi
\DeclareOption{skripsi}{\@skripsitrue\@proposalfalse}
\DeclareOption{proposal}{\@skripsifalse\@proposaltrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
%\ExecuteOptions{skripsifasilkom,skripsi}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{report}

%--------------------------------------------------------------
% Heading 

\setcounter{secnumdepth}{3}
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\@arabic\c@chapter.\@arabic\c@section}
\renewcommand\thesubsection {\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection.\@arabic\c@subsubsection.}

\renewcommand\appendix{\par
	\setcounter{chapter}{0}%
	\setcounter{section}{0}%
	\gdef\@chapapp{\appendixname}%
	\gdef\thechapter{\@Alph\c@chapter}}

\def\ps@chapterheading{%
	\let\@evenhead\@empty\let\@oddhead\@empty
	\def\@oddfoot{\hfil\thepage\hfil}%
	\def\@evenfoot{\hfil\thepage\hfil}
}

\renewcommand{\chapter}{\clearpage\thispagestyle{chapterheading}%
	\global\@topnum\z@ %Prevents figures from going at top of page
	\@afterindenttrue %Indent the 1st paragraph
	\secdef\@chapter\@schapter}

\renewcommand{\@makechapterhead}[1]{%
	{\parindent \z@ \centering \normalfont
		\ifnum \c@secnumdepth >\m@ne
		\bfseries \uppercase{\@chapapp\space} \thechapter
		\par\nobreak
		%\vskip 5\p@
		\fi
		\interlinepenalty\@M
		\bfseries #1\par\nobreak
		\vskip 20\p@
}}

\renewcommand{\@makeschapterhead}[1]{%
	{\parindent \z@ \centering \normalfont
		\interlinepenalty\@M \bfseries #1\par\nobreak \vskip 20\p@ }}
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
	{-3.5ex \@plus -1ex \@minus -.2ex}%
	{2.3ex \@plus.2ex}%
	{\normalfont\normalsize\bfseries}}

\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\normalsize\bfseries\itshape}}

\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\parindent}%
	{3.25ex \@plus1ex \@minus.2ex}%
	{0em}%
	{\normalfont\normalsize\bfseries\itshape}}

% Spacing
\usepackage{titlesec}
\titlespacing\section{0pt}{14pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
\titlespacing\subsection{0em}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
\titlespacing\subsubsection{0em}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}

% End Heading 
%--------------------------------------------------------------

%--------------------------------------------------------------
% Layout

% Margin
\usepackage[top=3cm, left=4cm, bottom=3cm, right=3cm]{geometry}

% No hypen
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000

% End Layout
%--------------------------------------------------------------

%--------------------------------------------------------------
% TOC

\usepackage[titles]{tocloft}
\setlength\cftparskip{0pt}
\renewcommand{\cftchappresnum}{BAB\ }
\setlength{\cftchapnumwidth}{3.9em}
\setlength\cftbeforechapskip{0pt}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\renewcommand\cftfigpresnum{\bfseries Gambar\  }
\renewcommand\cfttabpresnum{\bfseries Tabel\   }

\newcommand{\listofdataextractsname}{\appendixname}

\newlistof{dataextracts}{dat}{\listofdataextractsname}



\newenvironment{lampiran}[1]{%
	\par%
	\addvspace{\baselineskip}%
	\refstepcounter{dataextracts}%
	\newpage
	\thispagestyle{empty}
	\clearpage
	\vspace*{\fill}
	{
		
		\centering \normalfont {\textbf{\uppercase{Lampiran \thedataextracts \\ #1}}}\par
		\vfill
		\newpage
	}%
	\addcontentsline{dat}{dataextracts}{\textbf{Lampiran \protect\numberline{\thedataextracts}} #1}%
	\addvspace{0.5\baselineskip}%
	% \\%
}{%
	\par%
	\addvspace{0.5\baselineskip}%
}%

% Link on TOC
\usepackage{hyperref}
\newlength{\mylenf}
\settowidth{\mylenf}{\cftfigpresnum}
\setlength{\cftfignumwidth}{\dimexpr\mylenf+2em}
\setlength{\cfttabnumwidth}{\dimexpr\mylenf+2em}

% End TOC
%--------------------------------------------------------------

%--------------------------------------------------------------
% Caption

\usepackage[font=singlespacing,labelfont=bf]{caption}
\captionsetup{font=normalsize,skip=0pt,aboveskip=0pt}

% Cap for Gambar
\newcommand{\figsource}[1]{
	\captionsetup{font=footnotesize,textfont={it},justification=centering,skip=0pt,belowskip=0pt}
	\caption*{(Sumber: #1)}
	\vspace{-1.5em}
}

% Cap for Tabel
\newcommand{\tblsource}[1]{
	\captionsetup{font=footnotesize,textfont={it},justification=raggedright,skip=0pt,belowskip=0pt}
	\caption*{(Sumber: #1)}
	\vspace{-1.5em}
}

\newcommand*{\thead}[1]{\multicolumn{1}{|c|}{\bfseries #1}}
\newenvironment{tabel}[1][h]{\vspace*{-2em} \begin{table}[#1]\footnotesize\centering\singlespacing}{\end{table} \vspace*{-1.3em}}
% End Caption
%--------------------------------------------------------------

%--------------------------------------------------------------
% Bibliography

\RequirePackage[natbibapa]{apacite}
\bibliographystyle{apacite}
\setlength{\bibsep}{11pt plus 0.3ex}

% End Bibliography
%--------------------------------------------------------------

%--------------------------------------------------------------
% Enumerate

\usepackage[shortlabels]{enumitem}
\setlist[enumerate]{topsep=0pt,itemsep=2pt,partopsep=-1ex,parsep=0ex}

% End Enumerate
%--------------------------------------------------------------

%--------------------------------------------------------------
% New Environtment

% Untuk tabel penelitian terkait, harus landscape

% new table




\usepackage{pdflscape,rotate}
\usepackage{longtable}
\def\penelitianterkait{%
	\clearpage
	\footnotesize
	\begin{landscape}
	\begin{singlespace}
	
}
		
\def\endpenelitianterkait{
	\end{singlespace}
	\end{landscape}
}


\markright{}
\def\katapengantar{%
	\if@proposal{
		\pagestyle{plain}
		\pagenumbering{roman}
		\setcounter{page}{0}
	} \fi
	
	\chapter*{\prefacename}%
	\addcontentsline{toc}{chapter}{\prefacename}
\begin{singlespace}
}

\def\endkatapengantar{
\end{singlespace}
}

\def\abstrak{%
	\if@skripsi{
		\pagestyle{plain}
		\pagenumbering{roman}
		\setcounter{page}{1}
	} \fi

	\chapter*{ABSTRAK}%
	\addcontentsline{toc}{chapter}{ABSTRAK}
	\footnotesize
	\begin{center}
		{\normalfont \bfseries \MakeUppercase{\@judul} }\\
		\vspace{-1.5em}
		$$\textbf{\@nama}^1 \textbf{,\space \@pembimbingsatu}^2 \textbf{,\space\@pembimbingdua}^3$$\\ \vspace{-4em}
		$$ {^1}{\text{\@email,\space}}{}$$\\ \vspace{-4em}
		$${^2}{\text{\@emailpembimbingsatu,\space}}{} {^3}{\text{\@emailpembimbingdua}}{} $$ \\ \vspace{-4em}
		$${^{1,2,3}}{\text{Fakultas \@faculty, \space \@university}} $$
	\end{center}
	
	\begin{singlespace}
		\noindent
		\textbf{Abstrak:}
	}
	
\def\endabstrak{
	\vspace{6pt}
	\noindent
	\textbf{Kata Kunci:} \@katakunci
	\end{singlespace}
}

\newcommand{\katakunci}[1]{\gdef\@katakunci{#1}}
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}

\def\abstract{%
\chapter*{ABSTRACT}%
\addcontentsline{toc}{chapter}{\textit{ABSTRACT}}
\footnotesize
\begin{center}
	{\normalfont \bfseries \itshape \MakeUppercase{\@juduleng} }\\
	\vspace{-1.5em}
	$$\textbf{\@nama}^1 \textbf{,\space \@pembimbingsatu}^2 \textbf{,\space\@pembimbingdua}^3$$\\ \vspace{-4em}
	$$ {^1}{\text{\@email,\space}}{}$$\\ \vspace{-4em}
	$${^2}{\text{\@emailpembimbingsatu,\space}}{} {^3}{\text{\@emailpembimbingdua}}{} $$ \\ \vspace{-4em}
	$${^{1,2,3}}{\text{Faculty of Computer Scicene, Singaperbangsa Karawang University}} $$
\end{center}

\begin{singlespace}
	\noindent
	\itshape
	\textbf{Abstract:}
	}
	
	\def\endabstract{
	\vspace{6pt}
	\noindent
	\textbf{Keywords:} \@keywords
\end{singlespace}
}

\def\persembahan{%	
	\newpage
	\thispagestyle{empty}
	\clearpage
	\vspace*{\fill}
\begin{center}
	\bfseries
	\itshape
	Skripsi ini saya persembahkan kepada\\
}

\def\endpersembahan{
\end{center}
	\vfill % equivalent to \vspace{\fill}
	\clearpage}

\def\motto{
	\newpage
	\thispagestyle{empty}
	\clearpage
	\vspace*{\fill}
\begin{center}
		\bfseries
		\itshape
		MOTTO\\
}

\def\endmotto{
\end{center}
\vfill % equivalent to \vspace{\fill}
\clearpage
}
% End Environtment
%--------------------------------------------------------------


%------------------------------------------------------------
% Define Variable

\def\captionsbahasa{%
	\def\prefacename{KATA PENGANTAR}%
	\def\contentsname{DAFTAR ISI}%
	\def\listfigurename{DAFTAR GAMBAR}%
	\def\listtablename{DAFTAR TABEL}%
	\def\listappendixname{DAFTAR LAMPIRAN}%
	\def\nomenclaturename{DAFTAR SINGKATAN}%
	\def\abstractname{Abstrak}%
	\def\acknowledgmentname{HALAMAN PERSEMBAHAN}%
	\def\approvalname{LEMBAR PENGESAHAN}
	\def\partname{BAGIAN}%
	\def\chaptername{BAB}%
	\def\appendixname{DAFTAR LAMPIRAN}%
	\def\refname{DAFTAR PUSTAKA}%
	\def\bibname{DAFTAR PUSTAKA}%
	\def\indexname{Indek}%
	\def\figurename{Gambar}%
	\def\tablename{Tabel}%
	\def\pagename{Halaman}%
}

%English
\def\captionsenglish{%
	\def\prefacename{PREFACE}%
	\def\contentsname{CONTENTS}%
	\def\listfigurename{LIST OF FIGURES}%
	\def\listtablename{LIST OF TABLES}%
	\def\listappendixname{LIST OF APPENDICES}%
	\def\nomenclaturename{NOMENCLATURE}%
	\def\abstractname{\emph{Abstract}}%
	\def\partname{PART}%
	\def\chaptername{CHAPTER}%
	\def\appendixname{APPENDIX}%
	\def\refname{REFERENCES}%
	\def\bibname{REFERENCES}%
	\def\indexname{Index}%
	\def\figurename{Figure}%
	\def\tablename{Table}%
	\def\pagename{Page}%
}


\gdef\@university{Universitas Singaperbangsa Karawang}
\gdef\@faculty{Ilmu Komputer}
\gdef\@city{Karawang}
\gdef\@prodi{Teknik Informatika}
\newcommand{\judulindo}[1]{\gdef\@judul{#1}}
\newcommand{\juduleng}[1]{\gdef\@juduleng{#1}}
\newcommand{\namalengkap}[3]{\gdef\@nama{#1} \gdef\@npm{#2} \gdef\@email{#3}}
\newcommand{\tanggalseminar}[1]{\gdef\@tanggalseminar{#1}}
\newcommand{\tanggalsidang}[1]{\gdef\@tanggalsidang{#1}}
\newcommand{\tahun}[1]{\gdef\@tahun{#1}}

\newcommand{\koprodi}[2]{\gdef\@koprodi{#1} \gdef\@nidnkoprodi{#2}}
\newcommand{\dekan}[2]{\gdef\@dekan{#1} \gdef\@nidndekan{#2}}

\newcommand{\pembimbingsatu}[3]{\gdef\@pembimbingsatu{#1} \gdef\@nidnpembimbingsatu{#2} \gdef\@emailpembimbingsatu{#3}}
\newcommand{\pembimbingdua}[3]{\gdef\@pembimbingdua{#1} \gdef\@nidnpembimbingdua{#2} \gdef\@emailpembimbingdua{#3}}

\newcommand{\pengujisatu}[2]{\gdef\@pengujisatu{#1} \gdef\@nidnpengujisatu{#2}}
\newcommand{\pengujidua}[2]{\gdef\@pengujidua{#1} \gdef\@nidnpengujidua{#2}}

% End Variable
%------------------------------------------------------------

%------------------------------------------------------------
% Lembar tambahan


\def\cover{%
	\thispagestyle{empty}%
	\begin{center}
		\begin{singlespace}
			\fontsize{14pt}{16pt}\selectfont\MakeUppercase{\Large\bfseries\@judul}\par\nobreak
			\vspace{1.5cm}
			\MakeUppercase{\normalfont\bfseries
				\if@proposal Proposal Skripsi
				\else\if@skripsi Skripsi
				\else Skripsi
				\fi
				\fi
			}\\
			
			{\small \singlespacing Diajukan Sebagai Salah Satu Syarat untuk Memperoleh Gelar Sarjana Komputer dari Fakultas Ilmu Komputer Universitas Singaperbangsa Karawang}
			\vspace{1.0cm}
			\vfill
			\includegraphics[width=4cm]{Gambar/logousk.png}
			\vfill
			{\normalfont
				\bfseries oleh:\\
				\MakeUppercase{\normalfont\bfseries \@nama}\\
				\MakeUppercase{\normalfont\bfseries \@npm}}\\
			\vspace{1.5cm}
			{\normalfont 
				\MakeUppercase{\normalfont\bfseries Program Studi \@prodi}\\
				\MakeUppercase{\normalfont\bfseries Fakultas \@faculty}\\ \MakeUppercase{\normalfont\bfseries\@university}\\
				\MakeUppercase{\normalfont\bfseries\@city}\\
				{\normalfont\bfseries \@tahun}}\\
		\end{singlespace}
	\end{center}
}

\def\lembarpengesahanproposal{
	\newpage
	\thispagestyle{empty}
	\begin{center}
		\bfseries	\uppercase{Lembar Pengesahan}
	\end{center}
	\begin{center}
		\begin{singlespace}
			\MakeUppercase{\Large\bfseries\@judul}\par\nobreak
			\vspace{1.0cm}
			\MakeUppercase{\normalfont\bfseries\expandafter{ Proposal Skripsi}}\\
			
			Diajukan sebagai salah satu syarat untuk memperoleh gelar Sarjana Komputer dari Fakultas \@faculty \@university
			\vspace{1.0cm}
			
			
			\vspace{1.0cm}
			oleh:\\
			\textbf{\@nama}\\
			\textbf{\@npm}\\
			\vspace{1.0cm}
			disetujui oleh: \\
			\vspace{6pt}
			\begin{tabular}{ccc}
				\bfseries Pembimbing & &\bfseries Penguji \\
				\vspace{2cm} &  & \\
				\textbf{\underline{\@pembimbingsatu}}& &
				\textbf{\underline{\@pengujisatu}} \\
				\bfseries NIDN. \@nidnpembimbingsatu & & \bfseries NIDN. \@nidnpengujisatu    
			\end{tabular}
			
			\vspace{1.0cm}
			\begin{tabular}{c}
				\@city, \@tanggalseminar \space \@tahun\\
				diketahui dan disahkan\\oleh:\\
				\bfseries{Koordinator Program Studi} \\
				\vspace{2cm}\\
				\textbf{\underline{\@koprodi}} \\
				\bfseries NIDN. \@nidnkoprodi
			\end{tabular}
		\end{singlespace}
	\end{center}
}

\def\lembarpengesahanpembimbing{
	\newpage
	\thispagestyle{empty}
	\begin{center}
		\bfseries\MakeUppercase{Lembar Pengesahan}
	\end{center}
	\begin{center}
		\begin{singlespace}
			\MakeUppercase{\Large\bfseries\@judul}\par\nobreak
			\vspace{1.0cm}
			\MakeUppercase{\normalfont\bfseries\expandafter{Skripsi}}\\
			Telah dipertahankan di hadapan Dewan Penguji dan dinyatakan memenuhi syarat untuk memperoleh gelar Sarjana Komputer dari Fakultas \@faculty \@university
			\vspace{1.0cm}
			
			
			\vspace{1.0cm}
			oleh:\\
			\textbf{\@nama}\\
			\textbf{\@npm}\\
			\vspace{1.0cm}
			disetujui oleh: \\
			\vspace{6pt}
			\begin{tabular}{ccc}
				\bfseries Pembimbing I& &\bfseries Pembimbing II \\
				\vspace{2cm} &  & \\
				\textbf{\underline{\@pembimbingsatu}}& &
				\textbf{\underline{\@pembimbingdua}} \\
				\bfseries NIDN. \@nidnpembimbingsatu & & \bfseries NIDN. \@nidnpembimbingdua    
			\end{tabular}
			
			\vspace{1.0cm}
			\begin{tabular}{c}
				\@city, \@tanggalsidang \space \@tahun\\
				diketahui dan disahkan\\oleh:\\
				\bfseries{Dekan Fakultas \@faculty} \\
				\vspace{2cm}\\
				\textbf{\underline{\@dekan}} \\
				\bfseries NIDN. \@nidndekan
			\end{tabular}
		\end{singlespace}
	\end{center}
}

\def\lembarpengesahanpenguji{
	\newpage
	\thispagestyle{empty}
	\begin{center}
		\bfseries	\uppercase{Lembar Pengesahan Penguji}
	\end{center}
	\begin{center}
		\begin{singlespace}
			\MakeUppercase{\Large\bfseries\@judul}\par\nobreak
			\vspace{1.0cm}
			\MakeUppercase{\normalfont\bfseries\expandafter{Skripsi}}\\
			Telah dipertahankan di hadapan Dewan Penguji dan dinyatakan memenuhi syarat untuk memperoleh gelar Sarjana Komputer dari Fakultas \@faculty \@university
			\vspace{1.0cm}
			
			
			\vspace{1.0cm}
			oleh:\\
			\textbf{\@nama}\\
			\textbf{\@npm}\\
			\vspace{1.0cm}
			disetujui oleh: \\
			\vspace{6pt}
			\begin{tabular}{ccc}
				\bfseries Penguji I & &\bfseries Penguji II \\
				\vspace{2cm} &  & \\
				\textbf{\underline{\@pengujisatu}}& &
				\textbf{\underline{\@pengujidua}} \\
				\bfseries NIDN. \@nidnpengujisatu & & \bfseries NIDN. \@nidnpengujidua    
			\end{tabular}
			
			\vspace{1.0cm}
			\begin{tabular}{c}
				\@city, \@tanggalsidang \space \@tahun\\
				diketahui dan disahkan\\oleh:\\
				\bfseries{Dekan Fakultas \@faculty} \\
				\vspace{2cm}\\
				\textbf{\underline{\@dekan}} \\
				\bfseries NIDN. \@nidndekan
			\end{tabular}
		\end{singlespace}
	\end{center}
}

\def\orisinalitas{
	\newpage
	\thispagestyle{empty}
	\begin{center}
		\MakeUppercase{\bfseries pernyataan orisinalitas}
	\end{center}
	\noindent
	Saya yang bertanda tangan di bawah ini:\\
	\begin{tabular}{lc p{10cm}}
		Nama & : & \@nama\\
		NPM & : & \@npm\\
		Judul Skripsi &:& \@judul
	\end{tabular}
	\\
	\noindent
	Menyatakan dengan sebenarnya bahwa penulisan skripsi ini adalah hasil pekerjaan saya dan seluruh ide, pendapat, atau materi dari sumber lain telah dikutip dengan cara penulisan referensi yang sesuai.\\
	Pernyataan ini saya buat dengan sebenar-benarnya dan jika pernyataan ini tidak sesuai dengan kenyataan, maka saya bersedia menanggung sanksi yang akan dikenakan kepada saya, termasuk pencabutan gelar Sarja Komputer yang nanti saya dapatkan.\\
	
	\begin{flushright}
		\begin{tabular}{c}
			\@city, \space \@tanggalsidang \space \@tahun\\
			\vspace{1cm}\\
			\textbf{\@nama}
		\end{tabular}
	\end{flushright}
	
}

\def\publikasi{
	\newpage
	\thispagestyle{empty}
	\begin{center}
		\bfseries \uppercase{Pernyataan Persetujuan Publikasi karya ilmiah untuk kepentingan akademis}
	\end{center}
	\noindent
	Sebagai sivitas akademik \@university, saya yang bertanda tangan di bawah ini:\\
	\begin{tabular}{lcl}
		Nama&:&\@nama\\
		NPM&:&\@npm\\
		Program Studi&:&\@prodi\\
		Fakultas&:&\@faculty\\
		Jenis Karya&:&Skripsi\\
	\end{tabular}
	
	\vspace{6pt}
	demi pengembangan ilmu pengetahuan, menyetujui untuk memberikan kapada \@university \textbf{Hak Bebas Royalti Nonekslusif (Nonexclusive Royalty-Free Right)} atas karya ilmiah saya yang berjudul:
	\vspace{6pt}
	\begin{center}
		\bfseries "\@judul"
	\end{center}
	\vspace{6pt}
	beserta perangkat yang ada (jika diperlukan). Dengan Hak Bebas Royalti Nonekslusif ini, \@university berhak menyimpan, mengalihmedia/formatkan, mengelola dalam bentuk pangkalan data (\textit{database}), merawat dan mempublikasikan tugas akhir saya tanpa meminta izin dari saya selama tetap mencantumkan nama saya sebagai penulis/pencipta dan sebagai pemilik Hak Cipta.\\
	Demikian pernyataan ini saya buat dengan sebenarnya.\\
	
	\begin{center}
		\begin{tabular}{rcl}
			Dibuat di &:& \@city\\
			Pada tanggal&:&\@tanggalsidang \space \@tahun\\
			\vspace{2cm}& &\\
			\multicolumn{3}{c}{(\@nama)}
		\end{tabular}
	\end{center}
	
}

\def\pendahuluan{
	\begin{onehalfspace}
		\tableofcontents
		\addcontentsline{toc}{chapter}{DAFTAR ISI}
		\let\origaddvspace\addvspace
		\renewcommand{\addvspace}[1]{}
		\listoffigures
		\addcontentsline{toc}{chapter}{DAFTAR GAMBAR}
		\listoftables
		\addcontentsline{toc}{chapter}{DAFTAR TABEL}
		
		\if@skripsi{
			\listofdataextracts
			\addcontentsline{toc}{chapter}{DAFTAR LAMPIRAN}
		} \fi
	
	\end{onehalfspace}
	\pagestyle{myheadings}\selectlanguage{bahasa}\clearpage\pagenumbering{arabic}\setcounter{page}{1}
}

%Tabularization
\newcommand{\itab}[1]{\hspace{0em}\rlap{#1}}
\newcommand{\tab}[1]{\hspace{.2\textwidth}\rlap{#1}}

% End Lembar Tambahan
%------------------------------------------------------------




\AtBeginDocument{%
	\selectlanguage{bahasa}
	\onehalfspacing
	\cover
	\if@proposal{
		\lembarpengesahanproposal
	}
	\fi
	
	\if@skripsi{
		\lembarpengesahanpembimbing
		\lembarpengesahanpenguji
		\orisinalitas
		\publikasi
	}
	\fi
}

\endinput