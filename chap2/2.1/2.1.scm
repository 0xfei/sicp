(define (make-rat n d)
 (let ((k (gcd n d)))
  (if (< d 0) 
   (cons (- (/ n k)) (- (/ d k)))
   (cons (/ n k) (/ d k)))))

(define (numer x) (car x))
(define (denom x) (cdr x))

