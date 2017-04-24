(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             (if (eq? (car vals) '*undefined*)
               (error "undefined")
               (car vals)))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
      (error "unbound variable")
      (let ((frame (first-frame env)))
        (scan (frame-variables frame)
              (frame-values frame)))))
  (env-loop env))

; (define (exp <a> ..) <body>)

; 1. find all define (define (<name> <p1> <p2> ...) (define (<d1>) ()) (define (<d2>) ()) <body>)

(define (proc-second exp)
  (cadr exp))

(define (proc-name exp)
  (car (proc-second exp)))

(define (proc-param exp)
  (cdr (proc-second exp)))

(define (proc-defs exp)
  (map is-define (cddr exp)))

