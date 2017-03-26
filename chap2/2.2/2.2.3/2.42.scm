(define (safe? x l)
 (define (is-safe? y i l)
  (if (null? l)
	#t
   (let ((j (car l)))
	(if (or (= j y)
		 (= 1 (/ (abs (- i x)) (abs (- j y)))))
	 #f
	 (is-safe? y (- i 1) (cdr l))))))
 (is-safe? (car l) (- x 1) (cdr l)))

(define (adjoin-position i k rest-of-queens)
 (cons i rest-of-queens))

(define (queens board-size)
 (define (queen-cols k)
  (if (= k 0)
   (list `())
   (filter
	(lambda (positions) (safe? k positions))
	(flatmap
	 (lambda (rest-of-queens)
	  (map (lambda (new-row)
			(adjoin-position new-row k rest-of-queens))
	   (enumerate-interval 1 board-size)))
	 (queen-cols (- k 1))))))
 (queen-cols board-size))

