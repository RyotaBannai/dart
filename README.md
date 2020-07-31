# Dart notes while playgrounding

### General

#### Type

- dart does `type inference`
- 一度 type interence が行われると、別の type の値をアサインできない
- 変更可能にしたい場合は dynamic 修飾子を使う
- Uninitialized variables have an initial value of `null` not `undefined`
  > Production code ignores the assert() call. During development, on the other hand, assert(condition) throws an exception if condition is false. For details, see Assert.
- Final and const: A final variable can be set only once; a const variable is a compile-time constant. (`Const` variables are implicitly `final`.)
  - `Instance variables` can be final but not const. `Final instance variables` must be initialized `before` the constructor body starts — at the variable declaration, by a constructor parameter, or in the constructor’s initializer list.
