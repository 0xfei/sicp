(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient")))

(define (make-withdraw-it init-amount)
  (let ((balance init-amount))
    (lambda (amount)
      (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient"))))

; (let ((<var><body>)) exp) -> ((lambda (<var>) <body>) <exp>)
; so 'let' will create a new environment, which balance is init-amount at first
; and init-amount is just like previous
; the second make-withdraw-it create one more environment for every call
