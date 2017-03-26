(define (dot-product v w)
 (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
 (map (lambda (x) (dot-product x v)) m))

(define (transpose m)
 (accumulate-n cons `() m))

(define (matrix-*-matrix m n)
 (let ((t (transpose n)))
  (map (lambda (x) (matrix-*-vector t x)) m)))

