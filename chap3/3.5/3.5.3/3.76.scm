(define (smooth stream)
  (let ((a (stream-ref stream 0))
        (b (stream-ref stream 1)))
    (cons-stream (/ (+ a b) 2) (smooth (stream-cdr stream)))))

(define (make-zero-crossings input-stream last-value)
    (cons-stream (sign-change-detector (stream-car input-stream) last-value)
                 (make-zero-crossings (stream-cdr input-stream) (stream-car input-stream))))


;; better version
(define (smooth input-stream)
  (stream-map (lambda(x y)(/ (+ x y) 2)) input-stream (stream-cdr input-stream)))

(define (zero-crossings input-stream)
  (stream-map sign-change-detector input-stream (stream-cdr input-stream)))

(define (smoothed-zero-crossing sense-data)
  (zero-crossings (smooth sense-data)))

