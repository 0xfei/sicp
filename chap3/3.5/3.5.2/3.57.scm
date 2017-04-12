(define count 0)

(define (add-stream-test s1 s2)
    (stream-map (lambda (x y) (set! count (+ count 1)) (+ x y)) s1 s2))

(define fibs
  (cons-stream 0
               (cons-stream 1
                            (add-stream-test fibs (stream-cdr fibs)))))


; mem version: count = n - 1
; not mem: count = 1 + 2 + ... + (n-1)
