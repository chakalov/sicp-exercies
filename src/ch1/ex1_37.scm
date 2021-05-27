(define (cont-frac n d k)
  (define (dive i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i) (dive (+ i 1))))))
  (dive 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)
; Actial:   0.6180555555555556
; Expected: 0.61803398875

(define (cont-frac n d k)
  (define (iter i acc)
    (if (= i 0)
        acc
        (iter (- i 1) (/ (n i) (+ (d i) acc)))))
  (iter k 0))