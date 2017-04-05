(define (make-accumulator init)
  (lambda (inc) 
    (begin 
      (set! init (+ init inc))
      init)))

