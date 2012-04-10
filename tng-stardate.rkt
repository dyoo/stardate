#lang racket/base

(require racket/date)

(provide date->stardate current-stardate)

;; http://trekguide.com/Stardates.htm
;; http://en.memory-alpha.org/wiki/Stardate

;; There are three ways to produce stardates, of which I'm choosing
;; TNG's approach.

;; According to trekguide.com, we get this constant:
(define days-per-year 365.2422)

;; According to trekguide.com, we get this constant:
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

;; Season 1 Episode 1, Encounter at Farpoint was on September 28, 1987:
;; http://en.memory-alpha.org/wiki/Encounter_at_Farpoint_(episode)
;; Stardate 41153.7


;; According to:
;;
;; http://trekguide.com/stardateToday.js
;;
;; the stardate 41000 starts at July 15, 1987 00:00:00
(define the-epoch-seconds (find-seconds 00 00 00
                                        15
                                        7  ;; July
                                        1987))

;; date-stardate-string: date -> string
(define (date->stardate a-date)
  (stardate-string (date->stardate-number a-date)))


;; date->stardate: date -> number
(define (date->stardate-number a-date)
  (define secs (date->seconds a-date))
  (define the-stardate (+ 41000 (* stardate-units-per-second (- secs the-epoch-seconds))))
  the-stardate)

;; stardate-string: number -> string
(define (stardate-string a-stardate)
  (number->string (exact->inexact (/ (floor (* a-stardate 10)) 10))))

(define (current-stardate)
  (date->stardate (current-date)))

