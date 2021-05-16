(define (new-if predicate
                then-clause
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))


; using applicative substitution model
(sqrt 9)

(sqrt-iter 1.0 9)

(new-if (good-enough? 1.0 9)
        1.0
        (sqrt-iter (improve 1.0 9) 9)) ; <-- substitute improve

(new-if (good-enough? 1.0 9)
        1.0
        (sqrt-iter (average 1.0 (/ 9 1.0)) 9))

(new-if (good-enough? 1.0 9)
        1.0
        (sqrt-iter (average 1.0 9.0) 9)) ; <-- subsititute average

(new-if (good-enough? 1.0 9)
        1.0
        (sqrt-iter (/ (+ 1.0 9.0) 2) 9))

(new-if (good-enough? 1.0 9)
        1.0
        (sqrt-iter (/ 10.0 2) 9))

(new-if (good-enough? 1.0 9)
        1.0
        (sqrt-iter 5.0 9)) ; <-- substitute sqrt-iter

(new-if (good-enough? 1.0 9)
        1.0
        (new-if (good-enough? 5.0 9)
                5.0
                (sqrt-iter (improve 5.0 9) 9))) ; <-- substitution continues
; infinite recursion as nothing will stop the substitution

