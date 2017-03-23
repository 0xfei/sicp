(define (inc a)
        (+ 1 a))

(define (cube x)
        (* x x x))

(define (sum f next a b)
    (if (> a b) 0
        (+ (f a) (sum f next (next a) b))))

(define (integral f a b dx)
    (define (add-x x) (+ x dx))
    (* (sum f add-x (+ a (/ dx 2.0)) b) dx))

(define (simpson f a b n)
        (define h (/ (- b a) n))
        (define (p i) (cond ((or (= i 0) (= i n)) 1) ((= 1 (remainder i 2)) 4) (else 2)))
        (define (term k) (* (p k) (f (+ a (* h k)))))
        (* (/ h 3.0) (sum term inc 0 n)))
