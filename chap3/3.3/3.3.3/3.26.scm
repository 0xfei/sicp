(define (new-table) (list 'table (cons '() '()) (cons '() '())))
(define (is-table? t) (and (pair? t) (eq? 'table (car t))))

(define (get-kv t) (cadr t))
(define (get-key t) (car (get-kv t)))
(define (get-value t) (cdr (get-kv t)))

(define (get-sons t) (caddr t))
(define (get-lson t) (car (get-sons t)))
(define (get-rson t) (cdr (get-sons t)))

