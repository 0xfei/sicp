(define (make-frame origin ed1 ed2)
 (list origin ed1 ed2))

(define (origin-frame frame)
 (car frame))

(define (edge1-frame frame)
 (let ((eds (cdr frame)))
  (car eds)))

(define (edge2-frame frame)
 (let ((eds (cdr frame)))
  (cadr eds)))

