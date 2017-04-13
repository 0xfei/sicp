(define (weight-3 x)
  (+ (* (car x) (car x) (car x))
     (* (cdr x) (cdr x) (cdr x))))

(define (find-l l)
  (let ((a (stream-ref l 0))
        (b (stream-ref l 1)))
    (if (= (weight-3 a) (weight-3 b))
      (cons-stream (cons (weight-3 a) a) (find-l (stream-cdr l)))
      (find-l (stream-cdr l)))))

(define l (pairs integers integers weight-3))

; my (pais-weight) version do some remove work
; so this can not be working well

