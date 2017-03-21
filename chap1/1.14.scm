(define (c-change m)
 (define (c n)
  (cond ((= n 1) 1)
	    ((= n 2) 5)
		((= n 3) 10)
		((= n 4) 25)
		((= n 5) 50)))
 (define (cc m n)
  (cond ((= m 0) 1)
		((or (< m 0) (= n 0)) 0)
		(else (+ (cc m (- n 1))
				 (cc (- m (c n)) n)))))

 (cc m 5))
; (c-change n 5)
;	(c-change n 4) + (c-change n-a[5] 5)
; 
; T = n^5
; M = n^5
