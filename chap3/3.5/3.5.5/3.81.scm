(define (rand-stream input-stream)
  (define s (cons-stream init-random-value
                         (stream-map (lambda (old . request)
                                       (cond ((eq? (car request) 'generate)
                                              (rand-update old))
                                             ((eq? (car request) 'reset)
                                              (cadr request))))
                                     input-stream
                                     s)))
  s)

