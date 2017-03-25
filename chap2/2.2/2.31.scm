(define (deal-tree f tree)
 (cond ((null? tree) (list))
  ((not (pair? tree)) (f tree))
  (else (cons (deal-tree f (car tree))
		 (deal-tree f (cdr tree))))))

