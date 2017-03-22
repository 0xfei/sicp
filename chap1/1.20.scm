(define (gcd a b)
 (if (= b 0) 
  a
  (gcd b (remainder a b))))

; (gcd 206 40)
; application order
; (gcd 40 6)
; (gcd 6 4)
; (gcd 4 2)
; (gcd 2 0)
; 2

; normal order
; (gcd 206 40)
; (gcd 40 (rem 206 40))
; (if (= (rem 206 40) 0) ....
; so many
