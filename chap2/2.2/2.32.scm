(define (subsets s)
 (if (null? s)
  (list `())
  (let ((rest (subsets (cdr s))))
   (append rest (map (lambda (l) (cons (car s) l)) rest)))))

