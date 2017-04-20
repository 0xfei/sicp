(define (make-let f var body)
  (list 'let f (list var) body))

(define (let-name exp)
  (cadr exp))

(define (let-variables exp)
  (caddr exp))

(define (let-body exp)
  (cadddr exp))

(define (let->combination exp)
  (let ((name (let-name exp))
        (param (let-lambda-parameters exp))
        (value (let-lambda-values exp))
        (body (let-body exp)))
    (cons (list 'lambda param body) value)))

; how to save the procedure into environment
; not using define ??
