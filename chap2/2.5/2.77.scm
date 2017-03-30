(define z '(complex (rectangular 3 4)))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
        (apply proc (map contents args))
        (error "error")))))

(define (magnitude z)
  (apply-generic 'magnitude z))

; 1 -> apply-generic
; 2 -> get complex
; 3 -> real magnitude
