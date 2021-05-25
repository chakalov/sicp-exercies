(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpsons-rule f a b n)
  (define (h)
    (/ (- b a) n))
  (define (yk k)
    (f (+ a
          (* k (h)))))
  (define (inc2 k)
    (+ k 2))
  (define (sum-iter from to)
    (sum yk from inc2 to))
  (* (/ (h) 3)
     (+ (yk a)
        (yk b)
        (* (sum-iter 1 (- n 1)) 2)
        (* (sum-iter 2 (- n 1)) 4))))

(simpsons-rule cube 0.0 1.0 100)
; .24338333666666667

(simpsons-rule cube 0.0 1.0 1000)
; .2493338333336668
