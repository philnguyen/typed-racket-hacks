#lang typed/racket/base

(require typed/racket/unsafe)

(unsafe-require/typed/provide racket/base
  [procedure-rename (∀ (B A ...) (A ... → B) Symbol → (A ... → B))])
