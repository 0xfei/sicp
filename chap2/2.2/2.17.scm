(define (last-pair l)
 (let ((s (car l))
	   (t (cdr l)))
  (if (null? t)
   s
   (last-pair t))))

