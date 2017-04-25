; beacuse set! is not primitive function
; it will be delayed

(define (p1 x)
  (set! x (cons x '(2)))
  x)

(define (p2 x)
  (define (p e)
    e
    x)
  (p (set! x (cons x '(2)))))

(p1 1)

(p2 1)

