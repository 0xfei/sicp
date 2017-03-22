(define (fib n)
 
 (define (fib-iter a b p q count)
  (cond ((= count 0) b) 
   ((even? count) (fib-iter a b (+ p q) (+ (* 2 q) p) (/ count 2)))
   (else (fib-iter (+ (* b q) (* a q) (* a p)) (+ (* b p) (* a q)) p q (- count 1)))))
 
 (define (even? x)
  (= (remainder x 2) 0))

 (if (= n 0) 1 (fib-iter 1 0 0 1 n))

