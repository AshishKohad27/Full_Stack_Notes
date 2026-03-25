```java
class Hello {
    public static void main(String args[]) {
        // Conditional Statement
        int x = 4;
        int y = 5;

        if (x < 5)
            System.out.println("Less than");

        if (x > 5)
            System.out.println("Greater than");
        else
            System.out.println("Less than");

        if (x < 5) {
            System.out.println(x);
            System.out.println("Greater than");
        } else
            System.out.println("Less than");

        // Nested Statements Conditions
        if (x < 5)
            System.out.println("True!!!!");
        else if (x > 5)
            System.out.println("True!!!!");
        else
            System.out.println("True!!!!");

        // Ternormy Operator
        int num = 5;
        boolean result1 = num % 2 == 0 ? true : false;

        // Switch Case
        int n = 5;
        switch (n) {
            case 1:
                System.out.println("Monday");
                break;
            case 2:
                System.out.println("Tuesday");
                break;
            case 3:
                System.out.println("Wednesday");
                break;
            case 4:
                System.out.println("Thursday");
                break;
            case 5:
                System.out.println("Friday");
                break;
            case 6:
                System.out.println("Saturday");
                break;
            case 7:
                System.out.println("Sunday");
                break;
            default:
                System.out.println("Not Match");
                break;
        }
    }
}
```

### Stack & Heap

All variables are **primitives** (`int`, `boolean`), so everything lives on the **Stack**.

```
After all assignments (at end of main):

Stack (main frame)
┌──────────────────────┐
│ x       = 4          │  ← used in if/else checks
│ y       = 5          │
│ num     = 5          │
│ result1 = false      │  ← 5 % 2 == 0 is false, so ternary picks false
│ n       = 5          │  ← matches case 5, prints "Friday"
└──────────────────────┘

Heap
┌──────────────────────┐
│      (empty)         │
└──────────────────────┘
```

How the **if-else chain** evaluates with `x = 4`:
```
Stack snapshot during if-else:

┌──────────────────┐
│ x = 4            │──→  (x < 5)  = true   → prints "Less than"
│                  │──→  (x > 5)  = false  → goes to else
│                  │──→  (x < 5)  = true   → prints x and "Greater than"
│                  │──→  (x < 5)  = true   → prints "True!!!!"
└──────────────────┘
```

> **Note:** All types here (`int`, `boolean`) are primitives. They are stored directly on the Stack. The Heap is not used.

### Switch Fall-Through (common mistake)
If you forget `break`, execution **falls through** to the next case:
```java
int n = 2;
switch (n) {
    case 2:
        System.out.println("Two");   // prints
    case 3:
        System.out.println("Three"); // ALSO prints! (no break above)
        break;
}
// Output: Two
//         Three
```
Always use `break` unless you intentionally want fall-through.