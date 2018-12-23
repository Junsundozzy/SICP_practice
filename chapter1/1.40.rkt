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

;牛顿法不变！
(define (newtons-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newtons-transform g) guess))

;直接写出要求零点的表达式，用牛顿法（通过求不动点）求！
(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

(define (cube x)
  (* x x x))

(define (square x )
  (* x x))

;最终测试
(newtons-method (cubic 2 5 5) 1.0)