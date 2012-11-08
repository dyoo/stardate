#lang scribble/manual
@(require scribble/eval (for-label stardate))

@(define my-eval (make-base-eval))

@title{stardate: compute the current TNG stardate}
@author+email["Danny Yoo" "dyoo@hashcollision.org"]

@defmodule[stardate]

The package computes the current stardate based on the scheme used by
@link["http://en.wikipedia.org/wiki/Star_Trek:_The_Next_Generation"]{Star
Trek, The Next Generation}.

@interaction[#:eval my-eval
(require stardate)
(require racket/date)
(date->stardate (current-date))]

Note: this package has not yet been reviewed by the Starfleet Corps of
Engineers for its accuracy, and should not be be used for galactic
archival purposes.


@defproc[(date->stardate [a-date date]) string]{
Given a date, produces its stardate as a string.
}