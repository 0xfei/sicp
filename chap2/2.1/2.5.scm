(define (m a b)
 (define (deal n ans)
  (if (= 0 n)
   ans
   (deal (- n 1) (* ans a))))
 (deal b 1))

(define (p k a)
 (define (deal n ans)
  (if (= 0 (remainder n k))
   (deal (/ n k) (+ ans 1))
   ans))
 (deal a 0))

(define (cons a b)
 (* (m 2 a) (m 3 b)))

(define (car c)
 (p 2 c))

(define (cdr c)
 (p 3 c))

