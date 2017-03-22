(define (divides? k n)
 (= (remainder n k) 0))

(define (find-divisor n k)
 (cond ((> (square k) n) n)
  ((divides? k n) k)
  (else (find-divisor n (+ k 1)))))

(define (smallest-divisor n)
 (find-divisor n 2))

(define (prime? n)
 (= n (smallest-divisor n)))

