(define (fail n m)
 (and (= 1 (remainder n m)) 
  (not (= n 1))
  (not (= n (- m 1)))))
	
(define (fast-expt a b n m)
 (cond ((fail b m) 0)
  ((= n 0) (remainder a m))
  ((even? n) (fast-expt a (remainder (square b) m) (/ n 2) m))
  (else (fast-expt (remainder (* a b) m) (remainder (square b) m) (/ (- n 1) 2) m))))


(define (fermet n)
 (define (check a)
  (= (fast-expt 1 a (- n 1) n) 1))
 (define (try t)
  (cond ((= t 0) true)
		((check (+ 1 (random (- n 1)))) (try (- t 1)))
		(else false)))
 (try 10))

