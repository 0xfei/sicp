(define (integral integrand init-value dt)
  (define int
    (cons-stream init-value
                 (add-stream (scale-stream integrand dt)
                             int))))

(define (rc r c dt)
  (lambda (i v0)
    (add-stream (scale-stream i r)
                (integral (scale-stream i (/ 1 c)) v dt))))

