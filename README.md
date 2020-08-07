# Dart notes while playgrounding

### Useful Links

- [tour](https://dart.dev/guides/language/language-tour)

### General

#### Type

- dart does `type inference`
- 一度 type interence が行われると、別の type の値をアサインできない
- 変更可能にしたい場合は `dynamic` 修飾子を使う
- Uninitialized variables have an initial value of `null` not `undefined`
  > Production code ignores the assert() call. During development, on the other hand, assert(condition) throws an exception if condition is false. For details, see Assert.
- `Final` and `const`: A final variable can be set only once; a const variable is a compile-time constant. (`Const` variables are implicitly `final`.)
  - `Instance variables` can be final but not const. `Final instance variables` must be initialized `before` the constructor body starts — at the variable declaration, by a constructor parameter, or in the constructor’s initializer list.
- Use `const` for variables that you want to be `compile-time constants`
- If the const variable `is at the class level`, mark it `static const`
- `定数式`: すべてのリテラルが当てはまる。次に、そのリテラル同士による計算結果が当てはまる。さらに、「リテラル」もしくは「リテラル同士の計算結果」を格納した `final 変数`も当てはまる。特にこれを「定数変数」と呼ぶ。
- `Compile time constant` must be:
  1. declared `final` (as mentioned above, in dart use const for compile-time constants)
  2. primitive or String
  3. initialized within declaration
  4. initialized with constant expression (`定数式`)
  - THese following examples are not a `compile time constant`
    - `private final int x = getX();` is not constant.
    - `private int y = 10;` is not constant (non-final in this case), so optimizer cannot be sure that the value would not change in the future. `So it cannot optimize it as good as constant value.`
    - `final int a=1;` is a compile time constant but `final int a; a=2;` is not because of the 3rd reason.
  - [ref](https://stackoverflow.com/questions/9082971/compile-time-constants-and-variables)
