```java
class Hello {
    public static void main(String args[]) {
        // Relational Operator
        int x = 4;
        int y = 5;

        // 1. Less Than
        boolean lessThan = x < y;
        System.out.println(lessThan); // true;

        // 2. Less Than Equal to
        boolean lessEqualTo = x <= y;
        System.out.println(lessEqualTo); // true;

        // 3. Greater Than
        boolean greaterThan = x > y;
        System.out.println(greaterThan); // false;

        // 4. Greater Than Equal to
        boolean greaterEqualTo = x >= y;
        System.out.println(greaterEqualTo); // false;

        // 5. Equal To
        boolean equalTo = x == y;
        System.out.println(equalTo); // false;

        // 6. Not Equal To
        boolean notEqualTo = x != y;
        System.out.println(notEqualTo); // true;
    }
}
```

### Stack & Heap

All variables here are **primitives** (`int`, `boolean`), so everything lives on the **Stack** only. Nothing is allocated on the Heap.

```
After all assignments:

Stack (main frame)
┌─────────────────────┐
│ x              = 4  │
│ y              = 5  │
│ lessThan       = true  │
│ lessEqualTo    = true  │
│ greaterThan    = false │
│ greaterEqualTo = false │
│ equalTo        = false │
│ notEqualTo     = true  │
└─────────────────────┘

Heap
┌─────────────────────┐
│     (empty)         │
└─────────────────────┘
```

> **Why no Heap?** `int` and `boolean` are primitive types in Java. They are stored directly in the stack frame of the method. Only objects (created with `new`, arrays, Strings, etc.) go on the Heap.
