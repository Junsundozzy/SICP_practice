(define (fib n)
  (fib-iter 2 1 0 n))

(define (fib-iter a b c n)
  (if (= n 0)
      c
      (fib-iter (+ a (* 2 b) (* 3 c))
                a
                b
                (- n 1))))

