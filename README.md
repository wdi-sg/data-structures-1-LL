# Introduction to Data Structures

## Problem
1. Create an array containing 20000 integers.
2. Use a loop to remove the 2nd element of the array until the array only contains 1 element.
3. Time the operation in step 2. The `benchmark` gem should be available on default installations of Ruby and can be used with the following syntax:

```
Benchmark.bm do |bm|
    puts "Title of test"
    bm.report do
        # Insert your test code here
    end
end
```

## Optimization - Using Another Data Structure
1. Create 2 classes - Emerald and Diamond

2. Each instance of Emerald should hold a `value` (e.g. an integer), as well as variables pointing to two other Emeralds, e.g. `prev` and `next`. An Emerald should be initialized with at least 1 parameter - its value. Its two other variables can take default values of `nil`.

3. Each instance of Diamond should hold just one value for now - an Emerald. A Diamond should be initialized with at least 1 parameter - an Emerald.

Now, write methods for either Diamond or Emerald such that...

4. Emeralds can be added to a Diamond such that...
    - If a Diamond contains only 1 Emerald A, and another Emerald B is added to the Diamond, then one of A's variables, e.g. `next`, should refer to B. At the same time, one of B's variables, e.g. `prev`, should refer to A.
    - If a Diamond contains 2 Emeralds A and B such that A's `next` refers to B (and B's `prev` refers to A), and another Emerald C is added to Diamond, then B's `next` should now refer to C while C's `prev` should refer to B. Thus, the Diamond should look like a chain of Emeralds: A <-> B <-> C.

5. An Emerald can be deleted from a Diamond without breaking the chain. For example, if a Diamond contains a chain of Emeralds A <-> B <-> C, then deleting B should result in the chain becoming A <-> C. That is, A's `next` should now point to C instead of B, and C's `prev` should now point to A instead of B.

6. Finally, create an Emerald with a value of 1, and add it to a Diamond. With the same Diamond, add 19999 other Emeralds, each containing an integer value.

7. Write a loop that removes the 2nd Emerald in the Diamond until only the first Emerald is left.

8. Time the operation in step 7, and compare it to the time that the same operation required when an array was used.

What is this data structure formally called, and what are its advantages and disadvantages over an array or hash?

## Further
Implement methods in either the Diamond or Emerald classes such that...

1. You can search for the first Emerald in a Diamond that contains a given value.
2. You can add a new Emerald after a given Emerald in a Diamond, i.e. somewhere in the middle of the chain.
3. You can search for the last Emerald in a Diamond that contains a given value.
4. The last Emerald in a Diamond's chain always refers to the first, and the first Emerald in turn always refers to the last.
5. Write this exercise in Javascript. Note: You'll want to use either prototypes or classes in Javascript if you decide to do this.
