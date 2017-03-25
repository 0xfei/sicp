(define (hornor x seq)
 (accumulate (lambda (a b) (+ (* b x) a)) 0 seq))

