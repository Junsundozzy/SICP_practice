(define (count-primes n count)
  (cond ((= count 0)
        (display "are primes"))
        ((prime? n)
         (display n)
         (newline)
         (count-primes (next-odd n) (- count 1)))
        (else (count-primes (next-odd n) count))))

(define (next-odd n)
  (if (even? n)
      (+ 1 n)
      (+ 2 n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square n)
  (* n n))

(count-primes 1000 3)

