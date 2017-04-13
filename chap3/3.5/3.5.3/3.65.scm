(define (euler-transform s)
  (let ((s0 (stream-ref s 0))
        (s1 (stream-ref s 1))
        (s2 (stream-ref s 2)))
    (cons-stream (- s2 (/ (square (- s2 s1))
                          (+ s0 (* -2 s1) s2)))
                 (euler-transform (stream-cdr s)))))

(define (make-tableau trans s)
  (cons-stream s
               (make-tableau trans
                             (trans s))))

(define (acc-seq trans s)
  (stream-map stream-car (make-tableau trans s)))

(define (ln-stream n)
  (cons-stream (/ 1.0 n)
               (stream-map - (ln-stream (+ n 1)))))

(define ln2
  (partial-sum (ln-stream 1)))

