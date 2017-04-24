; definitly Alyssa is right, and i support her.
; for Eva:

(let ((a 1))
  (define (f x)
    (define b (+ a x))
    (define a 5)
    (+ a b))
  (f 10))

(lambda (a)
  (let ((f '*undef*))
    (let ((b '*undef*)
          (a '*undef*))
      ; check if b need a
      (set! a 5)
      (set! b (+ a x)) ;(+ 5 x)
      (+ a b)))
  (f 10))

