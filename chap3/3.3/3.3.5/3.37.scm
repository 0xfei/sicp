(load "3.33.scm")

(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))

(define (c- z x)
  (let ((y (make-connector)))
    (adder x y z)
    y))

(define (c* x y)
  (let ((z (make-connector)))
    (multi x y z)
    z))

(define (c/ z x)
  (let ((y (make-connector)))
    (multi x y z)
    y))

(define (cv value)
  (let ((x (make-connector)))
    (constant value x)
    x))

(define (celsius-fahrenheit-converter x)
  (c+ (c* (c/ (cv 9) (cv 5))
          x)
      (cv 32)))

(define C (make-connector))
(define F (celsius-fahrenheit-converter C))

