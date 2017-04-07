(define memo-fib
  (memoize (lambda (n)
             (if (<= n 1) 
               1
               (+ (memo-fib (- n 1))
                  (memo-fib (- n 2)))))))

; environment
