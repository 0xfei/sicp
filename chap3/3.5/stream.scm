(define (mem-f f)
  (let ((has-called? false) (result false))
    (lambda () 
      (if has-called?
        result
        (begin (set! result (f))
               (set! has-called? true)
               result)))))
(define (delay f) (mem-f f))
(define (force f) (f))

(define the-empty-stream '())
(define (stream-null? s) (null? s))
(define (cons-stream s t) (cons s (delay t)))
(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))

(define (stream-ref s n)
  (if (= n 0)
    (stream-car s)
    (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map f s)
  (if (stream-null? s)
    the-empty-stream
    (cons-stream (f (stream-car s)
                    (stream-map f (stream-cdr s))))))

(define (stream-filter f s)
  (cond ((stream-null? s)
         the-empty-stream)
        ((f (car s))
         (cons-stream (car s)
                      (stream-filter f (cdr s))))
        (else
          (stream-filter f (cdr s)))))

(define (stream-for-each f s)
  (if (stream-null? s)
    'done
    (begin (f (stream-car s)
              (stream-for-each f (stream-cdr s))))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))

