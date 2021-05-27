(define (repeated f n)
  (define (repeat-iter i acc)
    (if (= i 0)
        acc
        (repeat-iter (- i 1) (lambda (x) (f (acc x))))))
  (repeat-iter n (lambda (x) x)))

((repeated square 2) 5)

((repeated square 3) 5)