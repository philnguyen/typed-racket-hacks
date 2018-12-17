#lang typed/racket/base

(provide unsafe-cast)

(require typed/racket/unsafe
         (for-syntax racket/base
                     racket/syntax
                     syntax/parse))

(unsafe-require/typed racket/base
  [(values unsafe-values) (∀ (X) (Any → X))])

(define-syntax unsafe-cast
  (syntax-parser
    [(~and stx (_ x T))
     (let ([src (syntax-source #'stx)]
           [line (syntax-line #'stx)]
           [col (syntax-column #'stx)])
       (printf "Warning: unsafe-cast at ~a:~a:~a~n" src line col))
     #'((inst unsafe-values T) x)]))
