(define (make-count balance password)
  (define error-count 0)
  (define passwords '())
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (error m)
    "wrong password")
  (define (call-110 m)
    "call 110")
  (define (joint p)
    (set! passwords (cons p passwords)))
  (define (in-pass p pass)
    (cond ((null? pass) false)
          ((eq? p (car pass)) true)
          (else (in-pass p (cdr pass)))))
  (define (dispatch p m)
    (if (or (eq? p password) (in-pass p passwords))
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'joint) joint)
            (else "error request"))
      (begin (set! error-count (+ error-count 1))
             (if (= error-count 7)
               call-110
               error))))
  dispatch)

(define (make-joint name oldp newp)
  ((name oldp 'joint) newp))
