(define (stream-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons-stream
      low
      (stream-enumerate-interval (+ low 1) high))))

(stream-car
  (stream-cdr
    (stream-filter even?
                   (stream-enumerate-interval 10000 1000000))))

(define (display-stream s)
    (stream-for-each display-line s))

(define (display-line x)
    (newline)
      (display x))

