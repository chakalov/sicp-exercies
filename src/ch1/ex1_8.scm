(define (cube-root-iter previous-guess guess x)
  (if (good-enough? previous-guess guess)
      guess
      (cube-root-iter guess (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess))
        (* 2 guess))
     3))

(define (cube-root x)
  (cube-root-iter 0.0 1.0 x))

(define (good-enough? previous-guess guess)
  (< (abs (- previous-guess guess)) 0.00001))


(cube-root (* 1337 1337 1337.0))