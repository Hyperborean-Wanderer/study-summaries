# Professional C++
(As seen in "Professional C++, 5th Edition" by Marc Gregoire)

## A Crash Course in C++ and the Standard Library

This chapter aims to cover the parts of C++ that programmers encounter every day. Some
compilers support _C++20 modules_ already, some not. As for my current installation of
`GCC-12` on a Debian box (actually, just WSL), in order to compile code with modules
(code with headers like `import <module>;` rather than `#include <library>`) it's a
two-step process (or just use the `#include` form):
```
First the library module needs to be cached with:
g++ -std=c++20 -fmodules-ts -xc++-system-header iostream
# (repeat for every library, like vector, limits, etc.)

And then:
g++ -std=c++20 -fmodules-ts -o Ex1_01 Ex1_01.cpp
```

### Comments
Are made with `//` (run until the end of the line) or with everything between `/*` and
`*/`.

### Modules
Replacements to old _header files_. All Standard Library is now present as modules in
C++20, programmers can also create custom modules. If compiler doesn't support modules
yet, use `#include` rather than `import` statements.

### Preprocessor Directives
Before _compilation_ (and _linking_), the preprocessor recognizes meta-information about
the code. Most commonly (with `#include`), we declare functions whose definition is
elsewhere. A _declaration_ tells how a function is called, how many parameters it has and
its types, and what type of data it will return, typically in files with `.h` extension,
known as _header_ files. The _definition_ contains the actual code of the function,
typically in files with `.cpp` extension, known as _source_ files.

> **Note:** Files from _C_ Standard Library, like `stdio.h` don't use _namespaces_, C++'s
do, everything is defined within the `std` one or one subnamespace of it.\\
    Old _C_ headers can be included either with _e.g._ `<cstdio>` or as `<stdio.h>`.
    These are not guaranteed to be supported by `import`, best to use with `#include`.

Most common preprocessor directives:
| Directive | Function |
| --- | --- |
| `#include [file]` | File is inserted where the directive. Include header files. |
| `#define [id] [value]` | All occurrences of the id are replaced by value, used to declare constants and macros. |
| `ifdef [id]`<br>`#endif`<br><br>`ifndef [id]`<br>`#endif` | Code between is conditionally included or ommitted depending on if it has been already `#define`d. Protect agains circular/multiple includes. |
| `#pragma [xyz]` | Compiler implementations, a common one is `once`, which can replace `#ifdef`/`#ifndef` blocks. |

### `main()` function
Where program starts, must return an `int` but if ommitted, it automatically returns a
zero. Can take zero or two parameters as with:
```cpp
int main(int argc, char* argv[]) // Number of arguments, and arguments
```
**Note:** `argv[0]` can or cannot be the program name, do not rely on it, use platform's
own capabilities for it, **actual** arguments start at index 1.

### I/O Streams
Like "laundry" chutes for data. `std::cout` is _standard out_, like the user console,
`std::cerr` is the _error_ chute. `<<` throws the data into the chute. Output streams can
send data of different types sequentially, like in:
```cpp
std::cout << "There are " << 219 << " was I love you." << std::endl;
```
As of C++20, it's recommended to use `std::format()` (from `<format>`), like in:
```cpp
std::cout << std::format("There are {} was I love you.", 219) << std::endl;
```

> **Note:** If `std::format()` is not supported yet, library [fmt](https://fmt.dev/latest/index.html) is available, like with `fmt::format()`

`std::endl` represents a end of line (flushes buffers immediately, which can impact
performance if used repeteadly, like in loops), this can be replaced by `\n` (doesn't
flush automatically), which is known as a _escape sequence_, other common ones are `\r`,
`\t`, `\\` and `\"`.

`std::cin` represents the input stream, which uses `>>` to chute the data into it. This
can be tricky as we need to control the kind of data entered by the user. Usage of
stream libraries is preferred as old `printf()` and `scanf()` don't provide type safety.

### Namespaces
Are used to address the naming conflicts between different code pieces. Like if we create
a `foo()` function and then use a library which also includes a `foo()` function. We use
the `::` _scope resolution operator_ to correctly call them. Namespaces are created with
`namespace name{ ... functions and definitions ... }`.

Code within a namespace can reach other code within the same namespace without needing it
to prepend the namespace name. Avoid prepending functions with namespace names with
`using namespace [name];`, beware of overusing it, marking every possible `using` can
return the name conflicts back.

We can also prefer just a particular function within a namespace like with
`using std::cout;`, while keeping the need of explicitly using the full name with `::`
in the code.

It is not recommended to put a `using` directive at global space, if done, it forces
it to be used by everyone who includes our code. Rather, put it in a smaller scope like
for a class or interface.

#### Nested Namespace
Just as the name calls it... from C++17 on, shorcut `namespace NOne::NTwo::NThree { ... }`
is available, former to C++17 we need to:
```cpp
namespace NOne {
    namespace NTwo {
        namespace NThree {
            ...
        }
    }
}
```

#### Namespace Alias
Give new, possible shorter name to other namespace: `namespace NThree = NOne::NTwo::NThree;`

### Literals
Different options to specify numbers, no prefix are decimal numbers, `0` prefix _Octal_
numbers, `0x` does for _Hexadecimal_ and `0b` for _Binary_.

Decimal numbers are _double_ precision, postfix with `f` to mark them _float_. Floating
point can also be expressed with _Hexadecimal_ like `0x3.ABCp-10` or `0Xb.cp121`.

Strings are zero-terminated arrays like in `"array of chars"`, single chars are `'a'`.

Custom types will be reviewed later. Digits on large numbers can be made more visible
with single quotes like `23'456'789` or `0.123'456f`.

### Variables
Can be declared and used almost anywhere, for using them, this can be under the line they
were declared. If no value given, they end with semi-random value from memory.
