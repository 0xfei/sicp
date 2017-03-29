(define (make-leaf symbols weight)
  (list 'leaf symbols weight))

(define (leaf? object)
  (eq? 'leaf (car object)))

(define (symbol-leaf object)
  (cadr object))

(define (weight-leaf object)
  (caddr object))

(define (make-code-tree left right)
  (list left
        right
        (append (symbol-leaf left) (symbol-leaf right))
        (+ (weight-leaf left) (weight-leaf right))))

(define (left-branch tree)
  (car tree))

(define (right-branch tree)
  (cadr tree))

(define (symbol tree)
  (if (leaf? tree)
    (symbol-leaf tree)
    (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))


