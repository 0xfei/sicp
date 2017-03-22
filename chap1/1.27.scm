(define (fast-expt a b n m)
 (cond ((= n 0) (remainder a m))
  ((even? n) (fast-expt a (remainder (square b) m) (/ n 2) m))
  (else (fast-expt (remainder (* a b) m) (remainder (square b) m) (/ (- n 1) 2) m))))


(define (fermet n)
 (define (check a)
  (= (fast-expt 1 a n n) a))
 (define (try t)
  (cond ((= t 1) true)
		((check t) (try (- t 1)))
		(else false)))
 (try (- n 1)))

