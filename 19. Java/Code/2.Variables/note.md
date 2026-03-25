```java
package Code;

class variables {
    public static void main(String a[]) {
        // A. Primitive Data Types
        // 1.Interger sub Types
        int num = 5;
        byte by = 127; // last value we can store in bytes
        short sh = 558;
        long l = 5854l; // after any value in long we have to put l at the end

        // 2.Float sub Types :- for point value
        float f = 5.8f;
        double d = 5.8;

        // 3.Character sub Types
        char c = 'k';

        // 4.Boolean sub Types
        boolean b = true;

    }
}

```

### Stack & Heap

All primitive data types are stored directly on the Stack inside the `main()` stack frame. No Heap memory is used here because there are no objects.

```
Stack                                Heap
┌─────────────────────┐
│  main() frame       │              (nothing on heap)
│                     │
│  num  (int)    = 5  │
│  by   (byte)  = 127 │
│  sh   (short) = 558 │
│  l    (long)  = 5854│
│                     │
│  f  (float)  = 5.8  │
│  d  (double) = 5.8  │
│                     │
│  c  (char)   = 'k'  │
│                     │
│  b  (boolean)= true │
└─────────────────────┘
```

> **Key takeaway:** Primitive types (`int`, `byte`, `short`, `long`, `float`, `double`, `char`, `boolean`) are stored entirely on the Stack. They do NOT go to the Heap. Only objects and arrays are stored on the Heap.