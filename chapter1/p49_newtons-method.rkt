;求平方根首先要求方程(f1)(lambda (y) (- (square y) x))的零点
;于是应用牛顿法构造迭代等式(- x (/ (g x) ((deriv g) x)))该等式不动点就是f1的零点
;导数过程定义
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx 0.0000001)

(define tolerance 0.001)

;求函数不动点的过程！
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? next guess)
          next
          (try next))))
  (try first-guess))

;牛顿法公式定义！求得是g的零点！构造出f(x)来求（牛顿法公式左边）不动点
(define (newtons-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

;求不动点过程
(define (newtons-method g guess)
  (fixed-point (newtons-transform g) guess))

(define (square x)
  (* x x))

(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))

(sqrt 4)





