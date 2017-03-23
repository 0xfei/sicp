(define limit 0.00001)

(define (fixed-point f x)
 (define (close-enough? v1 v2)
  (< (abs (- v1 v2)) limit))
 (define (try x)
  (newline)
  (display " *** ")
  (display x)
  (let ((x1 (f x)))
   (if (close-enough? x x1)
	x1
	(try x1))))
 (try x))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 4)
(newline)
(display "**************")
(fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) 4)
