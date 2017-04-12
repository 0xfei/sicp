(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1) (stream-car s2))
               (add-stream (scale-stream (stream-cdr s1) (stream-car s2))
                           (mul-series s1 (stream-cdr s2)))))

(define ans
  (add-stream (mul-series cosine-series cosine-series)
              (mul-series sine-series sine-series)))

