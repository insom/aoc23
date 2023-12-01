#lang racket

(define (numbers-in-line x)
  (map (lambda (x)
         (- (char->integer x) (char->integer #\0)))
       (filter char-numeric? (string->list x))))

(define (line-value x)
  (+ (* 10 (first x)) (last x)))

(call-with-input-file "input1"
  (lambda (in)
    (let
        ([bits (string-split (port->string in) "\n" #:trim? #t)])
      (foldl + 0
             (map line-value (map numbers-in-line bits))))))
