(define (make-table same-key?)
  (let ((table '(table)))
    ; is-table
    (define (is-table? t) (eq? 'table (car t)))
    ; empty
    (define (empty?) (null? (cdr table)))
    ; lookup
    (define (lookup k)
      (define (i-lookup k l)
        (cond ((null? l) '())
              ((same-key? k (caar l)) (car l))
              (else (i-lookup k (cdr l)))))
      (i-lookup k (cdr table)))
    ; insert
    (define (insert k v)
      (let ((item (lookup k)))
        (if (null? item)
          (set-cdr! table (cons (cons k v) (cdr table)))
          (set-cdr! item v))
        table))
    ; dispatch
    (define (dispatch m)
      (cond ((eq? m 'lookup) lookup)
            ((eq? m 'insert) insert)
            (else "Error")))
    ; return
    dispatch))

(define table (make-table (lambda (x y) (equal? x y))))
(define get (table 'lookup))
(define set (table 'insert))

