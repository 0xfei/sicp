((lambda (n)
   ((lambda (fact)
      (fact fact n))
    (lambda (ft k)
      (if (= k 1)
        1
        (* k (ft ft (- k 1)))))))
 10)

((lambda (n)
   ((lambda (fact)
      (fact fact 1 0 1))
    (lambda (ft s a b)
      (if (= s n)
        b
        (ft ft (+ s 1) b (+ a b))))))
 10)

(define (f x)
  (define (even? n)
    (if (= n 0)
      true
      (odd? (- n 1))))
  (define (odd? n)
    (if (= n 0)
      false
      (even? (- n 1))))
  (even? x))


(define (f x)
  ((lambda (even? odd?)
     (even? even? odd? x))
   (lambda (ev? od? n)
     (if (= n 0)
       true
       (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (= n 0)
       false
       (ev? ev? od? (- n 1))))))

