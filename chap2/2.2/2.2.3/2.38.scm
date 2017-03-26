(define (fold-left op initial seq)
 (define (iter result rest)
  (if (null? rest)
   result
   (iter (op result (car rest)) (cdr rest))))
 (iter initial seq))

