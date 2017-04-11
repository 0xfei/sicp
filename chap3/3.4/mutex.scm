(define (make-serializer)
  (let ((mutex (make-mutex)))
    (lambda (p)
      (define (sp . args)
        (mutex 'acquire)
        (let ((v (apply p args)))
          (mutex 'release)
          v))
      sp)))

(define (make-mutex)
  (let ((cell (list false)))
    (define (mutex m)
      (cond ((eq? m 'acquire)
             (if (test-and-set! cell)
               (mutex 'acquire)))
            ((eq? m 'release)
             (clear! cell))))
    mutex))

(define (clear! cell)
  (set-car! cell false))

(define (test-and-set! cell)
  (without-interrupts
    (lambda ()
      (if (car cell)
        true
        (begin (set-car! cell true)
               false)))))

