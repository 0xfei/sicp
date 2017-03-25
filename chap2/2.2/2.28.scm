(define (fringe t)
 (cond ((null? t) (list))
  (else (let ((s (car t))
			  (l (cdr t)))
		 (if (pair? s)
		  (append (fringe s) (fringe l))
		  (cons s (fringe l)))))))


