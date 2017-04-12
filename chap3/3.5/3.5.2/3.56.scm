(define (merge s1 s2)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
          (let ((a (stream-car s1))
                (b (stream-car s2)))
            (cond ((< a b)
                   (cons-stream a (merge (stream-cdr s1) s2)))
                  ((> a b)
                   (cons-stream b (merge s1 (stream-cdr s2))))
                  (else
                    (cons-stream a
                                 (merge (stream-cdr s1) (stream-cdr s2)))))))))

(define s (cons-stream 1 (merge (merge (scale-stream integers 2)
                                       (scale-stream integers 3))
                                (scale-stream integers 5))))

