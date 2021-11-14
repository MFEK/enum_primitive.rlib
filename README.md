# enum\_primitive [![Build Status](https://travis-ci.org/MFEK/enum_primitive.rlib.svg?branch=master)](https://travis-ci.org/MFEK/enum_primitive.rlib)

This crate exports a macro `enum_from_primitive!` that wraps an
`enum` declaration and automatically adds an implementation of
`num::FromPrimitive` (reexported here), to allow conversion from
primitive integers to the enum.  It therefore provides an
alternative to the built-in `#[derive(FromPrimitive)]`, which
requires the unstable `std::num::FromPrimitive` and is disabled in
Rust 1.0.

Note: This is the MFEK fork, the original author Anders Kaseorg abandoned the
project without a maintainer in 2017.

## Documentation

[https://mfek.org/enum\_primitive-rs/enum\_primitive/](https://mfek.org/enum_primitive.rlib/enum_primitive/)

## Usage

Add the following to your `Cargo.toml` file:

```
[dependencies]
enum_primitive = "*"
```

Import the crate using `#[macro_use] extern crate enum_primitive`, and
wrap your `enum` declaration inside the `enum_from_primitive!` macro.

## Example

```rust
#[macro_use] extern crate enum_primitive;
use enum_primitive::FromPrimitive;

enum_from_primitive! {
#[derive(Debug, PartialEq)]
enum FooBar {
    Foo = 17,
    Bar = 42,
    Baz,
}
}

fn main() {
    assert_eq!(FooBar::from_i32(17), Some(FooBar::Foo));
    assert_eq!(FooBar::from_i32(42), Some(FooBar::Bar));
    assert_eq!(FooBar::from_i32(43), Some(FooBar::Baz));
    assert_eq!(FooBar::from_i32(91), None);
}
```
