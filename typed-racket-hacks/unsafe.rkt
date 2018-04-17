#lang typed/racket/base

(provide unsafe-cast)

(require typed/racket/unsafe)

(unsafe-require/typed racket/base
  [(values unsafe-values) (∀ (X) (Any → X))])

(define-syntax-rule (unsafe-cast x T) ((inst unsafe-values T) x))
