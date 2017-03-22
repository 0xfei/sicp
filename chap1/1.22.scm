(define (timed-prime-test n)
 (display (real-time-clock))
 (start-time-test n (real-time-clock)))

(define (start-time-test n s)
 (if (prime? n)
  (report-prime (- (real-time-clock) s) n)))

(define (report-prime time n)
 (newline)
 (display n)
 (display " *** ")
 (display time))

(define (search-for-primes s t)
 (define (deal s t)
  (if (< s t) (timed-prime-test s))
  (if (< (+ s 2) t) (deal (+ s 2) t)))
 (if (even? s) (deal (+ s 1) t) (deal s t)))

