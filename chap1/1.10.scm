(define (A x y)
 (cond 
	((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1)
			 (A x (- y 1))))))

(A 1 10)
; (A 0 (A 1 9))
; (A 0 (A 0 (A 1 8)))
; (A 0 (A 0 (A 0 (A 1 7))))
; ......
; 2^10
; (A 1 N) = 2^N

(A 2 4)
; (A 1 (A 2 3))
; (A 1 (A 1 (A 2 2)))
; (A 1 (A 1 (A 1 (A 2 1))))
; 2^2^2..^2 (n-1)

(A 3 3)
; (A 2 (A 3 2))
; (A 2 (A 2 (A 3 1)))
; (A 2 (A 2 2))
; (A 2 4)
; 2^2^2..^2 (2^(n-1))

(define (f n) (a 0 n))
; 2*x

(define (g n) (a 1 n))
; 2^n

(define (h n) (a 2 n))
; 2^2^....^2 (n-1)

(define (k n) (* 5 n n))
; 5n^2
