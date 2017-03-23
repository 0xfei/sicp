(define (multi f next a b)
    (define (iter a ans)
        (if (> a b)
            ans
            (iter (next a) (* (f a) ans))))
    (iter a 1))

(define (orig x) x)

(define (fac n)
    (multi orig inc 1 n))

(define (cala i)
    (if (even? i) (+ 2 i)
                  (+ 1 i)))
(define (calb i)
    (if (even? i) (+ 1 i)
                  (+ 2 i)))

(define (cpi n)
    (* 4.0 (/ (multi cala inc 1 n)
              (multi calb inc 1 n))))
