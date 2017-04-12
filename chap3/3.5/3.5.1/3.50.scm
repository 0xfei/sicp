(define (stream-map f . s)
  (if (stream-null? (car s))
    the-empty-stream
    (cons-stream
      (apply f (map (lambda (s) (stream-car s)) s))
      (apply stream-map
             (cons f (map (lambda (s) (stream-cdr s)) s))))))

