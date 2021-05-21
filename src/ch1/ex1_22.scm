(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) 
                       start-time))
      #f))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  #t)

(define (smallest-divisor n)
  (find-devisor n 2))

(define (find-devisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-devisor
               n
               (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes from n)
  (cond ((= n 0) (display " DONE "))
        ((timed-prime-test from)
         (search-for-primes
          (+ from 1)
          (- n 1)))
        (else
         (search-for-primes
          (+ from 1)
          n))))

(search-for-primes 1000 3)
;1009 *** 0.
;1013 *** 0.
;1019 *** 0.

(search-for-primes 10000 3)
;10007 *** 0.
;10009 *** 0.
;10037 *** 0.

(search-for-primes 100000 3)
;100003 *** 0.
;100019 *** 0.
;100043 *** 0.

(search-for-primes 1000000 3)
;1000003 *** 0.
;1000033 *** 0.
;1000037 *** 9.999999999999995e-3

(search-for-primes 10000000000 3)
;10000000019 *** .07999999999999999
;10000000033 *** .07
;10000000061 *** .07

(search-for-primes 100000000000 3)
;100000000003 *** .23999999999999994
;100000000019 *** .2300000000000001
;100000000057 *** .28

(search-for-primes 1000000000000 3)
;1000000000039 *** .8199999999999998
;1000000000061 *** .6999999999999997
;1000000000063 *** .71