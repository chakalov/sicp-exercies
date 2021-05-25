(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (identity x) x)

(define (inc n) (+ n 1))

(define (factorial n)
  (if (= n 0)
      1
      (product identity 1 inc n)))

(define (pi-approx n)
  (define (f1 k)
    (/ k (+ k 1)))
  (define (f2 k)
    (/ (+ k 1) k))
  (define (inc2 n) (+ n 2))
  (* 4
     (* (product f1 2.0 inc2 (* n 2))
        (product f2 3.0 inc2 (+ (* n 2) 1)))))

(pi-approx 10000000)
;Value: 3.14159273212645