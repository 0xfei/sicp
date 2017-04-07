(define (make-queue head tail) (cons head tail))
(define (get-head queue) (car queue))
(define (get-tail queue) (cdr queue))
(define (set-head! queue head) (set-car! queue head))
(define (set-tail! queue tail) (set-cdr! queue tail))
(define (is-empty? queue) (null? (get-head queue)))


(define (new-queue) (make-queue '() '()))

(define (front queue)
  (if (is-empty? queue)
    '()
    (car (get-head queue))))

(define (end queue)
  (if (is-empty? queue)
    '()
    (car (get-tail queue))))

(define (insert queue data)
  (let ((item (cons data '())))
    (cond ((is-empty? queue) 
           (set-head! queue item)
           (set-tail! queue item)
           queue)
          (else 
            (set-cdr! (get-tail queue) item)
            (set-tail! queue item)
            queue))))

(define (delete queue)
  (if (is-empty? queue)
    queue
    (begin (set-head! queue (cdr (get-head queue))) queue)))

(define (q->l q)
  (define (i->l l)
    (if (null? l)
      '()
      (cons (car l) (i->l (cdr l)))))
  (i->l (car q)))

