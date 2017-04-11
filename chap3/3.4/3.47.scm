(load "mutex.scm")

(define (multi-mutex n)
  (let ((count n)
        (lock (make-mutex)))
    (define (acquire)
      (lock 'acquire)
      (if (<= count 0)
        (begin (lock 'release) (acquire))
        (begin (set! count (- count 1)) (lock 'release))))
    (define (release)
      (lock 'acquire)
      (if (< count n) (set! count (+ count 1)))
      (lock 'release))
    (define (dispatch m)
      (cond ((eq? m 'acquire) (acquire))
            ((eq? m 'release) (release))
            (else "Error request")))
    dispatch))

