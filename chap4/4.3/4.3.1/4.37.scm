(define (a-pythagorean-triple-between low high)
  (let ((i (an-integer-between low high))
        (hsg (* high high)))
    (let ((j (an-integer-between i high)))
      (let ((ksq (+ (* i i) (* j j))))
        (require (>= hsq ksq))
        (let ((k (sqrt ksq)))
          (require (integer? k))
          (list i j k))))))

; the slower part is integer? and sqrt
; when hig >>> low ,this version is better
