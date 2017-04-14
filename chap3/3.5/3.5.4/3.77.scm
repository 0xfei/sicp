(define (integral delay-integrand init-value dt)
  (cons-stream init-value
               (if (stream-null? (force delay-integrand))
                 the-empty-stream
                 (integral (delay (stream-cdr (force delay-integrand)))
                           (+ (* dt (stream-car (force delay-integrand)))
                              init-value)
                           dt))))

