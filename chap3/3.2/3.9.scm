(define (factorial n)
  (if (= n 1)
    1
    (* n (factorial (- n 1)))))
; Global: (factorial 6)
; Env1: n->6 * 6 (factorial 5)
; Env2: n->5 * 5 (factorial 4)
; ...
; Env6: n->1 1

(define (factorial-it n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
    product
    (fact-iter (* counter product)
               (+ counter 1)
               max-count)))
; Global: (factorial-it 6)
; Env1: n = 6 fact-iter 1 1 6
; Env2: product=1 counter=1 max-count=6 fact-iter * counter product
; Env3: * counter product
; Env4: + counter 1
