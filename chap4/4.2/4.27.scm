(define count 0)
(define (id x)
  (set! count (+ count 1))
  x)
; count -> 0


(define w (id (id 10)))
; count -> 1  ( (id 10) called )

; w -> 10
; count -> 2 

