(define (double a) (* 2 a))
(define (halve a) (/ a 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-mult-iter acc a b)
  (cond ((= a 0)
         acc)
        ((even? a)
         (fast-mult-iter acc (halve a) (double b)))
        (else
         (fast-mult-iter (+ acc b) (- a 1) b))))

;(fast-mult-iter 0 5 5)
;(fast-mult-iter 5 4 5)
;(fast-mult-iter 5 2 10)
;(fast-mult-iter 5 1 20)
;(fast-mult-iter 25 0 20)
;25

(define (fast-mult a b)
  (fast-mult-iter 0 a b))