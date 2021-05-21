(define (even? n)
  (= (remainder n 2) 0))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0)
         b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))  ;compute p'
                   (+ (square q) (* 2 p q))  ;compute q'
                   (/ count 2)))
        (else
         (fib-iter (+ (* b q)
                      (* a q)
                      (* a p))
                   (+ (* b p)
                      (* a q))
                   p
                   q
                   (- count 1)))))


; a' = bq + aq + ap
; b' = bp + aq
; =>
; a" = b'p + a'q + a'p
; b" = b'p + a'q
; <=>
; a" = (bp + aq)p + (bq + aq + ap)q + (bq + aq + ap)p
; b" = (bp + aq)p + (bq + aq + ap)q
; <=>
; a" = b(p^2 + 2pq) + a(q^2 + 2pq) + a(p^2 + q^2)
; b" = b(p^2 + q^2) + a(q^2 + 2pq)
; =>
; p' = p^2 + q^2
; q' = q^2 + 2pq