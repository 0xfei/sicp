(load "2.2.scm")

(define (square-area square)
 (* 2 (get-square-b square) (get-square-a square)))
(define (square-perm square)
 (* (get-square-a square) (get-square-b square)))
	
(define (make-square p1 p2 p3 p4)
 (cons (make-segment p1 p2) (make-segment p3 p4)))
(define (get-square-a square) 
 (segment-length (car square)))

(define (get-square-b square) 
 (segment-length (cdr square)))

(define (segment-length seg)
 (let ((x1 (x-point (start-segment seg)))
	   (x2 (x-point (end-segment seg)))
	   (y1 (y-point (start-segment seg)))
	   (y2 (y-point (end-segment seg))))
  (sqrt (+ (square (- x2 x1)) (square (- y2 y1))))))

