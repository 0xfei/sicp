(define (sine x)
 (define (cube x) (* x x x))
 (define (p x) (- (* x 3) (* 4 (cube x))))
 (if (< (abs x) 0.1)
  x
  (p (sine (/ x 3.0)))))
; (sine 12.15) -> (p (sine 4.05)) -> (p (p (sine 1.013))) -> (p (p (p .)))
; memory: n
; time: log3(n)

