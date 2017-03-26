(define (reverse seq)
 (fold-right (lambda (x y) (append y (list x))) `() seq))

(define (reverse seq)
 (fold-left (lambda (x y) (append (list y) x)) `() seq))

