#lang racket/base

(require racket/date)

;; http://trekguide.com/Stardates.htm

;; There are three ways to produce stardates, of which I'm choosing
;; TNG's approach.


;; http://en.memory-alpha.org/wiki/Stardate


;; According to:
;;
;;     http://megiddo.wikidot.com/stardate
;;
;; we can compute the number of stardate units per day with this calculation.

;; http://www.enotes.com/science/q-and-a/what-exact-number-days-one-year-179507
(define days-per-year (/ 146097 400))

(define stardate-units-per-year 1000)

(define stardate-units-per-day (/ stardate-units-per-year
                                  days-per-year))
(define stardate-units-per-second
  (/ stardate-units-per-day
     (* 60 ;; 60 seconds per minutes
        60 ;; 60 minutes per hour
        24 ;; 24 hours per day
        )))


;; Season 1 was in the 41000's
;; Season 2 was in the 42000's
;; ...


;; Season 1 Episode 1, Encounter at Farpoint was on April 13, 1987:
;; http://en.memory-alpha.org/wiki/Encounter_at_Farpoint_(episode)
;; Stardate 41153.7

(define seconds-at-jan-1-1987 (find-seconds 0 0 0 1 1 1987 #f))
(define seconds-at-april-13-1987 (find-seconds 0 0 0 13 4 1987 #f))

(+ 41000 (* stardate-units-per-second (- seconds-at-april-13-1987
                                         seconds-at-jan-1-1987)))