(define (pairs s t)
  (cons-stream
    (cons (stream-car s) (stream-car t))
    (interleave
      (stream-map 
        (lambda (x) (cons (stream-car s) x)) 
        (stream-cdr t))
      (pairs (stream-cdr s) t))))

