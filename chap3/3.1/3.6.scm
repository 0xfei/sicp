(define rand
  ;(define init (random 1000))
  ;(define a (random 1000))
  ;(define b (random 1000))
  ;(define m 1000)
  
  (let ((init 9527)
        (a 3)
        (b 7)
        (m 10000))
    (lambda (word)
      (define (reset x) (set! init x) init)
      (define (generate) (set! init (+ (* a init) b)) (remainder init m))
      (cond ((eq? word 'reset) reset)
            ((eq? word 'generate) (generate))
            (else "Error")))))

