; cond
(define (cond? exp)
  (tagged-list? exp 'cond))

(define (cond-clauses exp)
  (cdr exp))

(define (cond-else-clause? clause)
  (eq? (cond-predicate clause) 'else))

(define (cond-predicate clause)
  (car clause))

(define (cond-actions clause)
  (cdr clause))

(define (cond-2-flag action)
  (car action))

(define (cond-2-action action)
  (cadr action))

(define (cond-2-clause? action)
  (and (pair? action) 
       (eq? (cond-2-flag action) '=>)))

(define (cond->if exp)
  (expand-clauses (cond-clauses exp)))

(define (expand-clauses clauses)
  (if (null? clauses)
    'false
    (let ((first (car clauses))
          (rest (cdr clauses)))
      (if (cond-else-clause? first)
        (if (null? rest)
          (sequence->exp (cond-actions first))
          (error "Error cond"))
        (if (cond-2-clause? (cond-actions first))
          (make-if (cond-predicate first)
                   (eval (cond-2-action (cond-actions first))
                         (cond-predicate first))
                   (expand-clauses rest))
          (make-if (cond-predicate first)
                   (sequence->exp (cond-actions first))
                   (expand-clauses rest)))))))

