(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))


(a-plus-abs-b 1 2)
((if (> 2 0) + -) 1 2)
((if true + -) 1 2)
(+ 1 2)
3

(a-plus-abs-b 1 -2)
((if (> -2 0) + -) 1 -2)
((if false + -) 1 -2)
(- 1 -2)
3