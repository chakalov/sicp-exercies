(define (inc x) (+ x 1))

(define (double f)
  (lambda (x)
    (f (f x))))

(((double (double double)) inc) 5)
; 21

; g = double
(double (double g))
(double (g g))
((g g) (g g))
; =>
((double double) (double double))
; =>
(((double double) (double double)) inc)
(((double double) (double double) inc))
(((double double) (double (double inc))))
(((double (double (double (double inc))))))
; + x 16

