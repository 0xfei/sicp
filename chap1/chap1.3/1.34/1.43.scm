(define (compose f g)
 (lambda (x) (f (g x))))

(define (repeated f n)
 (define (plus g n)
  (if (= n 0) 
   g 
   (plus (compose f g) (- n 1))))
 (plus f (- n 1)))

