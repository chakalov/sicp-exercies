; recursive
(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b)
           null-value)
        ((filter a)
           (combiner (term a)
                     (filtered-accumulate combiner null-value term (next a) next b filter)))
        (else
          (filtered-accumulate combiner null-value term (next a) next b filter))))

; iterative
(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a accumulator)
    (cond ((> a b) accumulator)
          ((filter a) (iter (next a) (combiner accumulator (term a))))
          (else (iter (next a) accumulator))))
  (iter a null-value))

(define (sum-squared-primes a b)
  (filtered-accumulate + 0 square a (lambda (x) (+ x 1)) b prime?))

(define (product-rel-prime-n n)
  (filtered-accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n (lambda (x) (= (gcd x n) 1))))
