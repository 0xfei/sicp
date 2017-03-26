(define (ok? l s)
 (= (+ (car l) (car (cdr l)) (car (cdr (cdr l)))) s))

(define (unique_three n)
 (flatmap (lambda (i) (map (lambda (k) (cons i k)) (unique-pairs (- i 1))))
  (enumerate-interval 3 n)))

(define (output s n)
 (filter (lambda (l) (ok? l s)) (unique_three n)))

