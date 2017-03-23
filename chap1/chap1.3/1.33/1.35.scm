(define limit 0.00001)

(define (fixed-point f x)
 (define (close-enough? v1 v2)
  (< (abs (- v1 v2)) limit))
 (define (try x)
  (let ((x1 (f x)))
   (if (close-enough? x x1)
	x1
	(try x1))))
 (try x))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
