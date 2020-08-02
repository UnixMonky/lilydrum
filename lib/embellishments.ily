% ================================================= %
%   Flams, Drags & the sort                         %
% ================================================= %

drumgrace = #(define-music-function (parser location notes ) ( ly:music? ) #{
	% Set settings
	\stemUp
	\once \override Beam.positions = #'(2 . 2)
	\once \override DrumStaff.Stem.length = #5
	\override Flag.stroke-style = #"grace"
	\override Score.GraceSpacing #'spacing-increment = #0
	\override Score.Stem #'beamlet-max-length-proportion = #'(0.5 . 0.5)

	% Print notes
	\small \times 1/4 { \grace $notes }

	% Revert back
	\revert Score.Stem #'beamlet-default-length
	\revert Flag.stroke-style
	\stemNeutral
#})

gracebuzz = {
  \once \override Stem #'stencil =
    #(lambda (grob)
       (let* ((x-parent (ly:grob-parent grob X))
              (is-rest? (ly:grob? (ly:grob-object x-parent 'rest))))
         (if is-rest?
             empty-stencil
             (ly:stencil-combine-at-edge
              (ly:stem::print grob)
              Y
              (- (ly:grob-property grob 'direction))
              (grob-interpret-markup grob
                                     (markup #:center-align #:fontsize 2
                                             #:musicglyph "z"))
              -1.8))))
}

% Flams
rf =   \drummode { \drumgrace { rr8 } }			% Flam right
lf =   \drummode { \drumgrace { ll8 } }			% Flam left
rfr = \drummode { \drumgrace { rr8\uni } }		% Flam right with start repeat
lfr = \drummode { \drumgrace { ll\uni } }		% Flam left  with start repeat

% % Optional Flams
% rfo =   \drummode { \drumgrace { \parenthesize rr8 } }			% Optional Flam right
% lfo =   \drummode { \drumgrace { \parenthesize ll8 } }			% Optional Flam left
% rfor = \drummode { \drumgrace { \parenthesize rr8\uni } }		% Optional Flam right with start repeat
% lfor = \drummode { \drumgrace { \parenthesize ll8\uni } }		% Optional Flam left  with start repeat

% Ruffs (Open diddle flam)
rd =   \drummode { \drumgrace { rr16[ rr] } }		% Drag right
ld =   \drummode { \drumgrace { ll16[ ll] } }		% Drag left
rdr = \drummode { \drumgrace { rr16[\uni rr] } } 	% Drag right with start repeat
ldr = \drummode { \drumgrace { ll16[\uni ll] } } 	% Drag left  with start repeat

% Drags (Buzzed Flams)
lz = \drummode { \gracebuzz \drumgrace { ll8 } }
rz = \drummode { \gracebuzz \drumgrace { rr8 } }
lzr = \drummode { \gracebuzz \drumgrace { ll8\uni } }
rzr = \drummode { \gracebuzz \drumgrace { rr8\uni} }


%%%
% Buzz Rolls
%%%
zz = {
  \once \override Stem #'stencil =
    #(lambda (grob)
       (let* ((x-parent (ly:grob-parent grob X))
              (is-rest? (ly:grob? (ly:grob-object x-parent 'rest))))
         (if is-rest?
             empty-stencil
             (ly:stencil-combine-at-edge
              (ly:stem::print grob)
              Y
              (- (ly:grob-property grob 'direction))
              (grob-interpret-markup grob
                                     (markup #:center-align #:fontsize 1
                                             #:musicglyph "z"))
              -2.3))))
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Embellishment functions, automatic left or right    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

get-first-note = #(define-music-function (music) (ly:music?)
	"Get the first note-event in @var{music}"
	(let ((note (car (extract-typed-music music 'note-event))))
	  note
	  )
)

#(define (autohandFunc left right)
	"Return a music function that prepends @var{left} if the first next note-event is of type 'left-hand,
else it will prepend @var{right}"
	(define-music-function (parser location music) (ly:music? )
		(let ((note (get-first-note music)))
			#{
				#(if (string=? (symbol->string (ly:music-property note 'drum-type)) "left-hand")
					#{ $left #}
					#{ $right #})

				% print the note, else it won't show up
				#music
			 #}
		 )
	)
)

% Flam
fl = #(autohandFunc rf lf)
flr = #(autohandFunc rfr lfr )

% Ruff
dr = #(autohandFunc rd ld )
drr = #(autohandFunc rdr ldr )

% Drag
dz = #(autohandFunc rz lz )
dzr = #(autohandFunc rzr lzr )
