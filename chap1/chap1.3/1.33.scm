(define (accumulate comb orig f next filter a b end)
    (define (iter a ans)
        (if (end a b)
            ans
            (if (filter a) (iter (next a) (comb (f a) ans)) (iter (next a) ans))))
    (iter a orig))

(define (sum a b)
    (accumulate + 0 o i even? a b >))
