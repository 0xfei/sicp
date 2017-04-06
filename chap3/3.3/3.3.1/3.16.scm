(define (count-pairs x)
  (if (not (pair? x))
    0
    (+ (count-pairs (car x))
       (count-pairs (cdr x))
       1)))

; cycle (define x '(a b c)) (set-cdr x x) (count-pairs x)
; (define one (list 'a))
; (define two (list 'a 'b))
;;;;;;;
; (define three (cons one one))
; (define seven (three three)
;;;;;;;
;;;;;;;
; (define four (cons two (cdr two)))

