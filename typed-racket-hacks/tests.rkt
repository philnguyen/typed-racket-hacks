#lang typed/racket/base

(require "main.rkt")

(module+ test
  (require (only-in racket/set set seteq)
           typed/rackunit)
  
  (define (id x) x)
  (define id1 (procedure-rename id 'identity))
  (id1 42)

  (define (sec x y) y)
  ((procedure-rename sec 'second) 42 43)

  (check-equal? (for/set : (Setof Integer) ([x '(1 2 3)])
                  (add1 x))
                (set 2 3 4))

  (check-equal? (for*/set : (Setof (Pairof Integer Symbol)) ([x '(1 2 3)]
                                                             [c '(a b)])
                  (cons x c))
                (set '(1 . a) '(1 . b)
                     '(2 . a) '(2 . b)
                     '(3 . a) '(3 . b)))
  
  ;; Get around chaperones from `check-equal?`
  (check-true (equal? (for/seteq : (Setof Integer) ([x '(1 2 3)])
                        (add1 x))
                      (seteq 2 3 4)))

  (check-true (equal? (for*/seteq : (Setof Integer) ([x '(1 2 3)]
                                                     [y '(4 5)])
                        (* x y))
                      (seteq 4 5
                             (* 2 4) (* 2 5)
                             (* 3 4) (* 3 5))))

  (check-equal? (for/first : (Option String) ([i '(1 2 3 "x")]
                                              #:when (and (integer? i) (even? i)))
                  (number->string i))
                "2")
  (check-equal? (for/first : #f ([i '()])
                  (error "doesn't get here"))
                #f)
  )
