(define (new-table) (list 'table (cons '() '()) (cons '() '())))
(define (is-table? t) (and (pair? t) (eq? 'table (car t))))

(define (get-kv t) (cadr t))
(define (get-key t) (car (get-kv t)))
(define (get-value t) (cdr (get-kv t)))
(define (set-key! t k) (set-car! (get-kv t) k))
(define (set-value! t v) (set-cdr! (get-kv t) v))

(define (get-sons t) (caddr t))
(define (get-lson t) (car (get-sons t)))
(define (get-rson t) (cdr (get-sons t)))
(define (set-lson! t l) (set-car! (get-sons t) l))
(define (set-rson! t r) (set-cdr! (get-sons t) r))

(define (empty? t) (and (is-table? t) (null? (get-key t))))

(define (insert table k v)
  (let ((key (get-key table))
        (lson (get-lson table))
        (rson (get-rson table)))
    (cond ((null? key) (set-key! table k) (set-value! table v))
          ((string=? key k) 
           (set-value! table v))
          ((string>? key k)
           (if (null? lson) (set-lson! table (new-table)))
           (insert (get-lson table) k v))
          (else 
            (if (null? rson) (set-rson! table (new-table)))
            (insert (get-rson table) k v))))
  table)

(define (lookup table k)
  (let ((key (get-key table)))
    (cond ((null? key) '())
          ((string=? key k) (get-value table))
          ((string>? key k) (lookup (get-lson table) k))
          (else (lookup (get-rson table) k)))))

