(define apply-in-underlying-scheme apply)

(load "eval.scm")
(load "exp.scm")
(load "data.scm")
(load "start.scm")

(define (and? exp)
  (tagged-list? exp 'and))

(define (and-clauses exp)
  (cdr exp))

(define (eval-and exps env)
  (cond ((last-exp? exps) (eval (first-exp exps) env))
        (else (if (not (eval (first-exp exps) env))
                false
                (eval-and (rest-exps exps) env)))))

(define (and->if exp)
  (expand-and (and-clauses exp)))

(define (expand-and clauses)
  (if (null? clauses)
    true
    (let ((first (car clauses))
          (rest (cdr clauses)))
      (make-if first
               (expand-and rest)
               false))))

