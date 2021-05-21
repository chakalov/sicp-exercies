(define (mult a b)
  (if (= b 0)
      0
      (+ a (mult a (- b 1)))))

(define (double a) (* 2 a))
(define (halve a) (/ a 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-mult a b)
  (cond ((= a 0)
         0)
        ((even? a)
         (double (fast-mult (halve a) b)))
        (else
         (+ b (fast-mult (- a 1) b)))))
