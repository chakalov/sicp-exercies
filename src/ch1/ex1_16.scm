(define (fast-expt b n)
  (cond ((= n 0)
         1)
        ((even? n)
         (square (fast-expt b (/ n 2))))
        (else
         (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (define (fast-expt-iter a b n)
    (cond ((= n 0)
           a)
          ((even? n)
           (fast-expt-iter a (square b) (/ n 2)))
          (else
           (fast-expt-iter (* a b) b (- n 1)))))
  (fast-expt-iter 1 b n))

;(fast-expt-iter 1 b 15)
;(fast-expt-iter b b 14)
;(fast-expt-iter b b^2 7)
;(fast-expt-iter b^3 b^2 6)
;(fast-expt-iter b^3 b^4 3)
;(fast-expt-iter b^7 b^4 2)
;(fast-expt-iter b^7 b^8 1)
;(fast-expt-iter b^15 b^8 0)
; b^15