(define (make-tree left entry right)
  (list left entry right))

(define (entry tree)
  (car tree))

(define (left-tree tree)
  (cadr tree))

(define (right-tree tree)
  (caddr tree))

(define (make-record key data)
  (cons key data))

(define (record-key record)
  (car record))

(define (record-data record)
  (cdr record))

(define (tree->list tree)
  (define (to->list tree result)
    (if (null? tree)
      result
      (let ((node (entry tree))
            (left (left-tree tree))
            (right (right-tree tree)))
        (to->list left (cons node (to->list right result))))))
  (to->list tree '()))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
    (cons '() elts)
    (let ((left-size (quotient (- n 1) 2)))
      (let ((left-result (partial-tree elts left-size)))
        (let ((left-tree (car left-result))
              (non-left-elts (cdr left-result))
              (right-size (- n (+ left-size 1))))
          (let ((this-entry (car non-left-elts))
                (right-result (partial-tree (cdr non-left-elts) right-size)))
            (let ((right-tree (car right-result))
                  (remaining-elts (cdr right-result)))
              (cons (make-tree this-entry left-tree right-tree)
                    remaining-elts))))))))
; o(n)

(define (union-set-tree tree1 tree2)
  (let ((l1 (tree->list tree1))
        (l2 (tree->list tree2)))
    (list->tree (union-set l1 l2))))

