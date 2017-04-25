(define (analyze-let exp)
  (let ((param (map analyze (let-lambda-parameters exp)))
        (value (map analyze (let-lambda-values exp)))
        (body (analyze-sequence (let-body exp))))
    (lambda (env) ((make-procedure param body env)
                   (map (lambda (p) (p env)) value)))))


