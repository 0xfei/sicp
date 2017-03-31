(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-poly variable term-list)
  (cons variable term-list))

(define (variable p) (car p))

(define (term-list p) (cdr p))

(define (add-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
    (make-poly (variable p1)
               (add-terms (term-list p1)
                          (term-list p2)))
    (error "not same variable")))

(define (mul-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
    (make-poly (variable p1)
               (mul-terms (term-list p1)
                          (term-list p2)))
    (error "not same variable")))

; implement
(define (add-terms L1 L2)
  (cond ((empty-termlist? L1) L2)
        ((empty-termlist? L2) L1)
        (else
          (let ((t1 (first-term L1))
                (t2 (first-term L2)))
            (cond ((> (order t1) (order t2))
                   (adjoin-term t1 (add-terms (rest-terms L1) L2)))
                  ((< (order t1) (order t2))
                   (adjoin-term t2 (add-terms L1 (rest-terms L2))))
                  (else
                    (adjoin-term
                      (make-term (order t1) (add (coeff t1) (coeff t2)))
                      (add-terms (rest-terms L1) (rest-terms L2)))))))))

(define (mul-terms L1 L2)
  (if (empty-termlist? L1)
    (the-empty-termlist)
    (add-terms (mul-term-by-all-terms (first-term L1) L2)
               (mul-terms (rest-terms L1) L2))))

(define (mul-term-by-all-terms t1 L)
  (if (empty-termlist? L)
    (the-empty-termlist)
    (let ((t2 (first-term L)))
      (adjoin-term
        (make-term (+ (order t1) (order t2))
                   (mul (coeff t1) (coeff t2)))
        (mul-term-by-all-terms t1 (rest-terms L))))))

; poly struct
(define (adjoin-term term t-list)
  (if (=zero? (coeff term))
    t-list
    (cons term t-list)))

(define (the-empty-termlist) '())
(define (first-term t-list) (car t-list))
(define (rest-terms t-list) (cdr t-list))
(define (empty-termlist? l) (null? t))
(define (make-term order coeff) (list order coeff))
(define (order term) (car term))
(define (coeff term) (cadr term))

(define (=zero? coe)
  (if (and (number? coe) (= coe 0))
    true
    false))

;install
(define (attach-tag tag contents)
  (cons tag contents))

(define (tag p) (attach-tag 'poly p))

(define (install-poly)
  (put 'add '(poly poly)
       (lambda (p1 p2) (tag (add-poly p1 p2))))
  (put 'mul '(poly poly)
       (lambda (p1 p2) (tag (mul-poly p1 p2))))
  (put 'make 'poly
       (lambda (var terms) (tag (make-poly var terms))))
  'done)

