; infinity loop
(define (p) (p))

(define (test x y)
 (if (= x 0)
  0
  y))

; application order -> call p 
; normal order -> witout call p
(test 0 (p))

