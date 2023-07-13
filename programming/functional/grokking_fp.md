# Functional Programming
(As seen in "Grokking Functional Programming" by Michał Płachta)

## Learning Functional Programming
* If the signature alone is enough to understand what's going on inside the box,\
  it is a big win for the programmers who read the code because they don't need\
  to go inside and analyze how it's implemented before they use it.\
  THIS IS BIG!\
  In FP, we tend to focus more on signatures than bodies of functions we use.

* We will focus on functions that don't lie. We want their signatures to tell the\
  whole story about the body. You will learn how to build real-world programs\
  using only these kinds of functions.\
  THIS IS BIG!\
  Functions that don’t lie are very important features of FP.

    * Imperative programming focuses on how the result should be computed. It is\
      all about defining specific steps in a specific order. We achieve the final\
      result by providing a detailed step-by-step algorithm.

    * The declarative approach focuses on what needs to be done—not how. Using a\
      noun makes our brain switch into the declarative mode and focus on what\
      needs to be done rather than the details of how to achieve it.

    * Declarative code is usually more succinct and more comprehensible than\
      imperative code. Even though many internals, like the JVM or CPUs, are\
      strongly imperative, we, as application developers, can heavily use the\
      declarative approach and hide imperative internals.

        * SQL is also a mostly declarative language. You usually state what data\
          you need, and you don't really care how it's fetched.

* THIS IS BIG!\
  In FP, we focus on what needs to happen more often than how it should happen.

    * Signatures that don't lie

    * Bodies that are as declarative as possible

## Pure Functions
* These are the foundation of functional programming. These are the most trustworthy\
  of all the functions that don't lie.

