(define (iterative-improve good-enough? improve)
  (lambda (first-guess)
    (define (try guess)
      (let ((next (improve guess)))
        (if (good-enough? guess next)
            next
            (try next))))
    (try first-guess)))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  ((iterative-improve close-enough? f) first-guess))

(define (average x y) (/ (+ x y) 2))

(define (sqrt x)
  (fixed-point
   (lambda (y) (average y (/ x y)))
   1.0))

(sqrt 2)
; 1.4142135623746899

(sqrt 16)
; 4.000000000000051