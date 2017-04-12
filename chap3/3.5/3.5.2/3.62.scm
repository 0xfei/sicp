(define (div-series x y)
  (mul-series x (recip-series y)))

(define tan-series
  (div-series sin-series cos-series))

(define (div-series s1 s2)
  (let ((c (stream-car s2)))
    (scale-stream (mul-series s1 (reciprocal-series (scale-stream s2 (/ 1 c))))
                  (/ 1 c))))

