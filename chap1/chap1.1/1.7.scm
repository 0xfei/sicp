(define (good-en? x y z)
 (< (abs (/ (- x y) z)) 0.0001))

(define (avg x y)
 (/ (+ x y) 2))

(define (improve guess x)
 (avg guess (/ x guess)))
	
(define (good-en2? guess x)
 (< (abs (- (square guess) x)) 0.001))

(define (sqrt-it2 guess x)
 (if (good-en2? guess x)
  guess
  (sqrt-it2 (improve guess x) x)))

(define (sqrt-it guess prev x)
 (if (good-en? guess prev x)
  guess
  (sqrt-it (improve guess x) guess x)))

(define (sqrt x)
 (sqrt-it 1.0 x x))

