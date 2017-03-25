(define (reverse l)
 (define (do-reverse l1 l2)
  (let ((s (car l1))
		(t (cdr l1)))
   (if (null? t)
	(cons s l2)
	(do-reverse t (cons s l2)))))
 (do-reverse l (list)))

