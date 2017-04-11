(define balance 100)

(set! balance (+ balance 20))
(set! balance (- balance 10))
(set! balance (- balance (/ balance 2)))

; a = (+ balance 20)
; b = (- balance 10)
; c = (/ balance 2)
; d = (- balance c)
; balance = a | b | c | d
; 10 20 50 ... 
