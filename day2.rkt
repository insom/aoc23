#lang racket

(define targets (make-hash '((red . 12) (green . 13) (blue . 14))))

(define (process-game line)
  (let*
      ([bits (string-split line ":")]
       [game-number (string->number (last (string-split (first bits) " ")) 10)]
       [hands (string-split (last bits) ";")]
       [valid #t])
    (map
     (lambda (hand)
       (let*
           ([handfuls (map string-trim (string-split hand ","))])
         (map (lambda (handful)
                (let* ([morsels (string-split handful " ")]
                       [number (string->number (first morsels) 10)]
                       [color (last morsels)])
                  (when (< (hash-ref targets (string->symbol color)) number)
                    (set! valid #f))
                  )) handfuls)
         )) hands)
    (if valid game-number 0)
    ))

(call-with-input-file "input2"
  (lambda (in)
    (let
        ([bits (string-split (port->string in) "\n" #:trim? #t)])
      (apply + (map process-game bits)))))
