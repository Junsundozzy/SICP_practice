;谓词prime
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divide? n test-divisor) test-divisor)
        (else (find-divisor n (+ 1 test-divisor)))))

(define (divide? a b)
  (= 0 (remainder a b)))

(define (square x)
  (* x x))

(define (prime? n)
  (= (smallest-divisor n) n))

;filtered-accumulate
(define (filtered-accumulate combine null-value filter term a next b)
  (if (filter a)
      (if (> a b)
          null-value
          (combine (term a)
                   (filtered-accumulate combine null-value filter term (next a) next b)))
      (filtered-accumulate combine null-value filter term (next a) next b)))

;procedure-definition
(define (prime-acc a b)
  (define (term a) a)
  (define (next a) (+ a 1))
  (filtered-accumulate + 0 prime? term a next b))

(prime-acc 2 7)