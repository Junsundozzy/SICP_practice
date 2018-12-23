;iteration Lambert
(define (cont-frac N D k)
  (define (iter-tan i result)
    (let ((term (/ (N i) (+ (D i) result))))
      (if (= i 0)
          result
          (iter-tan (- i 1) term))))
  (iter-tan k 0))

(define (tan-cf x k)
  ;注意N和D的过程定义用的是i还是x
  (define (N i)
    (if (= 1 i)
        x
        (- (* x x))))
  
  (define (D i)
    (- (* i 2) 1))
  
  (exact->inexact (cont-frac N D k)))

(tan-cf 10 1000)
(tan 10)


