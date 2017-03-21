(define (yh x y)
 (if (or (= y 1) (= x y))
  1
  (+ (yh (- x 1) (- y 1))
   (yh (- x 1) y))))

