(define (accumulate comb orig f next a b end)
    (define (iter a ans)
        (if (end a b)
            ans
            (iter (next a) (comb (f a) ans))))
    (iter a orig))

(define (o a) a)
(define (i a) (+ 1 a))

(define (sum a b)
    (accumulate + 0 o i a b >))
