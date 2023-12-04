#lang racket
(require racket/set)

(define (process-game line)
  (let*
      ([bits (string-split line ":")]
       [number-bits (string-split (last bits) "|")]
       [card-bits (regexp-split #rx" +" (first bits))]
       [winning-numbers (regexp-split #rx" +" (string-trim (first number-bits)))]
       [our-numbers (regexp-split #rx" +" (string-trim (last number-bits)))])
   

          (define win-count (set-count (set-intersect
           (list->set our-numbers)
           (list->set winning-numbers))))
          (case win-count
            [(0 1) win-count]
            [else (expt 2 (- win-count 1))])))

(call-with-input-file "input4"
  (lambda (in)
    (let
        ([bits (string-split (port->string in) "\n" #:trim? #t)])
      (apply + (map process-game bits)))))
