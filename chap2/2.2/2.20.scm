(define (filter f l)
 (define (do-filter l1 l2)
  (if (null? l1)
   l2
   (let ((s (car l1))
		 (t (cdr l1)))
	(if (f s)
	 (do-filter t (cons s l2))
	 (do-filter t l2)))))
 (reverse (do-filter l (list))))

(define (same-parity h . l)
 (let ((r (remainder h 2)))
  (filter (lambda (x) (= (remainder x 2) r)) (cons h l))))

