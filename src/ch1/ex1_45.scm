(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display next)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x)
    (average x (f x))))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (repeated f n)
  (define (repeat-iter i acc)
    (if (= i 0)
        acc
        (repeat-iter (- i 1) (lambda (x) (f (acc x))))))
  (repeat-iter n (lambda (x) x)))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (define (fast-expt-iter a b n)
    (cond ((= n 0)
           a)
          ((even? n)
           (fast-expt-iter a (square b) (/ n 2)))
          (else
           (fast-expt-iter (* a b) b (- n 1)))))
  (fast-expt-iter 1 b n))

(define (nth-root x n)
  (fixed-point-of-transform
    (lambda (y) (/ x (fast-expt y (- n 1))))
    (repeated average-damp (floor (/ (log n) (log 2))))
    1.0))

(nth-root 2 2)
; 1.4142135623746899

(nth-root 2 3)
; 1.259923236422975

(nth-root 2 4)
; 1.189207115002721

(nth-root 2 6)
; 1.1224648393618204

(nth-root 2 8)
; 1.090507732665258

(nth-root 2 9)
; 1.0800601441048037

(nth-root 2 10)
; 1.0717742428174573

(nth-root 2 12)
; 1.059461368044972

(nth-root 2 16)
; 1.0442737824274142

(nth-root 3 32)
; 1.034927767079865