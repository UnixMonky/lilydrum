% This file compiles with at least version 2.19.80
\version "2.20.0"

% Include lilydrum before any music is defined
% it *will* complain otherwise about the d's and the g's
\include "lilydrum.ly"

\paper { 
%  annotate-spacing = ##t 
%  between-system-padding = #1.0
%  between-system-space = #0.1
  ragged-last-bottom = ##f
  ragged-bottom = ##f
}

\header{
    title = "Scotland the Brave"
	  subtitle = "Modified from PPBSO"

	  instrument = "Snare Drum"
	  meter = "2/4 March"
	  dedication = "Those who are about to .ly salute you."

	  composer = "SAPBD"
	  arranger = "Matt Huber"
	  today = "August 2nd, 2020"
}

% Start the score
\score {
	% We want a drumstaff regularly used for pipebands
	\new PipeBandDrumStaff {
		% Signal lilypond we will be using drumnotation
		\drummode {
			\time 2/4

			\rmark
			\bar ".|:" \partial 8 rr16. ll32
			\zz rr16.( rr32) ll16. \zz rr32( rr16.) ll32 \zz rr16.( rr32) ll16. \zz rr32( rr16.) ll32 \lf rr8 \zz rr8( 
			\tuplet 3/2 { ll16) rr ll } rr16.-> ll32 \tuplet 3/2 { rr16 ll rr } ll16.-> ll32 rr16. ll32-> rr32 ll rr ll rr8-> rr16. ll32 | \break
			\zz rr16.( rr32) ll16. \zz rr32( rr16.) ll32 \zz rr16.( rr32) ll16. \zz rr32( rr16.) ll32 \lf rr8 \zz rr8(
			\tuplet 3/2 { ll16) rr ll } rr16.-> ll32 rr16. \rf ll32 rr16. ll32 \lf rr8 \zz rr8( ll) \bar ":.|.:" \break

			\rmark
			rr16. ll32 | \set Score.currentBarNumber = #1
			\zz rr8(-> \zz ll8)(-> rr16.->) ll32 rr16. ll32 \zz rr8(-> \zz ll8)(-> rr8)-> \zz rr8(
			\tuplet 3/2 { ll16) rr ll } rr16.-> ll32 \tuplet 3/2 { rr16 ll rr } ll16.-> ll32 rr16. ll32-> rr32 ll rr ll rr8-> rr16. ll32 | \break
			\zz rr8(-> \zz ll8)(-> rr16.->) ll32 rr16. ll32 \zz rr8(-> \zz ll8)(-> rr8)-> \zz rr8(
			\tuplet 3/2 { ll16) rr ll } rr16.-> ll32 rr16. \rf ll32 rr16. ll32 \lf rr8 \zz rr8( ll) \bar ":.|.:" \break
				
			\rmark
			rr16. ll32 | \set Score.currentBarNumber = #1
			\lz rr8 ll16. rr32 \rz ll8 rr16. ll32 r16. ll32-> rr16. ll32 \lz rr8 \zz rr8( |
			\tuplet 3/2 { ll16) rr ll } rr16.-> ll32 \tuplet 3/2 { rr16 ll rr } ll16.-> ll32 rr16. ll32-> rr32 ll rr ll rr8-> rr16. ll32 | \break
			\lz rr8 ll16. rr32 \rz ll8 rr16. ll32 r16. ll32-> rr16. ll32 \lz rr8 \zz rr8( |
			\tuplet 3/2 { ll16) rr ll } rr16.-> ll32 rr16. \rf ll32 rr16. ll32 \lf rr8 \zz rr8( ll) \bar ":.|.:" \break

			\rmark
			\zz rr8( | \set Score.currentBarNumber = #1
			ll8.) ll16 \zz rr8( ll) rr \zz rr( ll) \zz rr(
			\tuplet 3/2 { ll16) rr ll } rr16.-> ll32 \tuplet 3/2 { rr16 ll rr } ll16.-> ll32 rr16. ll32-> rr32 ll rr ll rr8-> \zz rr8( | \break
			ll8.) ll16 \zz rr8( ll) rr \zz rr( ll) \zz rr(
			\tuplet 3/2 { ll16) rr ll } rr16.-> ll32 rr16. \rf ll32 rr16. ll32 \lf rr8 \zz rr8( ll) \bar ":|." \break
		}
	}
}
