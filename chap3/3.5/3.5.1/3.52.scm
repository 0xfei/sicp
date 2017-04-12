(define sum 0)
;0

(define (accum x)
  (set! sum (+ x sum))
  sum)
; + x

(define (output x)
  (newline)
  (display x)
  (display sum))

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
; sum = 1
(output "seq ")

(define y (stream-filter even? seq))
; sum = 1 + 2 + 3 = 6
(output "y ")

(define z (stream-filter (lambda (x) (= (remainder x 5) 0)) seq))
; sum = sum + 4  = 10
(output "z ")

(stream-ref y 7)
; sum = sum + 5 + 6 + 7 + .... 15 = 
(output "y1 ")

(display-stream z)
; sum = 28 + 9 + ... + 20
(output "display ")

