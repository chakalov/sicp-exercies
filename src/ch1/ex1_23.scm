(define (smallest-divisor n)
  (find-devisor n 2))

(define (find-devisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-devisor
               n
               (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (prime? n)
  (= n (smallest-divisor n)))

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

(timed-prime-test 10000000019)
; old: .07999999999999999 vs new: .06
(timed-prime-test 10000000033)
; old: .07 vs new: .07
(timed-prime-test 10000000061)
; old: .07 vs new: .06

(timed-prime-test 100000000003)
; old: .23999999999999994 vs new: .15000000000000002
(timed-prime-test 100000000019)
; old: .2300000000000001 vs new: .15000000000000002
(timed-prime-test 100000000057)
; old: .28 vs new: .15000000000000002

(timed-prime-test 1000000000039)
; old: .8199999999999998 vs new: .45999999999999996
(timed-prime-test 1000000000061)
; old: .6999999999999997 vs new: .45999999999999996
(timed-prime-test 1000000000063)
; old: .71 vs new: .4500000000000002
