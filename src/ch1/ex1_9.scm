(define (+ a b)
  (if (= a 0)
      b
      (1+ (+ (-1+ a) b))))

(+ 4 5)
(1+ (+ 3 5))
(1+ (1+ (+ 2 5)))
(1+ (1+ (1+ (+ 1 5))))
(1+ (1+ (1+ (1+ (+ 0 5)))))
(1+ (1+ (1+ (1+ 5))))
(1+ (1+ (1+ 6)))
(1+ (1+ 7))
(1+ 8)
9

; => recursive

(define (+ a b)
  (if (= a 0)
      b
      (+ (-1+ a) (1+ b))))

(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
9

; => iterative