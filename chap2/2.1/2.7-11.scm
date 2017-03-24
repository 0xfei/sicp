(define (make-interval x y) (cons x y))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))
(define (valid-interval x) 
 (> (lower-bound x) 0)
 (< (upper-bound x) 0))

(define (add-interval x y)
 (make-interval 
  (+ (lower-bound x) (lower-bound y))
  (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
 (let ((p1 (* (lower-bound x) (lower-bound y)))
	   (p2 (* (lower-bound x) (upper-bound y)))
	   (p3 (* (upper-bound x) (lower-bound y)))
	   (p4 (* (upper-bound x) (upper-bound y))))
  (make-interval (min p1 p2 p3 p4)
   (max p1 p2 p3 p4))))

(define (div-interval x y)
 (if (valid-interval y)
  (mul-interval x (make-interval (/ 1.0 (upper-bound y))
				   (/ 1.0 (lower-bound y))))
  (error)))

(define (sub-interval x y)
 (let ((p1 (- (upper-bound y) (lower-bound x)))
	   (p2 (- (upper-bound x) (lower-bound y))))
  (make-interval (min (- p1) (- p2)) (max p1 p2))))


