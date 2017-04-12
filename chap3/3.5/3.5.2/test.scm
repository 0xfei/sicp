(load "../3.5.1/3.50.scm")
(load "../3.5.1/stream_test.scm")

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

(define ones (cons-stream 1 ones))

(define (add-stream s1 s2)
  (stream-map + s1 s2))

(define integers (cons-stream 1 (add-stream ones integers)))

(define fibs
  (cons-stream 0
               (cons-stream 1 (add-stream (stream-cdr fibs)
                                          fibs))))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define double (cons-stream 1 (scale-stream double 2)))

(define primes
  (cons-stream
    2
    (stream-filter prime? (integers-starting-from 3))))

(define (divisible? x y)
  (if (= (remainder x y) 0)
    true
    false))

(define (prime? n)
  (define (iter ps)
    (cond ((> (square (stream-car ps)) n) true)
          ((divisible? n (stream-car ps)) false)
          (else (iter (stream-cdr ps)))))
  (iter primes))

