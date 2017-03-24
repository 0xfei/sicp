(define (iterative-improve good? improve)
 (define (do-loop x)
  (let ((next (improve x)))
   (if (good? x next)
	next
	(do-loop next))))
 (lambda (x) (do-loop x)))

