% =================================================	%
% 	Rehearsal Marks									%
% =================================================	%

% From Svenax's bagpipemusic
markText = #(define-music-function (parser location text) (string?) #{
    \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
    \mark \markup $text
#})

markTextEol = #(define-music-function (parser location text) (string?) #{
    \once \override Score.RehearsalMark #'break-visibility = #end-of-line-visible
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \mark \markup $text
#})

markTextEolDown = #(define-music-function (parser location text) (string?) #{
    \once \override Score.RehearsalMark #'break-visibility = #end-of-line-visible
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \once \override Score.RehearsalMark #'direction = #DOWN
    \mark \markup $text
#})
altBracket = #(define-music-function (parser location tag) (string?) #{
		\set Score.repeatCommands = #(list (list 'volta (markup #:text tag)))
	#}
)


% Short al fine's and stuff
dcalfine = {\markTextEol "D.C. al Fine" }
dacapoalfine = {\markTextEol "Da Capo al Fine" }
fine = {\markTextEol "Fine" }

rmark = {
  \set Score.markFormatter = #format-mark-box-numbers
  \mark \default
  \set Score.currentBarNumber = #1  %% Reset current bar number
}

mmark = {     % bar number rehearsal mark
  \set Score.markFormatter = #format-mark-box-barnumbers
  \mark \default
}

tmark =
#(define-music-function
     (parser location text)
     (string?)
   #{
  \set Score.markFormatter = #format-mark-box-numbers
  \mark \markup{ \box #text }
%   \set Score.currentBarNumber = #1  %% Reset current bar number
   #})

ole = ^\markup { \italic \concat {"Ol" \char #233 "!"} }

attack = {
   \mark \markup{ \box Attack }
%  \set Score.currentBarNumber = #1  %% Reset current bar number
}

intro = {
   \mark \markup{ \box Intro }
%  \set Score.currentBarNumber = #1  %% Reset current bar number
}

drumbreak = {
   \mark \markup{ \box "Drum Break" }
%  \set Score.currentBarNumber = #1  %% Reset current bar number
}

