(define (average-damp f)
 (lambda(x) (/ (+ (f x) x) 2)))

(define (sqrn n x)
 (fixed-point 
  ((repeated average-damp (- n 1))
   (lambda (y) (/ x (fast-expt y (- n 1))))) 
  1.0))

