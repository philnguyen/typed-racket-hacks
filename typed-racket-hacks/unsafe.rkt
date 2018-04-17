#lang typed/racket/base

(provide unsafe-cast
         (rename-out [unsafe-procedure-rename procedure-rename]))

(require typed/racket/unsafe)

(unsafe-require/typed racket/base
  [(values unsafe-values) (∀ (X) (Any → X))])

(define-syntax-rule (unsafe-cast x T) ((inst unsafe-values T) x))
(define unsafe-procedure-rename (unsafe-cast procedure-rename (∀ (B A ...) (A ... → B) Symbol → (A ... → B))))
