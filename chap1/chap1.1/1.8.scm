(define (semi x)
 (define (good-en? p n)
  (< (abs (/ (- n p) x)) 0.000000001))
 
 (define (improve y)
  (/ (+ (/ x (square y)) (* 2 y)) 3))
 
 (define (semi-it y p)
  (if (good-en? y p)
   y
   (semi-it (improve y) y)))

 (semi-it 1.0 x))

