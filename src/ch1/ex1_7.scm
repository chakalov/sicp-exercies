(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.00001))

(sqrt 0)
; expected: 0
; actual: 0.001953125

(sqrt (square (/ 1 131071)))
; expected: 0.000007...
; actual: 0.001953...

(sqrt 100000000000000000)
; expected: 316227766.017
; actual: ... it doesn't terminate
; at some point it reaches the value 316227766.01683795, which when squared returns 100000000000000020

; ==== NEW implementation ====

(define (sqrt-iter previous-guess guess x)
  (if (good-enough? previous-guess guess)
      guess
      (sqrt-iter guess (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 0.0 1.0 x))

(define (good-enough? previous-guess guess)
  (< (abs (- previous-guess guess)) 0.00001))

