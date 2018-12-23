;recursion
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (factorial a b)
  (define final (+ a (* b 2)))
  (define (next x) (+ x 2))
  (define (term x) (* x x))
  (* 4 (/ (/ (product term a next final) a final)
          (product term (+ a 1) next (- final 1)))))

;exact->inexact转浮点数
(exact->inexact (factorial 2 100))

；iteration
(define (product term a next b result)
  (if (> a b)
      result
      (product (next a) b (* (term a) result))))

