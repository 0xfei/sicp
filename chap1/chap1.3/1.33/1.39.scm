(define (tan-cf x k)
 (define (deal i)
  (let ((p (+ (* 2 i) 1))
		(j (+ i 1)))
   (if (= i k)
	(/ (square x) p)
	(/ (square x) (- p (deal j))))))
 (/ (* 1.0 x) (- 1 (deal 1))))

