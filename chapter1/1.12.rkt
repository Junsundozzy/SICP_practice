(define (triangle n m)
  (if (or (= n 1) (= n m) (= m 1))
      1
      (+ (triangle (- n 1) (- m 1)) (triangle (- n 1) m))))
(triangle 5 3)