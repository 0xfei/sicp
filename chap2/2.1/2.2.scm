(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (make-segment s t) (cons s t))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define (midpoint-segment seg)
 (let ((x1 (/ (+ (x-point (start-segment seg))
			   (x-point (end-segment seg))) 2.0))
	   (y1 (/ (+ (y-point (start-segment seg))
			   (y-point (end-segment seg))) 2.0)))
  (make-point x1 y1)))


