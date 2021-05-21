; recursive
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

; iterative
(define (f n)
  (f-iter 2 1 0 n))

(define (f-iter fa fb fc n)
  (if (= n 0)
      fc
      (f-iter (+ fa (* 2 fb) (* 3 fc))
              fa
              fb
              (- n 1))))