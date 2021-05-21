(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define prime-tests 100)

(define (start-prime-test n start-time)
  (if (fast-prime? n prime-tests)
      (report-prime (- (runtime) 
                       start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  #t)

(timed-prime-test 10000000019)
;10000000019 *** 1.0000000000000002e-2
(timed-prime-test 10000000033)
;10000000033 *** 1.9999999999999997e-2
(timed-prime-test 10000000061)
;10000000061 *** 1.0000000000000009e-2

(timed-prime-test 100000000003)
;100000000003 *** 9.999999999999995e-3
(timed-prime-test 100000000019)
;100000000019 *** 2.0000000000000004e-2
(timed-prime-test 100000000057)
;100000000057 *** 9.999999999999995e-3

(timed-prime-test 1000000000039)
;1000000000039 *** 3.0000000000000013e-2
(timed-prime-test 1000000000061)
;1000000000061 *** 9.999999999999981e-3
(timed-prime-test 1000000000063)
;1000000000063 *** 2.0000000000000018e-2
