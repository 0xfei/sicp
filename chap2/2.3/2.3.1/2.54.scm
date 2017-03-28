(define (equal l1 l2)
 (if (or (not (pair? l1)) (not (pair? l2)))
  (eq? l1 l2)
  (let ((c1 (car l1))
		(c2 (car l2)))
   (if (eq? c1 c2)
	(equal (cdr l1) (cdr l2))
	false))))

