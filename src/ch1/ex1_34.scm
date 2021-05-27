(define (f g) (g 2))

(f square)
(square 2)
(* 2 2)
4

(f (lambda (z) (* z (+ z 1))))
((lambda (z) (* z (+ z 1))) 2)
(* 2 (+ 2 1))
(* 2 3)
6

(f f)
(f 2)
(2 2)
; error: cannot apply 2