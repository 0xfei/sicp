(lambda <vars>
  (let ((u '*undef*)
        (v '*undef*))
    (let ((a <e1>)
          (b <e2>))
      (set! u a)
      (set! v b))
    <e3>))

(define (solve f y0 dt)
  (define y (integral (delay dy) y0 dt))
  (define dt (stream-map f y))
  y)

; now
(define solve
  (lambda (f y0 dt)
    (let ((y '*undef*)
          (dt '*undef*))
      (let ((a (integral (Delay dy) y0 dt))
            (b (stream-map f y)))
        (set! y a)
        (set! dt b))
      y)))

; prev
(define solve
  (lambda (f y0 dt)
    (let ((y '*undef*)
          (dt '*undef*))
      (set! y (integral (delay dt) y0 dt))
      (set! dt (stream-map f y))
      y)))

