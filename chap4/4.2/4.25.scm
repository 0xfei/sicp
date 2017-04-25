(define (Fac n)
  (unless (= n 1)
    (* n (Fac (- n 1)))
    1))

; application order will do infinity loop

