#lang racket

(define (process-game line)
  (let*
      ([bits (string-split line ":")]
       [hands (string-split (last bits) ";")]
       [targets (make-hash '((red . 0) (green . 0) (blue . 0)))])
    (map
     (lambda (hand)
       (let*
           ([handfuls (map string-trim (string-split hand ","))])
         (map (lambda (handful)
                (let* ([morsels (string-split handful " ")]
                       [number (string->number (first morsels) 10)]
                       [color (string->symbol (last morsels))])
                  (when (< (hash-ref targets color) number)
                    (hash-set! targets color number))
                  )) handfuls)
         )) hands)
    (apply * (hash-values targets))
    ))

(call-with-input-file "input2"
  (lambda (in)
    (let
        ([bits (string-split (port->string in) "\n" #:trim? #t)])
      (apply + (map process-game bits)))))
