; using a-integer-from-starting-from
; situation will be : 1 1 (1 2 3 4 5 6 7 8 9 10................)

(define (a-pythagorean-triple-between)
  (let ((i (an-integer-starting-from 1)))
    (let ((j (an-integer-starting-from i)))
      (let ((k (an-integer-between j (+ (* i i) (* j j)))))
        (require (= (+ (* i i) (* j j)) (* k k)))
        (list i j k)))))

