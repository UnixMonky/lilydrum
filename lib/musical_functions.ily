% =================================================	%
% 	Musical Functions								%
% =================================================	%
% Part of lilydrum

eighthBeaming = {
  \set baseMoment = #(ly:make-moment 1/8)
  \set beatStructure = #'( 2 2 2 2)
}
eighthReelBeaming = {
  \set baseMoment = #(ly:make-moment 1/8)
  \set beatStructure = #'( 4 4 4 4)
}
eighthCompoundBeaming = {
  \set baseMoment = #(ly:make-moment 1/8)
  \set beatStructure = #'( 3 3 3 3)
}

sixteenthBeaming = {
  \set baseMoment = #(ly:make-moment 1/16)
  \set beatStructure = #'( 4 4 4 4)
}
sixteenthReelBeaming = {
  \set baseMoment = #(ly:make-moment 1/16)
  \set beatStructure = #'( 8 8 8 8)
}
sixteenthCompoundBeaming = {
  \set baseMoment = #(ly:make-moment 1/16)
  \set beatStructure = #'( 6 6 6 6)
}
% triplet
triplet = #(define-music-function (parser location notes) (ly:music?) #{ \tuplet 3/2 { $notes } #})

% dynamics
v = #(define-event-function (parser location) () #{ \upbow #})

% dynamics with extended lines
dynLine = #(define-music-function
	(parser location text)
	(markup?)
	#{
		\once \override TextSpanner.style = #'line
		\once \override TextSpanner.bound-details.left.text = \markup {
			\combine
				\draw-line #'(0 . -1)
				\draw-line #'(1 . 0)
			\dynamic #text
		}
		\once \override TextSpanner.bound-details.right.text = \markup { \draw-line #'(0 . -1) }
	#})

% unison brackets
% TODO: a little 'u'
% TODO: open ended brackets(\odr,\ofr)
dr = #(define-event-function (parser location) () #{ \startGroup #})
fr = #(define-event-function (parser location) () #{ \stopGroup #})
odr = #(define-event-function (parser location) () #{ \startGroup #})
ofr = #(define-event-function (parser location) () #{ \stopGroup #})
tutti = #(define-music-function (mus) (ly:music?)
	; By Jan-Peter Voigt,  Tue, 2 May 2017 11:10:46 +0200
	(let* ((elms (ly:music-property mus 'elements))
		; first and last music-element ...
		(frst (first elms)) ; TODO test for list? and ly:music?
		(lst (last elms)) ; TODO test for list? and ly:music?
		(fartic (ly:music-property frst 'articulations '())) ; look
for eventchords ...
		(lartic (ly:music-property lst 'articulations '()))
		)
	(ly:music-set-property! frst 'articulations `(,@fartic ,(make-music 'NoteGroupingEvent 'span-direction -1)))
	(ly:music-set-property! lst 'articulations `(,@lartic ,(make-music 'NoteGroupingEvent 'span-direction 1)))
	#{
		#mus
	#}))