(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (identity x) x)

(define (inc n) (+ n 1))

(define (sum-cubes a b)
  (sum cube a inc b))