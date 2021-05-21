(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; if applicative order
(test 0 (p)) ; substituting test with it's body
(if (= 0 0) 0 (p)) ; perform the test
0 ; is returned since (= 0 0) is true

; if normal order
(test 0 (p)) ; substituting (p) with body of p, i.e. (p)
(test 0 (p)) ; same step as above
;... infinite recursion
