(define (make-center-percent mid rate)
 (let ((r (* mid rate)))
  (cons (- mid r) (+ mid r))))

