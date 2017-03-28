(define (adjoin-set x set)
 (cond ((null? set) (list x))
	   ((= x (car set)) set)
	   ((< x (car set)) (cons x set))
	   (else (cons (car set) (adjoin-set x (cdr set))))))


(define (union-set set1 set2)
 (cond ((null? set1) set2)
	   ((null? set2) set1)
	   (else (let ((s1 (car set1))
				   (s2 (car set2))
				   (d1 (cdr set1))
				   (d2 (cdr set2)))
			  (cond ((= s1 s2) (cons s1 (union-set d1 d2)))
				    ((< s1 s2) (cons s1 (union-set d1 set2)))
					(else (cons s2 (union-set set1 d2))))))))

