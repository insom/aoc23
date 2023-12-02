#lang racket

(struct numberish (value name numeral))
(define numbers (map numberish
                     '(0 1 2 3 4 5 6 7 8 9)
                     '("zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine")
                     '("0" "1" "2" "3" "4" "5" "6" "7" "8" "9")
                     ))

(define (strstr needlish haystack)
  (cond
    [(string-prefix? haystack (numberish-name needlish)) (numberish-value needlish)]
    [(string-prefix? haystack (numberish-numeral needlish)) (numberish-value needlish)]
    [else #f]
    ))

(define (numbers-in-string haystack)
  (filter-map (lambda (x) (strstr x haystack)) numbers))

(define (raw-numbers-in-line line)
  (cons
   (numbers-in-string line)
   (cond
     [(> (string-length line) 0) (numbers-in-line (substring line 1))]
     [else #f]
     ))
  )

(define (numbers-in-line line)
  (filter (lambda (x) (not (false? x)))
          (flatten (raw-numbers-in-line line))
          ))

(define (line-value x)
  (+ (* 10 (first x)) (last x)))

(call-with-input-file "input1"
  (lambda (in)
    (let
        ([bits (string-split (port->string in) "\n" #:trim? #t)])
      (foldl + 0
             (map line-value (map numbers-in-line bits))))))
