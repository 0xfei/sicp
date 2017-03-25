(define (accumulate op initial seq)
 (if (null? seq)
  initial
  (op (car seq) (accumulate op initial (cdr seq)))))

(define (h-map p seq)
 (accumulate (lambda (x y) (cons (p x) y)) `() seq))

(define (h-append seq1 seq2)
 (accumulate cons seq2 seq1))

(define (h-length seq)
 (accumulate (lambda (x y) (+ 1 y)) 0 seq))

