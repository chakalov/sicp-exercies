(define (pascal r c)
  (cond ((= r 0) 1)
        ((= c 0) 1)
        ((= r c) 1)
        (else (+ (pascal (- r 1) (- c 1))
                 (pascal (- r 1) c)))))
