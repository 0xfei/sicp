(define (or-gate a1 a2 output)
  (let ((b1 (make-wire))
        (b2 (make-wire))
        (a3 (make-wire)))
    (inverter-delay a1 b1)
    (inverter-delay a2 b2)
    (and-gate b1 b2 a3)
    (inverter-delay a3 output)))

(define (or-gate-delay)
  (+ (* 3 inverter-delay) and-gate-delay))

