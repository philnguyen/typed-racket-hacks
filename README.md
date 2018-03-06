[![Build Status](https://travis-ci.org/philnguyen/bnf.svg?branch=master)](https://travis-ci.org/philnguyen/bnf) bnf
=========================================

This package provides various work-arounds for Typed Racket.
Some functionalities may get obsolete as the mainstream implementation is improved.

### Install

```
raco pkg install typed-racket-hacks
```

### Current features

#### Typed bindings

```racket
procedure-rename : (∀ (B A ...) (A ... → B) Symbol → (A ... → B))
```
