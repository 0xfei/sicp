(define (analyze-sequence exps)
  (define (sequentially proc1 proc2)
    (lambda (env) (proc1 env) (proc2 env)))
  (define (loop first-proc rest-proc)
    (if (null? rest-proc)
      first-proc
      (loop (sequentially first-proc (car rest-proc))
            (cdr rest-proc))))
  (let ((procs (map analyze exps)))
    (if (null? procs)
      (error "empty sequence")
      (loop (car procs) (cdr procs)))))

(define (analyze-sequence exps)
  (define (execute-exps exps env)
    (if (null? (cdr exps)
               ((car exps) env))
      (begin ((car exps) env)
             (execute-exps (cdr exps) env))))
  (let ((procs (map analyze exps)))
    (if (null? procs)
      (error "errro")
      (lambda (env) (execute-exps procs env)))))

; the difference is , version2 do not call execute-exps until analyze
; but version1 only call loop once, and internal analyze has been done once

