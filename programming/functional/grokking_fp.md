# Functional Programming
(As seen in "Grokking Functional Programming" by Michał Płachta)

## Learning Functional Programming
* If the signature alone is enough to understand what's going on inside the box,\
  it is a big win for the programmers who read the code because they don't need\
  to go inside and analyze how it's implemented before they use it.
  > In FP, we tend to focus more on signatures than bodies of functions we use.

* We will focus on functions that don't lie. We want their signatures to tell the\
  whole story about the body. You will learn how to build real-world programs\
  using only these kinds of functions.
  > Functions that don’t lie are very important features of FP.

    * _Imperative_ programming focuses on how the result should be computed. It is\
      all about defining specific steps in a specific order. We achieve the final\
      result by providing a detailed step-by-step algorithm.

    * The _declarative_ approach focuses on what needs to be done, not how. Using a\
      noun makes our brain switch into the declarative mode and focus on what\
      needs to be done rather than the details of how to achieve it.

    * Declarative code is usually more succinct and more comprehensible than\
      imperative code. Even though many internals, like the JVM or CPUs, are\
      strongly imperative, we, as application developers, can heavily use the\
      declarative approach and hide imperative internals.

        * E.g. SQL is _mostly_ a declarative language. You usually state what data\
          you need, and you don't really care how it's fetched.

> In FP, we focus on what needs to happen more often than how it should happen.\
* Signatures that don't lie
* Bodies that are as declarative as possible


## Pure Functions
* These are the foundation of functional programming. These are the most trustworthy\
  of all the functions that don't lie.

* In FP, we pass and return copies of the actual data. This can lead sometimes to\
  the need of recalculate certain condition rather than using a global state storage,\
  trading a corner-case performance issue for readability and maintainability.

* The closer we are of not requiring to store a `state` and relying only on the features\
  provided by the language we work with, the closer we are of a pure functional solution.\
  E.g. We go from:\
  ```java
  class ShoppingCart {
    private List<String> items = new ArrayList<>();

    public void addItem(String item) {
      items.add(item);
    }

    public int getDiscountPercentage() {
      if(items.contains("Book")) {
        return 5;
      } else {
        return 0;
      }
    }

    public List<String> getItems() {
      return new ArrayList<>(items);
    }

    public void removeItem(String item) {
      items.remove(item);
    }
  }
  ```

  To just:\
  ```java
  class ShoppingCart {
    public static int getDiscountPercentage(List<String> items) {
      if(items.contains("Book")) {
        return 5;
      } else {
        return 0;
      }
    }
  }
  ```

  This example relies on the fact that any `list`-like class can provide the `add`,\
  `remove` and `get` functionality and we just allow it to be _passed_ to the\
  `getDiscountPercentage` method (adding `static` to the method makes it so that it
  doesn't need any instance to be useful).

> When each piece of code has its own responsibility and is concerned only about it,\
  we call it **separation of concerns**.

* _Pure_ functions follow these three rules:\
  1. The function always return a single value
  2. The function calculates the return value based _only_ in the arguments it received.
  3. The function never mutates any of the existing values (it can however, _create_\
     new ones.

> Pure functions in programming are inspired by mathematical functions, which are always\
  pure. Pure functions are the foundation of functional programming.

* Programming languages are more elastic than math, this leads to _impure_\
  implementations, so we need to stick to the _three rules_.

* **Single Responsibility**: When a function can do only one thing. Its only observable\
  result is the value it returns and has no side effects.
