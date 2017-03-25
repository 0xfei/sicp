(define (make-mobile left right)
 (list left right))

(define (make-branch length structure)
 (list length structure))

(define (left-branch tree)
 (car tree))

(define (right-branch tree)
 (car (cdr tree)))

(define (branch-length branch)
 (car branch))

(define (branch-structure branch)
 (car (cdr branch)))

(define (branch-weight branch)
 (let ((struct (branch-structure branch)))
  (if (not (pair? struct))
   struct
   (total-weight struct))))

(define (total-weight mobile)
 (let ((left (left-branch mobile))
	   (right (right-branch mobile)))
  (+ (branch-weight left) (branch-weight right))))

