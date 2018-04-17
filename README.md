[![Build Status](https://travis-ci.org/philnguyen/typed-racket-hacks.svg?branch=master)](https://travis-ci.org/philnguyen/typed-racket-hacks) typed-racket-hacks
=========================================

This package provides various work-arounds for Typed Racket.
Some functionalities may get obsolete as the mainstream implementation is improved.

### Install

```
raco pkg install typed-racket-hacks
```

### Current features

#### Typed Bindings

```racket
procedure-rename : (∀ (B A ...) (A ... → B) Symbol → (A ... → B))
```

#### Macros

```racket
for/set  ; renaming of `for/set:`
for*/set ; renaming of `for*/set`
for/seteq
for*/seteq
```

#### Unsafe macros

```racket
(require typed-racket-hacks/unsafe)
(unsafe-cast 42 String) ; ==> 42 : String
```
