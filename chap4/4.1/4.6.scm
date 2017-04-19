(define (let? exp)
  (tagged-list? exp 'let))

(define (let-variables exp)
  (cadr exp))

(define (let-body exp)
  (caddr exp))

(define (let-var-item vars)
  (car vars))

(define (let-var-variable var)
  (car var))

(define (let-var-value var)
  (cadr var))

(define (let-empty-vars? vars)
  (null? vars))

(define (let-lambda-parameters exp)
  (map let-var-variable (let-variables exp)))

(define (let-lambda-values exp)
  (map let-var-value (let-variables exp)))

(define (let->combination exp)
  (let ((param (let-lambda-parameters exp))
        (value (let-lambda-values exp))
        (body (let-body exp)))
    (cons (list 'lambda param body) value)))
