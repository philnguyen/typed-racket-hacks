#lang typed/racket/base

(require "main.rkt")

(module+ test
  (define (id x) x)
  (define id1 (procedure-rename id 'identity))
  (id1 42)

  (define (sec x y) y)
  ((procedure-rename sec 'second) 42 43))
