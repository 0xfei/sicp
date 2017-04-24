(define (letrec->let exp)
  (make-let (map make-undef (letrec-var exp)))
  (make-set (letrec-var exp) (letrec-imp exp))
  body)


  
