;filtered-accumulate(recursion)
(define (filtered-accumulate combine null-value filter term a next b)
      (if (> a b)
          null-value
          (if (filter a)
          (combine (term a)
                   (filtered-accumulate combine null-value filter term (next a) next b))
          (filtered-accumulate combine null-value filter term (next a) next b))))

;GCD
(define (GCD a b)
  (if (= b 0)
      a
      (GCD b (remainder a b))))

;procedure-definition
(define (muPrime-acc n)
  (define (term a) a)
  (define (next a) (+ 1 a))
  (define (mutual-prime? a)
  (and (= (GCD n a) 1) (< a n)))
  (filtered-accumulate * 1 mutual-prime? term 1 next n))

(muPrime-acc 7)

;filtered-accumulate(iteration)
(define (filtered-accumulate combine null-value filter term a next b)
  (define (iter-filt a result)
    (if (> a b)
        result
        (if (filter a)
        (iter-filt (next a) (combine (term a) result))
        (iter-filt (next a) result))))
  (iter-result a null-value))
