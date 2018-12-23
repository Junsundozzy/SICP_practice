(define (function n)
  (if (< n 3)
      n
      (+ (function (- n 1)) (* (function (- n 2)) 2) (* (function (- n 3)) 3))))

(function 5)
