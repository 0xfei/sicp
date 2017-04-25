(define (unless pred exp1 exp2)
  ((if (pred)
     (lambda () exp1)
     (lambda () exp2))))

; when pred is another unless which means there must execute a loop
