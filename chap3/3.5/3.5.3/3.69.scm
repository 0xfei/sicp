(define (triples s t u)
  (let ((a (stream-car s))
        (b (stream-car t))
        (c (stream-car u)))
    (cons-stream
      (list a b c)
      (interleave
        (stream-map
          (lambda (x) (list a (car x) (cdr x)))
          (pairs (stream-cdr t) (stream-cdr u)))
        (triples
          (stream-cdr s)
          (stream-cdr t)
          (stream-cdr u))))))


