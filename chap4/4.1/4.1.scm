(define (list-of-values exps env)
  (if (no-operands? exps)
    '()
    (let ((a (eval (first-operands exps) env))
          (b (list-of-values (rest-operands exps) env)))
      (cons a b))))

