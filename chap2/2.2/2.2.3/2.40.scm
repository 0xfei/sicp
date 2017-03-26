(define (enumerate-interval s t)
 (if (> s t)
  `()
  (cons s (enumerate-interval (+ s 1) t))))

(define (flatmap proc seq)
 (accumulate append `() (map proc seq)))

(define (unique-pairs n)
 (flatmap (lambda (i) 
		   (map 
			(lambda (j) (list i j)) 
			(enumerate-interval 1 (- i 1)))) 
  (enumerate-interval 2 n)))

(define (prime-sum? pair)
 (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
 (let ((a (car pair))
	   (b (cadr pair)))
  (list a b (+ a b))))

(define (prime-sum-pairs n)
 (map make-pair-sum
  (filter prime-sum? (unique-pairs n))))
