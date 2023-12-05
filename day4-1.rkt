#lang racket
(require racket/set)

(define card-hash (make-hash))

(define (process-line line)
  (let*
      ([bits (string-split line ":")]
       [number-bits (string-split (last bits) "|")]
       [card-number (string->number (last (string-split (string-trim (first bits) " "))))]
       [winning-numbers (regexp-split #rx" +" (string-trim (first number-bits)))]
       [our-numbers (regexp-split #rx" +" (string-trim (last number-bits)))])
          (define win-count (set-count (set-intersect
           (list->set our-numbers)
           (list->set winning-numbers))))
          (list card-number win-count)))

(define (process-cards cards counter)
  (if (empty? cards) counter
      (let*
        ([card (first cards)]
         [card-number (first card)]
         [card-value (second card)])
      (cond
        [(= 0 card-value) (process-cards (rest cards) (+ 1 counter))]
        [else ; this card won something. yay.
          (printf "~a\n" card-number)
          (define new-cards
              (map (lambda (card-id) (hash-ref card-hash card-id))
                 (range (+ 1 card-number) (+ 1 card-number card-value))))
          (process-cards (append new-cards (rest cards)) (+ 1 counter))]))))

(call-with-input-file "input4"
  (lambda (in)
    (let*
        ([bits (string-split (port->string in) "\n" #:trim? #t)]
         [cards (map process-line bits)])
        (for ([card cards])
            (hash-ref! card-hash (first card) card))
        (process-cards cards 0))))
