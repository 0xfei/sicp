(define (fast-expt-c b n)
 (define (even? n)
  (= (remainder n 2) 0))
 (cond ((= n 0) 1)
	   ((even? n) (square (fast-expt-c b (/ n 2))))
	   (else (* b (fast-expt-c b (- n 1))))))

(define (fast-expt b n)
 (define (even? n)
  (= (remainder n 2) 0))

 (define (deal a b n)
  (cond ((= n 0) a)
		((even? n) (deal a (* b b) (/ n 2)))
		(else (deal (* a b) (* b b) (/ (- n 1) 2)))))
 
 (deal 1 b n))

