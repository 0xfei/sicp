(define (attach-tag type contents)
  (if (symbol? type)
    (cons type contents)
    contents))

(define (type-tag dat)
  (cond ((number? dat) '())
        ((pair? dat) (car dat))
        (else "error type")))

(define (contents dat)
  (cond ((number? dat) dat)
        ((pair? dat) (cdr dat))
        (else "error contents")))

