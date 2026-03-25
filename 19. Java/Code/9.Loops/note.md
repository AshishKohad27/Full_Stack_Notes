```java
class Hello {
    public static void main(String a[]) {
        // while loop
        int i = 0;
        while(i<=4){
            System.out.print("Hello"); // all statements comes in a single line
            System.out.println("Hello "+ i); // every statement come in new line when we print
            i++;
        }
         // Result
        /*
         * Hello 0
         * Hello 1
         * Hello 2
         * Hello 3
         * Hello 4
        */

        // do while
        int i = 0;
        do{ // first do then check for condition
            System.out.println("First Do:"+i);
            i++;
        }while (i<=4);
        // Result
        /*
         * First Do: 0
         * First Do: 1
         * First Do: 2
         * First Do: 3
         * First Do: 4
        */
        // this will work even when condition is false
        // When we want out put atleast for once even if condition on meet on that time we will use DO WHILE LOOP
        int i = 5;
        do{ // first do then check for condition
            System.out.println("First Do:"+i);
            i++;
        }while (i<=4);
         // Result
        /*
         * First Do: 5 // why we are getting this is because we first execute our print then compare with our condition
         * But in normal while its check condition first then execute that why if we put i = 5 in while loop we didn't get any thing
        */

        // for loop
        for(int i = 0; i <= 4; i++) {
            System.out.println("Hello " + i);
        }
        // Result
        /*
         * Hello 0
         * Hello 1
         * Hello 2
         * Hello 3
         * Hello 4
        */
    }
}
```

### Stack & Heap

The loop counter `i` is a **primitive** (`int`), so it lives on the **Stack** and changes value each iteration. Nothing goes on the Heap.

**While loop** — how `i` changes on the Stack:
```
Iteration 0:                Iteration 1:                Iteration 2:
Stack (main)                Stack (main)                Stack (main)
┌──────────┐                ┌──────────┐                ┌──────────┐
│ i = 0    │                │ i = 1    │                │ i = 2    │
└──────────┘                └──────────┘                └──────────┘
prints "Hello 0"            prints "Hello 1"            prints "Hello 2"

Iteration 3:                Iteration 4:                Loop ends:
Stack (main)                Stack (main)                Stack (main)
┌──────────┐                ┌──────────┐                ┌──────────┐
│ i = 3    │                │ i = 4    │                │ i = 5    │
└──────────┘                └──────────┘                └──────────┘
prints "Hello 3"            prints "Hello 4"            5 <= 4 is false → STOP
```

**For loop** — same behavior, `i` is scoped inside the loop:
```
for (int i = 0; i <= 4; i++)

Stack (main)
┌──────────┐
│ i = 0    │ → prints "Hello 0" → i becomes 1
│ i = 1    │ → prints "Hello 1" → i becomes 2
│ i = 2    │ → prints "Hello 2" → i becomes 3
│ i = 3    │ → prints "Hello 3" → i becomes 4
│ i = 4    │ → prints "Hello 4" → i becomes 5 → 5 <= 4 false → STOP
└──────────┘

Heap
┌──────────┐
│ (empty)  │
└──────────┘
```

**Do-while with `i = 5`** — executes once even though condition is false:
```
Stack (main)
┌──────────┐
│ i = 5    │ → prints "First Do: 5" → i becomes 6
│ i = 6    │ → checks 6 <= 4 → false → STOP
└──────────┘
```

> **Note:** Loop counter variables like `i` are primitives stored directly on the Stack. The same memory slot is updated each iteration — no new allocation happens per loop cycle.

### `break` and `continue`
- `break` -- exits the loop immediately
- `continue` -- skips the rest of the current iteration and jumps to the next one

```java
for (int i = 0; i < 5; i++) {
    if (i == 2) continue; // skip when i is 2
    if (i == 4) break;    // stop the loop when i is 4
    System.out.println(i);
}
// Output: 0
//         1
//         3
```
