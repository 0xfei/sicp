(define f
  (let ((x 'init))
    (lambda (y)
      (if (eq? x 'init)
        (begin (set! x y) x)
        0))))

