\version "2.20.0"
\include "./lilydrum.ly"

#(ly:set-option 'point-and-click #f)

% Choose a size
#(set-global-staff-size 18)
#(set-default-paper-size "letter")

\paper {
  indent = 0\in
  ragged-bottom = ##t
  ragged-right = ##f
}
\layout {
  indent = 1\in
  \context {
    \Score
    \override NonMusicalPaperColumn #'line-break-permission = ##f
  }
}


\score {
	\new PipeBandDrumStaff \with {
		instrumentName = "Plain Notes"
	} {
		\time 2/4
		\drummode {
		  rr4 ll 
		  <<rr rr>> r
		  \crossstick rr \crossstick ll
		  \rimshot rr \rimshot ll
		  \backstick rr \backstick ll
		}
    }
    \addlyrics {
		"rr" "ll" 
		"<<rr ll>>" 
		"\crossstick rr" "\crossstick ll" 
		"\rimshot rr" "\rimshot ll" 
		"\backstick rr" "\backstick ll"
    }
}

\score {
	\new PipeBandDrumStaff \with {
		instrumentName = "Rolls"
	} {
		\time 4/4
		\eighthBeaming
		\drummode {
			rr8:32( ll:)( rr) r \zz rr8( \zz ll)( rr) r |
		}
	}
	\addlyrics {
			"rr8:32( ll:)( rr)" "\zz rr8( \zz ll)( rr)"
    }
}

\score {
	\new PipeBandDrumStaff \with {
		instrumentName = "Accents"
	  } {
		\time 2/4
		\drummode {
			rr4-> ll-> |
			rr-^ ll-^|
			rr\v ll\v | 
		}
	}
    \addlyrics {
		"rr4->" "ll->"
		"rr-^" "ll-^"
		"rr\v" "ll\v"
	}
}

\score {
	\new PipeBandDrumStaff \with {
		instrumentName = "Flams/Drags"
	  } {
		\time 2/4
		\drummode {
			\fl rr \fl ll |
			\dz rr \dz ll |
			\dr rr	\dr ll |
		}
	}
    \addlyrics {
		"\fl rr"	"\fl ll"
		"\dz rr"	"\dz ll"
		"\dr rr"	"\dr ll"
	}
}

\score {
	\new PipeBandDrumStaff \with {
		instrumentName = "Flourishing I"
	} {
	 	\time 2/4
		\drummode {
			rr^\splitTheFeather ll^\cartWheel
			rr^\up r4 
			rr8 ll rr4  
			\cart rr4 \stf ll4
			\flourish { rr4 ll rr ll }
		}
    }
    \addlyrics {
		"\splitTheFeather" "\cartWheel" 
		"\up" 
		"rr" "ll" "rr"
		"\cart" "\stf"
		"\flourish { rr4" "ll" "rr" "ll}"
    }
}

\score {
	\new PipeBandDrumStaff \with {
		instrumentName = "Flourishing II"
	} {
		\drummode {
			rr^\lthrow ll^\rthrow 
			rr^\bthrow r |

			rr^\lpush ll^\rpush
			rr^\bpush r |

			rr^\andrewStop ll^\quiggs
			rr^\stop r |

			rr^\bfly rr^\rbfly
			r r |
		}
    }
    \addlyrics {
		"\lthrow" "\rthrow" "\bthrow"  
		"\lpush" "\rpush" "\bpush"   
		"\andrewStop" "\quiggs" "\stop"   
		"\blfy" "\rblfy"
    }
}

\score {
	\new PipeBandDrumStaff \with {
		instrumentName = "Flourishing II"
	} {
		\drummode {
			rr^\lthrow ll^\rthrow 
			rr^\bthrow r |

			rr^\lpush ll^\rpush
			rr^\bpush r |

			rr^\andrewStop ll^\quiggs
			rr^\stop r |

			rr^\bfly rr^\rbfly
			r r |
		}
    }
    \addlyrics {
		"\lthrow" "\rthrow" "\bthrow"  
		"\lpush" "\rpush" "\bpush"   
		"\andrewStop" "\quiggs" "\stop"   
		"\blfy" "\rblfy"
    }
}

\score {
	\new PipeBandDrumStaff \with {
		instrumentName = "Marks"
	} {
		\drummode {
			\attack \zz rr2~ rr4 r |
			\rmark rr4 ll rr ll |
			\tmark "blah" rr ll rr ll 
			\mmark rr ll rr ll 
		}
    }
    \addlyrics {
		"\\attack"
		"\\rmark" "" "" "" 
		"\\tmark \"blah" "" "" ""
		"\\mmark" "" "" "" 
    }
}

% # Writing parts
% rolls
% tuplets
% tutti
% accents ( > v ^)
%

\header {
    title = "Pipe Band Snare Cheatsheet"
    subtitle = "Intended for Lilypond 2.20 or better"
}
