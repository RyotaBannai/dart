# Dart notes while playgrounding

### Useful Links

- [samples](https://dart.dev/samples#async)
- [tour](https://dart.dev/guides/language/language-tour)

### General

#### Type

- 変数宣言時に値を代入せず、宣言するだけにした場合、代入する値の方は自由になる(または `dynamic` を使っても型を動的に変えられる)
- dart does `type inference`
  - `type annocations`: it's when you think of "statick types"
  - `generic invocations`: a collection literal, a call to a generic class's constructor, or an invocation of a generic method.
    - Even though they are types, they are `first-class entities` that get reified and passed to the invocation at runtime.
- 一度 `type interence` が行われると、別の type の値をアサインできない
- 変更可能にしたい場合は `dynamic` 修飾子を使う(または Object 型でも対応できる)
- the type is so obvious that writing it is pointless:

```dart
const screenWidth = 640; // Inferred as int
```

- “Obvious” isn’t precisely defined, but these are all good candidates:
  - Literals.
  - `Constructor invocations`.
  - References to other constants that are explicitly typed.
  - Simple expressions on numbers and strings.
  - `Factory methods` like int.parse(), Future.wait(), etc. that readers are expected to be familiar with.
- When in doubt, add a type annotation. Even when a type is obvious, you may still wish to explicitly annotate. If the inferred type relies on values or declarations from other libraries, `you may want to type annotate your declaration so that a change to that other library doesn’t silently change the type of your own API without you realizing`.
- [Good typing guide](https://dart.dev/guides/language/effective-dart/design#types)

- build-in types

```text
numbers
strings
booleans
lists (also known as arrays)
sets
maps
runes (for expressing Unicode characters in a string)
symbols
```

- As of Dart 2.1, integer literals are `automatically converted to doubles` when necessary
- A Dart string is `a sequence of UTF-16 code units`.

#### Other Things

- `var`: 代入が何回でもい可能な変数を定義する時に使う
- Uninitialized variables have an initial value of `null` not `undefined`

> Production code ignores the assert() call. During development, on the other hand, assert(condition) throws an exception if condition is false. For details, see Assert.

- `Final` and `const`: A final variable can be set only once; a const variable is a `compile-time constant`. (`Const` variables are implicitly `final`.): 例えば、final で List 型を宣言できるが、List 型は動的なので const では宣言できない。

```dart
final list = []
// const list = []; error
list.add(2)
print(list) // [2]
```

- [reference](http://jpsepower.sakura.ne.jp/wp/dart%E3%81%AE%E5%A4%89%E6%95%B0%E5%AE%A3%E8%A8%80%EF%BC%88var-final-const%EF%BC%89%E3%81%AE%E9%81%95%E3%81%84/)

> `Instance variables` can be final but not const. `Final instance variables` must be initialized `before` the constructor body starts — at the variable declaration, by a constructor parameter, or in the constructor’s initializer list.

- Use `const` for variables that you want to be `compile-time constants`
- If the const variable `is at the class level`, mark it `static const`
  - Where you declare the variable, set the value to a compile-time constant such as a `number` or `string literal`, `a const variable`, or `the result of an arithmetic operation on constant numbers`
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

> The const keyword isn’t just for declaring constant variables. You can also use it to create constant values, as well as to declare constructors that create constant values. Any variable can have a constant value.
