(define (random-in-range low high)
	(let ((range (- high low)))
		(+ low (random range))))

(define (metor-test count experiment)	
  (define (do-estimate n m)
    (cond ((= 0 n) (/ m count))
          ((experiment) (do-estimate (- n 1) (+ m 1)))
          (else (do-estimate (- n 1) m))))
  (do-estimate count 0))

(define (estimate-integral p x1 x2 y1 y2 count)
  (define (experiment)
    (let ((x (random-in-range x1 x2))
          (y (random-in-range y1 y2)))
      (p x y)))
  (let ((square-area (* (- x2 x1) (- y2 y1))))
    (* 1.0 square-area (metor-test count experiment))))

