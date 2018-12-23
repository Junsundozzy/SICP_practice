;iteration cont-frac
(define (cont-frac n d k)
  (define (iter-frac i result)
    (let ((term (/ (n i) (+ (d i) result))))
      (if (= i 0)
        result
        (iter-frac (- i 1) term))))
  (iter-frac k 0))

(define (e k)
    (define (N i)
        1)
    (define (D i)
        (if (= 0 (remainder (+ i 1) 3))
            (* 2 (/ (+ i 1) 3))
            1))
  (+ 2.0
     (cont-frac N D k)))

(e 100)


