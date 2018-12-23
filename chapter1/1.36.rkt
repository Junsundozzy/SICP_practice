(define tolerance 0.001)

(define (fix-point f first-guess)
  ;判断误差
  (define (close-enough? x y)
    (< (abs (- x y)) tolerance))
  
  (define (try guess step)
    (display-info guess step)
    ;平均阻尼
    (let ((next (/ (+ guess (f guess)) 2)))
      (if (close-enough? guess next)
         ;多条语句执行
          (begin
            ;最后一步
            (display-info next (+ 1 step))   
            next)
          (try next (+ 1 step)))))
  (try first-guess 1))

(define (display-info guess step)
    (display "Step: ")
    (display step)
    (display " ")
    
    (display "Guess: ")
    (display guess)
    (newline))

(fix-point (lambda (x) (/ (log 1000) (log x))) 2.0)

