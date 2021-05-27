(define (cont-frac n d k)
  (define (iter i acc)
    (if (= i 0)
        acc
        (iter (- i 1) (/ (n i) (+ (d i) acc)))))
  (iter k 0))

(define (tan-cf x k)
  (/ x
     (+ 1 (cont-frac (lambda (i) (- (square x)))
                     (lambda (i) (+ (* i 2) 1))
                     k))))

(tan-cf 1 10)
; Actual:   1.557407724654902
; Expected: 1.55740772465