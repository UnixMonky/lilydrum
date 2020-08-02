\version "2.12.3"

% formatting/layout for individual parts

%{
Version History
---------------
2010.01.23 - added 'not-part-first-page' definition to remove header from /bookpart
           + removed version number from filename for ease of administration
           + added ossFooterMarkup section
2010.03.12 - rewrote booktitlemarkup to make it more consistent with standard music.
           + old version is kept, but commented out.
2010.04.23 - added date to header of non-first page
%}

% define scoped variables
portrait = \paper {
  #(set-paper-size "letter" 'portrait)
  raggedlastbottom = ##f
  raggedbottom = ##f
}

landscape = \paper {
  #(set-paper-size "letter" 'landscape)
  raggedlastbottom = ##f
  raggedbottom = ##f
}

shortPage = \paper { raggedlastbottom = ##t }
partLayout = \layout { indent = 0.0\in }
scoreLayout = \layout { indent = 0.5\in }
multiplePieces = \markup { \huge \bold \fromproperty #'header:piece }

%% end variable definition

% Bring in the time/date package. Set format to month day, year
% #(use-modules (srfi srfi-19))
% today = #(date->string (current-date) "~B ~d, ~Y")
today = #(strftime "~B ~d, ~Y" (localtime (current-time)))% define not part fist page, to remove headers from first page of bookparts

#(define (not-part-first-page layout props arg)
(if (= (chain-assoc-get 'page:page-number props -1)
(ly:output-def-lookup layout 'first-page-number))
empty-stencil
(interpret-markup layout props arg)))


\layout { indent = 0.0\in }

\paper {

  #(set-paper-size "letter" )
  page-top-space = 0\mm
  after-title-space = 0.5\in
  %  before-title-space = 0.5\in
  top-margin = 0.5\in
  bottom-margin = 0.5\in
  left-margin = 0.5\in
  line-width =7.5\in  %% right margin = page-width - (left-margin + line-width)
  raggedlastbottom = ##f
  raggedbottom = ##t

  oddHeaderMarkup = \markup {
	\fill-line {
	  \on-the-fly #not-part-first-page \fromproperty #'header:instrument
	  \on-the-fly #not-part-first-page \line { "Page " \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string }
	  \on-the-fly #not-part-first-page \fromproperty #'header:title 
	}
  }
  evenHeaderMarkup = \markup {
	\fill-line {
	  \on-the-fly #not-part-first-page \fromproperty #'header:instrument
	  \on-the-fly #not-part-first-page \line { "Page " \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string }
	  \on-the-fly #not-part-first-page \fromproperty #'header:title 
	}
  }

  % onle chage is to 'part-[first|last]-page' to enable tagline on last page of bookpart
  oddFooterMarkup = \markup {
	\column {
	  \fill-line {
		%% Copyright header field only on first page.
		\on-the-fly #part-first-page \fromproperty #'header:copyright
	  }
	  \fill-line {
		%% Tagline header field only on last page.
		\on-the-fly #part-last-page \fromproperty #'header:tagline
	  }
	}
  }

  bookTitleMarkup = \markup {
	\column {
	  \override #'(baseline-skip . 2)
	  \fill-line {\abs-fontsize #24 \bold \fromproperty #'header:title }
	  \fill-line {
		\column {
		  \abs-fontsize #12 \fromproperty #'header:instrument
		  \abs-fontsize #8 \fromproperty #'header:meter
		  \abs-fontsize #8 \italic \fromproperty #'header:dedication
		}
		\center-column {
		  \abs-fontsize #10 \italic \fromproperty #'header:subtitle
		}
		\right-column {
		  \abs-fontsize #10 \fromproperty #'header:composer
		  \abs-fontsize #8 \fromproperty #'header:arranger
		  \abs-fontsize #8 \fromproperty #'header:today
		}
	  }
	}
  }

  %{ old version 
  bookTitleMarkup = \markup {
	\column {
	  \override #'(baseline-skip . 3)
	  \column {
		\huge \larger \bold
		\fill-line {
		  \larger \fromproperty #'header:title
		}
		\fill-line {
		  \large \smaller \bold
		  \larger \fromproperty #'header:subtitle
		}
		\fill-line {
		  \column {
			\fromproperty #'header:meter
			\fromproperty #'header:instrument
			\smaller \italic \fromproperty #'header:dedication
		  }
		  \column {
			\fromproperty #'header:composer
			\smaller \italic \fromproperty #'header:arranger
			\smaller \fromproperty #'header:today
		  }
		}
	  }
	}
  }
  %}
}
