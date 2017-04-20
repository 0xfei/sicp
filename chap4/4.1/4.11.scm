; environment
(define the-empty-environment '())

(define (enclosing-environment env)
  (cdr env))

(define (first-frame env)
  (car env))

(define (make-frame ks vs)
  (if (null? ks)
    '()
    (let ((k (car ks))
          (v (car vs))
          (lk (cdr ks))
          (lv (cdr vs)))
        (cons (cons k v) (make-frame lk lv)))))

(define (frame-variables frame)
  (car (car frame)))

(define (frame-values frame)
  (cdr (car frame)))

(define (add-binding-to-frame! var val frame)
  (cons (cons var val) frame))

(define (extend-environment vars vals base-env)
  (if (= (length vars) (length vals))
    (cons (make-frame vars vals) base-env)
    (error "vars and vals not equal")))
