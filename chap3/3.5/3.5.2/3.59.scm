(define (integrate-series s)
  (define (inter s n)
    (cons-stream (/ (stream-car s) n)
                 (inter (stream-cdr s) (+ n 1))))
  (inter s 1))

(define exp-series
  (cons-stream 1 (integrate-series exp-series)))

(define cosine-series
  (cons-stream 1 (integrate-series sine-series)))

(define sine-series
  (cons-stream 0 (scale-stream (integrate-series cosine-series) -1)))

