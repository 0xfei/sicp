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
        (append (symbol left) (symbol right))
        (+ (weight left) (weight right))))

(define (left-branch tree)
  (car tree))

(define (right-branch tree)
  (cadr tree))

(define (symbol tree)
  (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- " bit))))

(define (symbol-exist? c l)
  (cond ((null? l) false)
        ((eq? c (car l)) true)
        (else (symbol-exist? c (cdr l)))))

(define (encode-symbol c tree)
  (if (symbol-exist? c (symbol tree))
    (if (leaf? tree)
      '()
      (let ((left (left-branch tree))
            (right (right-branch tree)))
        (if (symbol-exist? c (symbol left))
          (cons 0 (encode-symbol c left))
          (cons 1 (encode-symbol c right)))))
    (error "bad char -- " c)))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

(define (make-leaf-sets pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair) (cadr pair))
                  (make-leaf-sets (cdr pairs))))))

(define (find-lowest trees)
  (define (do-find right left)
    (if (null? left)
      right
      (let ((a (car right))
            (la (cdr right))
            (b (car left))
            (lb (cdr left)))
        (if (< (weight b) (weight a))
          (do-find (cons b (cons a la)) lb)
          (do-find (cons a (cons b la)) lb)))))
  (do-find (list (car trees)) (cdr trees)))

(define (addjoin-tree t trees)
  (if (null? trees)
    (list t)
    (let ((w1 (weight t)))
      (let ((wh (weight (car trees))))
        (if (> w1 wh)
          (cons (car trees) (addjoin-tree t (cdr trees)))
          (cons t trees))))))

(define (successive-merge leafs)
  (if (eq? (cdr leafs) '())
    (car leafs)
    (let ((h1 (car leafs))
          (h2 (cadr leafs)))
      (successive-merge (addjoin-tree
                          (make-code-tree h1 h2)
                          (cddr leafs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-sets pairs)))

(define (decode bits tree)
  (define (do-decode bits current-branch)
    (if (null? bits)
      '()
      (let ((next-branch (choose-branch (car bits) current-branch)))
        (if (leaf? next-branch)
          (cons (symbol-leaf next-branch) (do-decode (cdr bits) tree))
          (do-decode (cdr bits) next-branch)))))
  (do-decode bits tree))

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))

; test
(define tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree 
                    (make-leaf 'B 2)
                    (make-code-tree (make-leaf 'D 1)
                                    (make-leaf 'C 1)))))

(define message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

