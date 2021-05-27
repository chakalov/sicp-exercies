(define (cont-frac n d k)
  (define (iter i acc)
    (if (= i 0)
        acc
        (iter (- i 1) (/ (n i) (+ (d i) acc)))))
  (iter k 0))

(cont-frac (lambda (i) 1.0)
           (lambda (i)
             (if (= (remainder (+ i 1) 3) 0)
                 (* (/ (+ i 1) 3) 2)
                 1.0))
           10)
; Actual:   0.7182817182817183
; Expected: 0.71828182845