(define (cont-frac n d k)
 (define (deal i)
  (let ((di (d i))
		(ni (n i))
		(j (+ i 1)))
   (if (= i k)
	(/ ni di)
	(/ ni (+ di (deal j))))))
 (deal 1))

(define (cont-frac1 n d k)
 (define (deal i ans)
  (let ((j (- i 1))
		(di (d i))
		(ni (n i)))
   (if (= i 0)
	ans
	(deal j (/ ni (+ di ans))))))
 (deal (- k 1) (/ (n k) (d k))))

(define (cont k)
 (cont-frac
  (lambda (i) 1.0)
  (lambda (i) 1.0)
  k))

(define (cont1 k)
 (cont-frac1
  (lambda (i) 1.0)
  (lambda (i) 1.0)
  k))
