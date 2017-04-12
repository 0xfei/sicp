(define (partial-sum s)
  (define sums (cons-stream (stream-car s)
                            (add-stream (stream-cdr s)
                                        sums)))
  sums)


