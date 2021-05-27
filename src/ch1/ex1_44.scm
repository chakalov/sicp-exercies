(define dx 0.00001)

(define (smooth f)
  (define (average-f f1 f2 f3)
    (lambda (x)
      (/ (+ (f1 x) (f2 x) (f3 x))
         3)))
  (lambda (x)
    ((average-f (lambda (x) (f (- x dx)))
                f
                (lambda (x) (f (+ x dx))))
     x)))

(define (repeated f n)
  (define (repeat-iter i acc)
    (if (= i 0)
        acc
        (repeat-iter (- i 1) (lambda (x) (f (acc x))))))
  (repeat-iter n (lambda (x) x)))

(define (smooth-n f n)
  ((repeated smooth n) f))

((smooth-n square 2) 5)
((smooth-n square 4) 5)