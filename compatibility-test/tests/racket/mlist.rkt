#lang racket/base
(require compatibility/mlist)
(require rackunit
        "mlist.rkt")

; mandmap tests
(define all-integers (mlist 3 24 6 66))
(define all-strings (mlist "green" "wind" "4"))

(check-equal? (mandmap integer? all-integers) #t)
(check-equal? (mandmap string? all-strings) #t)
(check-equal? (mandmap integer? all-strings) #f)
(check-equal? (mandmap string? all-integers) #f)


; mormap tests
(define single-integer (mlist "i" 'one 9 "umbrella"))
(define no-integer (mlist "i" 'one "umbrella"))
(define single-string (mlist '1L 0 7 "match"))
(define no-string (mlist '1L 0 7))
  
(check-equal? (mormap integer? single-integer) #t)
(check-equal? (mormap integer? all-integers) #t)
(check-equal? (mormap integer? no-integer) #f)
(check-equal? (mormap string? single-string) #t)
(check-equal? (mormap string? all-strings) #t)
(check-equal? (mormap string? no-string) #f)


; mremw tests
(define contains-2 (mlist "u" 'twenty 2 88))
(define no-2 (mlist "u" 'twenty 88))
(define contains-hibiscus (mlist "hibiscus" "daffodil" "tulip"))
(define no-hibiscus (mlist "daffodil" "tulip"))

(check-equal? (mremw 2 contains-2) no-2)
(check-equal? (mremw "hibiscus" contains-hibiscus) no-hibiscus)
