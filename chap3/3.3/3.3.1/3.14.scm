(define (mystery x)
  (define (loop x y)
    (if (null? x)
      y
      (let ((temp (cdr x)))
        (set-cdr! x y)
        (loop temp x))))
  (loop x '()))

; reverse

(define v '(a b c d))

; [a] -> [b] -> [c] -> [d] -> nil
; temp : [a] -> '()
; temp : [b] -> temp
; temp : [c] -> temp
; temp : [d] -> temp

(define w (mystery v))

; w '(d c b a)
