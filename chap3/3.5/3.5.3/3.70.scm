(define (merge-weight s t weight)
  (let ((a (stream-car s))
        (b (stream-car t)))
    (cond ((< (weight a) (weight b))
           (cons-stream a (merge-weight (stream-cdr s) t weight)))
          ((> (weight a) (weight b))
           (cons-stream b (merge-weight (stream-cdr t) s weight)))
          (else
            (cons-stream a (merge-weight (stream-cdr t) (stream-cdr s) weight))))))

(define (weight-s x)
  (+ (car x) (cdr x)))

(define (weight-m x)
  (+ (* 2 (car x))
     (* 3 (cdr x))
     (* 5 (car x) (cdr x))))

(define (weight-multi x)
  (+ (* 10 (car x))
     (cdr x)))

(define (interleave s1 s2)
  (if (stream-null? s1)
    s2
    (cons-stream (stream-car s1)
                 (interleave s2 (stream-cdr s1)))))

(define (pairs s t weight)
  (cons-stream
    (cons (stream-car s) (stream-car t))
    (merge-weight
      (stream-map 
        (lambda (x) (cons (stream-car s) x)) 
        (stream-cdr t))
      (pairs (stream-cdr s) (stream-cdr t) weight)
      weight)))

