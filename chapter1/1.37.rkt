(define (cont-frac N D k)
    (define (cf i)
        (if (= k i)
            (/ (N k) (D k))
            (/ (N i)
               (+ (D i) (cf (+ i 1))))))
    (cf 1))


(/ 1(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100))
(define (cont-frac N D k)

    (define (iter i result)
        (if (= i 0)
            result
            (iter (- i 1)
                  (/ (N i)
                     (+ (D i) result)))))

    (iter (- k 1)
          (/ (N k) (D k))))

;iteration
(define (cont-frac n d k)
  (define (iter i result)
    (let ((iterm (/ (n i) (+ (d i) result))))
      (if (= i 1)
          iterm
          (iter (- i 1) iterm))))
  (iter k 0))