#lang typed/racket/base

(require typed/racket/unsafe
         racket/set
         set-extras)

(unsafe-require/typed/provide racket/base
  [procedure-rename (∀ (B A ...) (A ... → B) Symbol → (A ... → B))])

(provide
 ;; TR for some reason only have obsolete names for set comprehensions
 (rename-out [for/set: for/set]
             [for*/set: for*/set])
 ;; Missing these for some reasons
 for/seteq
 for*/seteq)

(define-syntax-rule (make-form name fold-form)
  (define-syntax name
    (syntax-rules (:)
      [(_ : T (for-clauses (... ...)) body (... ...))
       (fold-form ([acc : T ∅eq]) (for-clauses (... ...))
         (set-add acc (let () body (... ...))))])))

(make-form for/seteq for/fold)
(make-form for*/seteq for*/fold)
