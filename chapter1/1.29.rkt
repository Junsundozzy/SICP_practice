(define (sum term a next b n count)
  (if (> a b)
      0
      (+ (cond ((or (= count 0) (= count n)) (term a))
               ((odd? count) (* 4 (term a)))
               (else (* 2 (term a))))
         (sum term (next a) next b n (+ 1 count)))))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (add-h x) (+ x h))
  (* (/ h 3) (sum f a add-h b n 0)))

(define (cube x)
  (* x x x))

;better implementation
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral_1 f a b n)
  (define h (/ (- b a) n))
  (define (add-h x) (+ x h h))
  (* (/ h 3)
     (+ (f a)
        (* 4(sum f (+ a h) add-h (- b h)))
        (* 2(sum f (+ a h h) add-h (- b h h)))
        (f b))))

(integral_1 cube 0 1 1000)
  

