(define (new-if pred then-do else-do)
 (cond (pred then-do)
  (else else-do)))

(new-if (= 0 1) (display true) (display false))
; always display true and false
; whatever the order(application order or normal order)
