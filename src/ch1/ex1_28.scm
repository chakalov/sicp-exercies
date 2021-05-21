(define (expmod-checked base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (let ((x (expmod-checked base (/ exp 2) m)))
         (if (non-trivial-sqrt? x m)
          0
          (remainder (square x) m))))
        (else
         (remainder
          (* base (expmod-checked base (- exp 1) m))
          m))))

(define (non-trivial-sqrt? a n)
  (cond ((= a 1) #f)
        ((= a (- n 1)) #f)
        (else (= (remainder (square a) n) 1))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod-checked a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

;(define (miller-rabin-test n)
;  (define (try-it a)
;    (= (expmod-checked a (- n 1) n) 1))
;  (define (miller-rabin-iter a)
;   (cond ((= a n) #t)
;         ((try-it a) (miller-rabin-iter (+ a 1)))
;         (else #f)))
;  (miller-rabin-iter 2))

; #t
(miller-rabin-test 2)
(miller-rabin-test 173)

; #f
(miller-rabin-test 121)
(miller-rabin-test 1024)

; #f
(miller-rabin-test 561)
(miller-rabin-test 1105)
(miller-rabin-test 1729)
(miller-rabin-test 2465)
(miller-rabin-test 2821)
(miller-rabin-test 6601)