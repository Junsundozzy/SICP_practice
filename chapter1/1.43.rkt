;recursion
(define (repeated f k)
  (if (= k 1)
      f
      (composed (repeated f (- k 1)) f)))

(define (composed f g)
  (lambda (x) (f (g x))))

(define (square x)
  (* x x))

((repeated square 2) 5)

;iteration
(define (re-iter f k)
  (define (iter k result)
    (if (= k 1)
        result
        (iter (- k 1) (composed f result))))
  (iter k f))

((re-iter square 2) 5)