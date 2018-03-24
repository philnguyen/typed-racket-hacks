#lang typed/racket/base

(require typed/racket/unsafe
         racket/set
         set-extras
         (for-syntax racket/base
                     racket/syntax
                     syntax/parse))

(unsafe-require/typed/provide racket/base
  [procedure-rename (∀ (B A ...) (A ... → B) Symbol → (A ... → B))])

(provide
 ;; TR for some reason only have obsolete names for set comprehensions
 (rename-out [for/set: for/set]
             [for*/set: for*/set])
 ;; Missing these for some reasons
 for/seteq
 for*/seteq
 (rename-out [-for*/or for*/or]
             [-for*/and for*/and]
             [-for*/first for*/first]
             [-for/first for/first]))

(define-syntax-rule (make-form name fold-form)
  (define-syntax name
    (syntax-rules (:)
      [(_ : T (for-clauses (... ...)) body (... ...))
       (fold-form ([acc : T ∅eq]) (for-clauses (... ...))
         (set-add acc (let () body (... ...))))])))

(make-form for/seteq for/fold)
(make-form for*/seteq for*/fold)

;; Can't really do for*/or in TR despite annotations for some reason
(define-syntax -for*/or
  (syntax-parser
    [(_ (~optional (~seq (~literal :) T) #:defaults ([T #'Boolean]))
        (for-clauses ...) body ...)
     #'(for*/fold ([acc : T #f]) (for-clauses ...)
         (or acc (let () body ...)))]))
(define-syntax -for*/and
  (syntax-parser
    [(_ (~optional (~seq (~literal :) T) #:defaults ([T #'Boolean]))
        (for-clauses ...) body ...)
     #'(for*/fold ([acc : T #t]) (for-clauses ...)
         (and acc (let () body ...)))]))
(define-syntax -for*/first
  (syntax-rules (:)
    [(_ : T (for-clauses ...) body ...)
     (for*/fold ([acc : T #f]) (for-clauses ...)
       #:final #t
       body ...)]))
(define-syntax -for/first
  (syntax-rules (:)
    [(_ : T (for-clauses ...) body ...)
     (for/fold ([acc : T #f]) (for-clauses ...)
       #:final #t
       body ...)]))
