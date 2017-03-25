(define (count-leaves t)
 (accumulate
  (lambda (x y) (+ x y))
  0
  (map (lambda (sub-tree) (if (pair? sub-tree) (count-leaves sub-tree) 1)) t)))

