; depart -> return department
; content -> return record sets
(define (get-record file person)
  ((get 'get-record (depart file)) (content file) person))

; put 'get-salary (get-salary-opts record)
(define (get-salary file person)
  ((get 'get-salary (depart file))
   (get-record file person)))

(define (find-employee-record files person)
  (if (null? files)
    '()
    (cons (get-record (car files) person)
          (find-employee-record (cdr files) person))))

