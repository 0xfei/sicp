(define (dec a) (- a 1))
(define (inc a) (+ a 1))

(define (p1 a b)
 (if (= a 0)
  b
  (inc (p1 (dec a) b))))
; linear recursive 
; inc (p1 a b)
; inc (inc (p1 a-1 b))
; inc (inc (inc (p1 a-2 b)))
; ......
; inc (inc (inc (inc (p1 0 b))))
; inc (inc (inc b+1))
; inc (inc b+2)
; ......
; inc b+a-1
; inc b+a


(define (p2 a b)
 (if (= a 0)
  b
  (p2 (dec a) (inc b))))
; linear iterative
; (p2 a b)
; (p2 a-1 b+1)
; ......
; (p2 0 b+a)
