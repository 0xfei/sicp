(define (stream-limit s t)
  (let ((s0 (stream-ref s 0))
        (s1 (stream-ref s 1)))
    (if (< (abs (- s0 s1)) t)
      s1
      (stream-limit (stream-cdr s) t))))

(define (sqrt-m x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

