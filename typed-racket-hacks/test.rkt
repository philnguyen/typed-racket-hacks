#lang typed/racket/base

(require "main.rkt")

(module+ test
  (define (id x) x)
  (define id1 (procedure-rename id 'identity))
  (define id2 (cast id1 (Any -> Any)))
  (id2 42))
