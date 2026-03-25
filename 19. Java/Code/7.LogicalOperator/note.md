```java
class Hello {
    public static void main(String args[]) {
        int x = 7;
        int y = 5;
        int a = 5;
        int b = 9;

        // AND Operators
        boolean and = x > y && a > b;
        System.out.println(and); // false;

        // OR Operators
        boolean or = x > y || a > b;
        System.out.println(or); // true;

        // NOT Operators
        boolean t = true;
        boolean not = !t;
        System.out.println(not); // false;


    }
}
```

### Stack & Heap

All variables are **primitives** (`int`, `boolean`), so everything stays on the **Stack**.

```
After all assignments:

Stack (main frame)
┌──────────────────┐
│ x   = 7         │
│ y   = 5         │
│ a   = 5         │
│ b   = 9         │
│ and  = false    │  ← (7>5) is true, but (5>9) is false → true && false = false
│ or   = true     │  ← (7>5) is true → short-circuits, skips second check
│ t    = true     │
│ not  = false    │  ← !true = false
└──────────────────┘

Heap
┌──────────────────┐
│    (empty)       │
└──────────────────┘
```

> **Note:** Primitives like `int` and `boolean` are stored directly on the Stack. No Heap allocation happens here.

 ## AND / OR
 - AND -> if 1st condition is false it will not check other condition.
 - OR -> if 1st condition is true it will not check other condition.