(define (sum f next a b)
    (define (iter a ans)
        (if (> a b)
            ans
            (iter (next a) (+ (f a) ans))))
    (iter a 0))