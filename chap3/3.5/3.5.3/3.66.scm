(define (interleave s1 s2)
  (if (stream-null? s1)
    s2
    (cons-stream (stream-car s1)
                 (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream
    (cons (stream-car s) (stream-car t))
    (interleave
      (stream-map 
        (lambda (x) (cons (stream-car s) x)) 
        (stream-cdr t))
      (pairs (stream-cdr s) (stream-cdr t)))))

; (pairs integers integers)
; (1 1) (interleave ( (1 2) (1 3) (1 4) (1 5) ...)
;                   ( (2 2) (interleave ( (2 3) (2 4) (2 5) .....
;                                       ( (3 3) (interleave ........

