; recursive
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

; iterative
(define (accumulate combiner null-value term a next b)
  (define (iter a accumulator)
    (if (> a b)
        accumulator
        (iter (next a) (combiner accumulator (term a)))))
  (iter a null-value))

(define (product term a next b)
  (accumulate
    (lambda (x y) (* x y)) 1 term a next b))

(define (sum term a next b)
  (accumulate
    (lambda (x y) (+ x y)) 0 term a next b))
