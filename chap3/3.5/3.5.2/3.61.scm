(define (recip-series s)
  (cons-stream 1 (scale-stream
                   (mul-series (stream-cdr s) (recip-series s))
                   -1)))

