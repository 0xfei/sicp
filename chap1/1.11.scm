(define (f1 n)
 (if (< n 3)
  n
  (+ 
   (f1 (- n 1)) (* 2 (f1 (- n 2))) (* 3 (f1 (- n 3))))))

(define (f n)
 (define (f2 i j k n)
  (define (h x y z)
   (+ z (* 2 y) (* 3 x)))
  (if (= 0 n)
   k
   (f2 j k (h i j k) (- n 1))))
 (if (< n 3)
  n
  (f2 0 1 2 (- n 2))))

