(define (mul-stream a b)
  (cons-stream (* (stream-car a) (stream-car b))
               (mul-stream (stream-cdr a) (stream-cdr b))))

(define factorials (cons-stream 1 (mul-stream 
                                    factorials
                                    (integers-starting-from 2))))

